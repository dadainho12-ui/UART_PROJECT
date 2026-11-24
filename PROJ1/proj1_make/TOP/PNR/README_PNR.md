# UART PNR 실행 안내

이 디렉터리는 `asic_top` 합성 결과를 사용하는 Innovus **legacy 명령 모드**용입니다.
`-stylus` 모드로 실행하지 마세요. Tcl 구문 및 파일 연결은 로컬에서 검증했지만,
현재 클라우드에는 Innovus/Tempus 및 GPDK045가 없어 실제 배치·배선 검증은 하지 못했습니다.

## 준비 및 실행

```bash
cd PROJ1/proj1_make/TOP/PNR
export GPDK045_ROOT=/실제/경로/GPDK045
# 기본 QRC 위치가 다를 때만 지정
export QRC_TECH_FILE=/실제/경로/gpdk045.tch
tclsh prepare_pnr.tcl
innovus -files all.tcl
```

GUI에서 실행한다면 이 디렉터리에서 Innovus를 시작한 뒤 `source all.tcl`을 사용합니다.
Python 설치는 필요하지 않습니다. `prepare_pnr.tcl`은 Innovus 내장 Tcl로 실행됩니다.
위의 `tclsh` 사전 실행은 선택 사항이며, Innovus에서 0번을 실행하면 자동으로 처리합니다.
`0_InitDesign.tcl`이 준비 스크립트를 자동 실행하므로 생성 파일이 오래된 상태로 진행하지 않습니다.
원본 `../SYN/mapped/asic_top_syn_final.v` 및 `.sdc`는 수정하지 않습니다.

단계별 재시작은 별도 세션에서 `innovus -files 1_PowerPlan.tcl`처럼 실행합니다.
각 단계는 이전 단계의 `.dat`를 복원합니다. `all.tcl`에서는 복원/exit를 생략하고
0→5 단계를 같은 세션에서 실행합니다. 오류는 호출자에게 전달하고 세션은 검토용으로 열어둡니다.
ECO는 기본 흐름에 포함하지 않습니다. Tempus 분석 후 실제 `innovus.eco`를 준비하여
`6_ECO.tcl`을 실행하세요. 최종 GDS는 signoff 완료를 의미하지 않습니다.

## 파일 관계

- `add_pad`: Verilog 전원 패드 선언 조각. 단독 Verilog 모듈이나 Tcl이 아닙니다.
- `prepare_pnr.tcl`: 기존 신호 패드 25개와 IO 배치의 이름/셀을 대조한 뒤,
  **asic_top 모듈 내부**에 전원 패드 16개를 추가합니다.
- `generated/asic_top_pnr.v`: PNR 전용 넷리스트. 재실행 시 동일 입력이면 동일 결과입니다.
- `init.io`: 신호 25개 + 전원 16개, 물리 코너 4개. 코너는 Verilog 논리 인스턴스가 아닙니다.
- `pnr_config.tcl`: 공통 경로 및 출력 디렉터리 설정.
- `asic_top.mmmc.view`: PNR용 `asic_top_50mhz.sdc`, FF/SS 타이밍 라이브러리, GPDK045 QRC 사용.
  기존의 공정명이 다른 `cln28hpl` capacitance table 참조는 제거했습니다.

| 변 | 신호 패드 | 추가 전원 패드 |
|---|---|---|
| left | clk, reset_n, tx_start, uart_rx | PADVDD/PADVSS/PADVDDIOR/PADVSSIOR 각 1개 |
| bottom | tx_data[0:7] | 동일 |
| right | rx_data[0:7] | 동일 |
| top | uart_tx, tx_busy, tx_done, rx_valid, frame_error | 동일 |

신호 패드 이름은 합성 넷리스트의 `u_pad_*`, `GEN_TX_DATA_PAD[n].u_pad_tx_data`,
`GEN_RX_DATA_PAD[n].u_pad_rx_data`를 사용합니다. Verilog escaped identifier의
선행 역슬래시는 IO 파일 이름에는 넣지 않습니다.
`init.io`가 패드 위치의 기준이며 예전 `padNN`에 대한 수동 이동은 제거했습니다.

## Innovus에서 반드시 확인할 항목

1. **공정 파일**: LEF의 PADDI/PADDO/PADVDD/PADVSS/PADVDDIOR/PADVSSIOR,
   padIORINGCORNER, padIORINGFEED* 및 CoreSite 이름/크기를 확인하세요.
   QRC 파일은 실제 배포본과 일치해야 합니다. 기본 경로가 다르면 환경 변수로 지정합니다.
   fast/slow basicCells와 pads_FF/SS 타이밍 라이브러리가 필요합니다.
2. **면적·패드**: die 2000×1999.94µm, die 기준 좌우 여백 350µm / 상하 349.98µm의 시험안입니다.
   `-coreMarginsBy die`로 IO 높이 240µm가 여백에 추가되지 않도록 명시했습니다.
   원점 (0,0), PlacementGrid (0.2,0.19)µm에 맞춘 코어는 1300×1299.98µm입니다.
   사용자 서버에서 확인한 PADDI/PADDO 및 전원 패드는 60×240µm, 코너는 240×240µm입니다.
   IO 시작점 간격은 100µm(패드 사이 40µm)이며 각 변 중앙에 배치합니다.
   left offset 620~1320, bottom/right 420~1520, top 570~1370µm입니다.
   직사각형 치수 계산은 통과했지만 실제 LEF origin/회전/핀/OBS, IO filler,
   CoreSite 그리드와 배선 규칙은 Innovus에서 확인해야 합니다. 아직 최소 면적 확정안은 아닙니다.
   전원 패드 각 종류 4개는 초기 구성이고 전류/ESD/패키지 요구를 보증하지 않습니다.
