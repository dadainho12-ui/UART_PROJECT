#!/usr/bin/env python3
"""Validate UART pad mapping and build a separate PNR netlist (no source edits)."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT.parent / 'SYN/mapped/asic_top_syn_final.v'


def prepare(root=ROOT, source=SOURCE):
    text = source.read_text()
    # This helper deliberately supports the checked-in Genus Verilog format only.
    tops = list(re.finditer(r'\bmodule\s+asic_top\s*\(', text))
    if len(tops) != 1:
        raise ValueError('Expected exactly one asic_top module')
    end = re.search(r'\bendmodule\b', text[tops[0].end():])
    if end is None:
        raise ValueError('asic_top has no endmodule')
    insert_at = tops[0].end() + end.start()
    body = text[tops[0].start():insert_at]
    pattern = r'\b(PADDI|PADDO)\s+(\\\S+|[A-Za-z_]\w*)\s*\('
    signals = [(name.lstrip('\\'), cell) for cell, name in re.findall(pattern, body)]
    if len(signals) != 25 or len(dict(signals)) != 25:
        raise ValueError('Expected 25 unique existing UART signal pads')
    if sum(cell == 'PADDI' for _, cell in signals) != 12:
        raise ValueError('Expected 12 input pads')
    pad_text = (root / 'add_pad').read_text()
    declarations = re.sub(r'//[^\n]*', '', pad_text)
    pad_pattern = r'\b(PADVDD|PADVSS|PADVDDIOR|PADVSSIOR)\s+(\w+)\s*\(\s*\)\s*;'
    power = [(name, cell) for cell, name in re.findall(pad_pattern, declarations)]
    if re.sub(pad_pattern, '', declarations).strip():
        raise ValueError('Unsupported declaration in add_pad')
    if len(power) != 16 or len(dict(power)) != 16:
        raise ValueError('Expected 16 unique power pads')
    for side in ('left', 'right', 'top', 'bottom'):
        expected = {f'u_{side}_{suffix}': cell for suffix, cell in
                    [('vdd', 'PADVDD'), ('vss', 'PADVSS'),
                     ('vddior', 'PADVDDIOR'), ('vssior', 'PADVSSIOR')]}
        if not expected.items() <= dict(power).items():
            raise ValueError(f'Missing power group on {side}')
    for name, _ in power:
        if re.search(r'\b' + re.escape(name) + r'\s*\(', body):
            raise ValueError(f'Power pad already exists in source: {name}')
    expected = dict(signals + power)
    if len(expected) != 41:
        raise ValueError('Signal/power instance name collision')
    io = (root / 'init.io').read_text()
    entries = re.findall(r'\(inst\s+name="([^"]+)"\s+cell="([^"]+)"(?:\s+offset=(\d+))?\s*\)', io)
    if len(entries) != 45 or len({name for name, _, _ in entries}) != 45:
        raise ValueError('Expected 41 unique pads and 4 corners in init.io')
    corners = {f'CORNER_{s}': 'padIORINGCORNER' for s in ('TL', 'TR', 'BL', 'BR')}
    if {name: cell for name, cell, _ in entries} != expected | corners:
        raise ValueError('init.io instance/cell mapping differs from netlist + add_pad')
    for side in ('left', 'right', 'top', 'bottom'):
        block = re.search(r'\(' + side + r'\s*\n(.*?)\n    \)', io, re.S)
        if block is None:
            raise ValueError(f'Missing IO side {side}')
        offsets = [int(x) for x in re.findall(r'offset=(\d+)', block[1])]
        if not offsets or offsets != sorted(set(offsets)) or offsets[0] < 300 or offsets[-1] > 3730:
            raise ValueError(f'Invalid offsets on {side}')
        if any(b - a < 70 for a, b in zip(offsets, offsets[1:])):
            raise ValueError(f'Pad pitch below reference 70um on {side}')
    output = root / 'generated/asic_top_pnr.v'
    output.parent.mkdir(exist_ok=True)
    result = text[:insert_at] + '\n// PNR-only power pad additions\n' + pad_text + '\n' + text[insert_at:]
    if not output.exists() or output.read_text() != result:
        output.write_text(result)
    print('PASS: 12 input + 13 output + 16 power pads; 4 physical corners; IO mapping matches')
    print(f'PNR netlist: {output}')
    return output


if __name__ == '__main__':
    prepare()
