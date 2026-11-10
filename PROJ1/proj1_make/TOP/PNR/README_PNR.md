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
python3 prepare_pnr.py
innovus -files all.tcl
```

GUI에서 실행한다면 이 디렉터리에서 Innovus를 시작한 뒤 `source all.tcl`을 사용합니다.
Python 3가 Innovus 프로세스의 PATH에도 있어야 합니다.
`0_InitDesign.tcl`이 준비 스크립트를 자동 실행하므로 생성 파일이 오래된 상태로 진행하지 않습니다.
원본 `../SYN/mapped/asic_top_syn_final.v` 및 `.sdc`는 수정하지 않습니다.

단계별 재시작은 별도 세션에서 `innovus -files 1_PowerPlan.tcl`처럼 실행합니다.
각 단계는 이전 단계의 `.dat`를 복원합니다. `all.tcl`에서는 복원/exit를 생략하고
0→5 단계를 같은 세션에서 실행합니다. 오류는 호출자에게 전달하고 세션은 검토용으로 열어둡니다.
ECO는 기본 흐름에 포함하지 않습니다. Tempus 분석 후 실제 `innovus.eco`를 준비하여
`6_ECO.tcl`을 실행하세요. 최종 GDS는 signoff 완료를 의미하지 않습니다.

## 파일 관계

- `add_pad`: Verilog 전원 패드 선언 조각. 단독 Verilog 모듈이나 Tcl이 아닙니다.
- `prepare_pnr.py`: 기존 신호 패드 25개와 IO 배치의 이름/셀을 대조한 뒤,
  **asic_top 모듈 내부**에 전원 패드 16개를 추가합니다.
- `generated/asic_top_pnr.v`: PNR 전용 넷리스트. 재실행 시 동일 입력이면 동일 결과입니다.
- `init.io`: 신호 25개 + 전원 16개, 물리 코너 4개. 코너는 Verilog 논리 인스턴스가 아닙니다.
- `pnr_config.tcl`: 공통 경로 및 출력 디렉터리 설정.
- `asic_top.mmmc.view`: 기존 SDC, FF/SS 타이밍 라이브러리, GPDK045 QRC 사용.
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
2. **면적·패드**: 참고본의 die 4030×4030µm, core margin 1200µm를 유지한 시작안입니다.
   UART 면적에 최적화한 크기는 아닙니다. IO offset은 300µm부터 280µm 간격이며,
   실제 LEF 크기/회전/코너/IO filler 배치의 합법성을 `checkDesign`에서 확인해야 합니다.
   전원 패드 각 종류 4개는 초기 구성이고 전류/ESD/패키지 요구를 만족한다는 보장은 없습니다.
3. **전원**: 기존 PowerPlan의 VDD/VSS 연결 및 Metal10/11 링/스트라이프를 유지했습니다.
   빈 포트 전원 패드 선언은 참고본과 같은 global PG 연결 방식을 전제로 합니다.
   실제 LEF/Liberty의 PG pin 이름, 코어·IO 전원 도메인과 전압을 확인하세요.
   별도 IO 전원이 필요한 라이브러리라면 해당 net/PG pin 연결 및 링을 추가해야 합니다.
   임의로 IO 전원을 코어 VDD에 묶지 않았습니다. `verifyConnectivity` 결과를 검토하세요.
4. **타이밍**: 기존 합성 SDC는 MAIN_CLOCK **8ns(125MHz)** 입니다.
   RTL의 CLK_FREQ=50MHz와 다릅니다. 이번 수정에서는 타이밍 요구를 임의 변경하지 않았습니다.
   실제 보드 목표에 따라 SDC, baud parameter, power activity 주기를 함께 검토하세요.
   기존 SDC의 ideal network/clock latency가 CTS 후 propagated clock 처리와 적합한지도 확인하세요.
5. **최종 검증**: 단계별 timing/DRC/PG 연결 보고서를 검토하고 filler 후 DRC/LVS 및
   추출/타이밍을 다시 확인하세요. Tcl이 종료됐다는 사실만으로 signoff 통과로 판단하지 마세요.
   GDS streamOut에 사용하는 라이브러리 GDS/레이어 매핑은 설치 환경 기준으로 확인해야 합니다.

`clean.tcl`은 기존처럼 **shell의 rm 명령 목록**이며 Tcl source 대상이 아닙니다.
실행하면 보고서/체크포인트/ECO 결과가 삭제되므로 필요한 결과를 먼저 보존하세요.