3. **전원**: Metal11 수평/Metal10 수직의 단일 VDD/VSS 코어 링을 사용합니다.
   링 offset 20µm, 선폭 각 5µm, 간격 5µm입니다. 외부 1000µm 링과 링 사이
   연결용 스트라이프는 제거했습니다. 코어 수직 스트라이프(선폭/간격 5µm,
   set pitch 100µm, start offset 50µm)를 생성하고 ring까지 연장하도록 설정한 뒤
   corePin/padPin을 연결합니다.
   기하학적 계산상 패드 깊이와 링 외곽 사이 여유는 좌우 75µm, 상하 74.98µm입니다.
   빈 포트 전원 패드 선언과 VDD/VSS PG pin 연결은 참고본 방식을 유지합니다.
   실제 PG pin 이름, IO 전원 도메인/전압에 맞는지 확인하세요. 별도 IO 전원이 필요하면
   해당 연결/링을 추가해야 하며 IO 전원을 코어 VDD에 임의로 묶지 않았습니다.
   `verifyConnectivity -type special`로 PG 배선을 검사하며 open/pin 오류를 숨기지 않습니다.
   이 설정은 전류 용량/IR drop이나 실제 연결을 검증한 결과가 아닙니다.
4. **타이밍**: PNR은 `asic_top_50mhz.sdc`의 MAIN_CLOCK **20ns(50MHz)**,
   waveform `{0.0 10.0}`을 사용합니다. RTL의 CLK_FREQ=50MHz와 일치하며
   전력 분석 switching activity 주기도 20ns입니다. 원본 합성 SDC의 8ns 제약은 보존합니다.
   PNR용 SDC는 합성 SDC의 복사본에서 클록 주기/파형만 변경했습니다.
   입력·출력 지연, uncertainty, latency 등 다른 제약은 기존 값을 유지합니다.
   합성 제약이 나중에 변경되면 PNR용 복사본에도 반영해야 합니다.
   기존 SDC의 ideal network/clock latency가 CTS 후 propagated clock 처리와 적합한지도 확인하세요.
5. **최종 검증**: 단계별 timing/DRC/PG 연결 보고서를 검토하고 filler 후 DRC/LVS 및
   추출/타이밍을 다시 확인하세요. Tcl이 종료됐다는 사실만으로 signoff 통과로 판단하지 마세요.
   GDS streamOut에 사용하는 라이브러리 GDS/레이어 매핑은 설치 환경 기준으로 확인해야 합니다.

`clean.tcl`은 기존처럼 **shell의 rm 명령 목록**이며 Tcl source 대상이 아닙니다.
실행하면 보고서/체크포인트/ECO 결과가 삭제되므로 필요한 결과를 먼저 보존하세요.

## 2mm 변경 검증 및 재실행

`tclsh validate_floorplan.tcl`로 저장된 floorPlan, IO offset, 단일 링/스트라이프의
외곽 치수와 서버에서 확인한 placement/manufacturing grid 정렬을 검사합니다. 사용자 제공 셀 크기를 전제로 하며 LEF/DRC 검사를 대체하지 않습니다.
0번과 1번 실행 시에도 이 검사를 자동 실행합니다. Python은 필요하지 않습니다.

크기 변경 전의 `.dat`를 재사용하지 말고 0번부터 다시 실행하세요. 검토용 실행 순서:

```tcl
source 0_InitDesign.tcl
# standalone 실행은 종료하므로 새 Innovus 세션에서:
source 1_PowerPlan.tcl
```

`all.tcl`을 실행하면 후속 placement/CTS/route까지 이어집니다. 먼저 0번과 1번의
reports/init, reports/floorplan, reports/powerplan 및 PG connectivity 메시지를 확인하세요.
이후 placement의 밀도/혼잡도와 timing, 최종 DRC/IR drop을 확인해야 합니다.

## 서버 그리드 오류 반영

서버의 PlacementGrid 원점은 (0,0), X pitch 0.2µm / Y pitch 0.19µm입니다.
ManufacturingGrid는 X/Y 모두 0.005µm입니다. 기존 350µm Y 여백과 2000µm 높이는
PlacementGrid에 맞지 않았고, 기본 IO 기준 여백으로 실제 코어가 약 820µm가 됐습니다.
이번에는 die 기준을 명시하고 Y 경계를 1999.94, 349.98, 1649.96µm로 정렬했습니다.
`-adjustToSite` 이후 실제 die/core 좌표도 조회하여 그리드 불일치 시 filler 삽입 전에 중단합니다.
`reports/floorplan/grid_check.txt`에 실제 Innovus 검사 결과도 저장합니다.

수정 후 반드시 새 세션에서 0번부터 재생성해야 합니다. 저장된 체크포인트에
floorPlan만 재실행하면 기존 IO filler가 남을 수 있습니다. 이전 RN 미연결 경고와
Area IO 전원 패드, VDDPAD25/VSSPAD 연결 문제는 이번 코어 그리드 수정과 별도이며
실제 보고서를 다시 확인해야 합니다. 그리드 옵션을 끄거나 전원 전압을 임의 연결하지 않습니다.
