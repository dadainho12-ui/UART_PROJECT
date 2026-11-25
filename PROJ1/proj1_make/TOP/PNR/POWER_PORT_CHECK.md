# 패드에서 코어 전원 링으로 연결하는 PORT 분류 시험

참고 Cortex-M0의 1_PowerPlan.tcl과 all.tcl은 `sroute -connect {padPin}`으로
VDD/VSS 패드에서 링으로 연결합니다. 이 방식은 유지합니다.

UART 서버 실행에서는 코어 전원 배선은 생성됐지만 padPin 배선은 0 wire였으며,
VSS CORE/AREAIO pad pin을 찾을 수 없다는 IMPSR-1256과 open 201개가 보고됐습니다.
verifyConnectivity도 VDD/VSS special-route open을 보고했으므로 실행 종료/저장만으로
전원 연결 완료로 판단할 수 없습니다. 참고본의 open/pin 검사 억제 옵션을 추가해
이 결과를 숨기지 않습니다.

서버에서 추출한 현재 PNR LEF에는 PADVDD/PADVSS의 macro CLASS PAD POWER는 있으나
주 공급 핀 PORT의 CLASS CORE는 없습니다. 이번 시험안은 설치 PDK를 보존하면서
generated/giolib045_pnr.lef에 아래 PORT 분류를 추가합니다.

- PADVDD의 PIN VDD: 각 PORT에 `CLASS CORE ;`
- PADVSS의 PIN VSS: 각 PORT에 `CLASS CORE ;`

매크로 CLASS PAD POWER 처리도 유지합니다. 다른 핀, USE/전압, SITE, ORIGIN,
SIZE, LAYER/RECT/OBS와 접속 net은 변경하지 않습니다. 원본에 예상하지 못한
PORT CLASS가 있으면 덮어쓰지 않고 중단합니다. 추출 출력 마지막의 Metal1~11 목록은 OBS일 수 있으므로,
PIN/PORT 경계를 확인하지 않고 공급 핀의 접근 레이어로 해석하지 않습니다.

모의 LEF로 변경 범위와 원본 보존을 검사했으며, 실제 PDK/Innovus 검증은 아직입니다.
이 설정은 해당 셀을 주변 IO 링에서 코어 전원으로 연결하는 용도의 시험 물리 뷰입니다.
최종 셀 사용 적합성/전원·ESD 조건과 IO 도메인 연결은 별도로 검증해야 합니다.

## 서버 검증 순서

1. 새 Innovus 세션에서 0번을 실행하여 LEF 복사본과 InitDesign.dat 재생성.
2. 다른 새 세션에서 1번 실행. 미리 restoreDesign을 실행하지 않음.
3. padPin sroute의 IO ports routed/open, created wires/vias와 VDD/VSS special-route
   open을 확인. 실행 로그 전체와 reports/powerplan 보고서를 보존.
4. 신호망은 미배치·미배선 단계이므로 신호 관련 위반과 실제 PG open을 구분.

0번/1번의 실제 재실행 전에는 이 변경이 IMPSR-1256을 해결했다고 판단하지 않습니다.
VDDPAD25/VSSPAD filler 입력 및 VDDIOR/VSSIOR의 net 매핑은 이번 변경 대상이 아닙니다.
앞서 작성한 미승인 tie-cell 초안과도 별개입니다.
