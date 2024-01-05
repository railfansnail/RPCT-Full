rem PCLO 설정코드


if not exist C:\PCBPBackup\%date%\music mkdir C:\PCBPBackup\%date%\music
set source=C:\Users\%user%\music
set target=C:\PCBPBackup\%date%\music
xcopy %source% %target% /s /e /h /i /y



rem PDNS 설정코드


setlocal enabledelayedexpansion

for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| findstr /c:"SSID"') do (
  set network=%%a
  set network=!network:~1!
)

set DNS_ipv4_1=8.8.8.8
set DNS_ipv6_1=2001:4860:4860::8888
set DNS_ipv4_2=1.1.1.1
set DNS_ipv6_2=2606:4700:4700::1111
set DNS_ipv4_3=94.140.14.14
set DNS_ipv6_3=2a10:50c0::ad1:ff
set DNS_ipv4_4=208.67.222.222
set DNS_ipv6_4=2620:119:35::35
set DNS_ipv4_5=94.140.14.15
set DNS_ipv6_5=2a10:50c0::bad1:ff
set DNS_ipv4_6=1.1.1.3
set DNS_ipv6_6=2606:4700:4700::1113

set DNS_ipv4_1_b=8.8.4.4
set DNS_ipv6_1_b=2001:4860:4860::8844
set DNS_ipv4_2_b=1.0.0.1
set DNS_ipv6_2_b=2606:4700:4700::1001
set DNS_ipv4_3_b=94.140.15.15
set DNS_ipv6_3_b=2a10:50c0::ad2:ff
set DNS_ipv4_4_b=208.67.220.220
set DNS_ipv6_4_b=2620:119:53::53
set DNS_ipv4_5_b=94.140.15.16
set DNS_ipv6_5_b=2a10:50c0::bad2:ff
set DNS_ipv4_6_b=1.0.0.3
set DNS_ipv6_6_b=2606:4700:4700::1003




title RPCT-Full Edition (CLI V1.0)
:start
@echo off&color 1f&mode con cols=70 lines=50
cls

echo.
echo RPCT-Full Edition (CLI V1.0)
echo.
echo 원하시는 작업 번호(1~15) 입력 후 엔터(Enter) 키를 누르세요.
echo.
echo === PCOT 4 최적화 툴 항목 ===
echo.
echo [1] Windows 구성 요소 상태 확인 (간단)
echo [2] Windows 구성 요소 상태 확인 (정밀)
echo [3] Windows 구성 요소 손상 복구 (인터넷 연결 필요)
echo [4] Windows 시스템 파일 손상 복구 (인터넷 연결 필요)
echo [5] Windows DNS 캐시 정리 (인터넷 느릴 때 사용하세요)
echo [6] Windows 네트워크 수신 속도 높이기 (인터넷 느릴 때 사용하세요)
echo [7] Windows 임시 파일 제거 (쓰레기 파일 제거, 저장공간 최적화)
echo [8] Windows 최대절전모드 비활성화 (저장공간 최적화)
echo.
echo.
echo === PCLO 1 예약종료, 로그삭제 툴 항목 ===
echo.
echo [9] 예약종료만
echo [10] 이벤트 뷰어 로그 삭제만
echo [11] 전체 실행
echo.
echo.
echo === PCPB 1 백업 툴 항목 ===
echo.
echo [12] 사용자 폴더 백업
echo [13] 설정된 백업 폴더 위치 보기
echo.
echo.
echo === PDNS 2 DNS 자동변경 툴 항목 ===
echo.
echo [14] PDNS 실행
echo.
echo.
echo === 기타 작업 ===
echo.
echo [15] 프로그램 종료
echo.
echo.
set menu=
set /p menu= [ 작업번호 입력 ] : 
if "%menu%" == "1" goto a1
if "%menu%" == "2" goto a2
if "%menu%" == "3" goto a3
if "%menu%" == "4" goto a4
if "%menu%" == "5" goto a5
if "%menu%" == "6" goto a6
if "%menu%" == "7" goto a7
if "%menu%" == "8" goto a8
if "%menu%" == "9" goto a9
if "%menu%" == "10" goto a10
if "%menu%" == "11" goto a11
if "%menu%" == "12" goto a12
if "%menu%" == "13" goto a13
if "%menu%" == "14" goto a14
if "%menu%" == "15" goto a15

goto start




:a1
cls
@echo off&color 1f&mode con cols=70 lines=23
DISM.exe /online /cleanup-image /checkhealth
choice /t 3 /d y >   nul
goto start





:a2
cls
@echo off&color 1f&mode con cols=70 lines=23
DISM.exe /online /cleanup-image /scanhealth
choice /t 3 /d y >   nul
goto start





:a3
cls
@echo off&color 1f&mode con cols=70 lines=23
DISM.exe /online /cleanup-image /restorehealth
choice /t 3 /d y >   nul
goto start





:a4
cls
@echo off&color 1f&mode con cols=70 lines=23
sfc /scannow
choice /t 3 /d y >   nul
goto start





:a5
cls
@echo off&color 1f&mode con cols=70 lines=23
ipconfig /flushdns
choice /t 3 /d y >   nul
goto start





:a6
cls
@echo off&color 1f&mode con cols=70 lines=23
netsh interface tcp set global autotuninglevel=highlyrestricted
choice /t 3 /d y >   nul
goto start





:a7
cls
@echo off&color 1f&mode con cols=70 lines=23
echo 디스크 정리 프로세스가 이 PC에서 필요 없는 파일을 제거하고 있습니다 . . .
echo.
echo 이 창을 닫지 마세요. 예측하지 못한 오류가 발생할 수 있습니다.
cleanmgr.exe
choice /t 3 /d y >   nul
goto start





:a8
cls
@echo off&color 1f&mode con cols=70 lines=23
powercfg -h off
choice /t 3 /d y >   nul
goto start





:a9
cls
@echo off&color 1f&mode con cols=70 lines=23
@set /p miniute="언제 종료할지 분 단위로 입력해주세요: "
@set /a second=miniute*60
echo.
@echo. %miniute%분 뒤에 PC를 예약종료합니다.
@shutdown -s -t %second%
choice /t 3 /d y >   nul
goto start





:a10
cls
@echo off&color 1f&mode con cols=70 lines=23
wevtutil.exe cl Application
wevtutil.exe cl System
wevtutil.exe cl Security
wevtutil.exe cl Setup
wevtutil.exe cl ForwardedEvents
echo.
echo 이벤트 뷰어의 모든 로그 삭제가 완료되었습니다.
choice /t 3 /d y >   nul
goto start





:a11
cls
@echo off&color 1f&mode con cols=70 lines=23
echo 먼저 로그 삭제를 진행합니다.
wevtutil.exe cl Application
wevtutil.exe cl System
wevtutil.exe cl Security
wevtutil.exe cl Setup
wevtutil.exe cl ForwardedEvents
echo.
echo 이제 예약종료 설정을 시작합니다.
echo.
@set /p miniute="언제 종료할지 분 단위로 입력해주세요: "
@set /a second=miniute*60
@echo.
@echo. %miniute%분 뒤에 PC를 예약종료합니다.
@shutdown -s -t %second%
choice /t 3 /d y >   nul
goto start





:a12
@echo off&color 1f&mode con cols=70 lines=23
cls
echo 사용자 폴더 백업을 시작합니다.
echo.
timeout /t 2 /nobreak > NUL
echo 1단계. 다운로드 폴더를 백업합니다.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\downloads mkdir C:\PCBPBackup\%date%\downloads
set source=C:\Users\%user%\downloads
set target=C:\PCBPBackup\%date%\downloads
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 2단계. 문서 폴더를 백업합니다.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\documents mkdir C:\PCBPBackup\%date%\documents
set source=C:\Users\%user%\documents
set target=C:\PCBPBackup\%date%\documents
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 3단계. 사진 폴더를 백업합니다.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\pictures mkdir C:\PCBPBackup\%date%\pictures
set source=C:\Users\%user%\pictures
set target=C:\PCBPBackup\%date%\pictures
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 4단계. 음악 폴더를 백업합니다.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\music mkdir C:\PCBPBackup\%date%\music
set source=C:\Users\%user%\music
set target=C:\PCBPBackup\%date%\music
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 5단계. 동영상 폴더를 백업합니다.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\videos mkdir C:\PCBPBackup\%date%\videos
set source=C:\Users\%user%\videos
set target=C:\PCBPBackup\%date%\videos
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 6단계. 바탕화면 폴더를 백업합니다.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\desktop mkdir C:\PCBPBackup\%date%\desktop
set source=C:\Users\%user%\desktop
set target=C:\PCBPBackup\%date%\desktop
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.
echo 백업이 끝났습니다. 메뉴 화면으로 돌아갑니다.
echo 작업을 완료했습니다. 화면에 표시된 코드를 알아보려면 제작자에게 문의하십시오.
echo [PCBP-110xS1000]
pause
goto start





:a13
@echo off&color 1f&mode con cols=70 lines=23
cls
echo 현재 백업 설정된 폴더: %backuptarget%
echo.
echo 현재 백업 파일이 저장되는 폴더: %backupfolder%
timeout /t 5 /nobreak > NUL
goto start





:a14
cls
echo 자신이 사용 중인 장치를 선택하세요.
echo.
echo [1] 이더넷 (유선 연결)
echo [2] Wi-Fi (무선 연결)
echo.
echo.
set /p choice=:

if "!choice!"=="1" (
  goto ethernet
) else if "!choice!"=="2" (
  goto wifi
) else (
  echo 잘못 입력하셨습니다.
  goto cho
)


:wifi
cls
echo.
echo PDNS가 정상적으로 실행되었습니다.
echo.
echo 아래에서 변경할 DNS 주소를 선택하세요.
echo DNS over HTTPS
echo DNS over TLS
echo 이 둘을 사용하려면 수동으로 설정을 바꿔주셔야 합니다.
echo.
echo 변경 도중 오류 메시지가 나오는 것은 정상입니다. DNS 주소는 모두 정상적으로 변경되오니 착오 없으십시오.
echo.
echo.
echo [1] Google Public DNS (기본으로 쓰기에 추천)
echo [2] Cloudflare DNS (보조용으로 쓰기에 추천)
echo [3] AdGuard DNS (광고, 추적 및 피싱 차단)
echo [4] Cisco OpenDNS (보조용으로 쓰기에 추천)
echo [5] AdGuard DNS 보호 모드 (광고, 성인웹 차단, 세이프서치)
echo [6] Cloudflare DNS 보호 모드 (멀웨어, 성인웹 차단)
set /p choice=:

if "!choice!"=="1" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_1! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_1_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_1! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_1_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_1!과 !DNS_ipv6_1!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_1_b!과 !DNS_ipv6_1_b!입니다.
) else if "!choice!"=="2" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_2! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_2_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_2! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_2_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_2!과 !DNS_ipv6_2!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_2_b!과 !DNS_ipv6_2_b!입니다.
) else if "!choice!"=="3" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_3! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_3_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_3! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_3_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_3!과 !DNS_ipv6_3!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_3_b!과 !DNS_ipv6_3_b!입니다.
) else if "!choice!"=="4" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_4! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_4_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_4! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_4_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_4!과 !DNS_ipv6_4!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_4_b!과 !DNS_ipv6_4_b!입니다.
) else if "!choice!"=="5" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_5! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_5_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_5! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_5_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_2!과 !DNS_ipv6_2!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_5_b!과 !DNS_ipv6_5_b!입니다.
) else if "!choice!"=="6" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_6! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_6_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_6! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_6_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_6!과 !DNS_ipv6_6!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_6_b!과 !DNS_ipv6_6_b!입니다.
) else (
  echo 잘못 입력하셨습니다.
   goto wifi
)

echo 성공적으로 변경되었습니다. HTTPS / TLS 설정을 하려면 수동으로 설정해주세요.
choice /t 3 /d y >   nul
goto start

:ethernet
cls
echo.
echo PDNS가 정상적으로 실행되었습니다.
echo.
echo 아래에서 변경할 DNS 주소를 선택하세요.
echo DNS over HTTPS
echo DNS over TLS
echo 이 둘을 사용하려면 수동으로 설정을 바꿔주셔야 합니다.
echo.
echo 변경 도중 오류 메시지가 나오는 것은 정상입니다. DNS 주소는 모두 정상적으로 변경되오니 착오 없으십시오.
echo.
echo.
echo [1] Google Public DNS (기본으로 쓰기에 추천)
echo [2] Cloudflare DNS (보조용으로 쓰기에 추천)
echo [3] AdGuard DNS (광고, 추적 및 피싱 차단)
echo [4] Cisco OpenDNS (보조용으로 쓰기에 추천)
echo [5] AdGuard DNS 보호 모드 (광고, 성인웹 차단, 세이프서치)
echo [6] Cloudflare DNS 보호 모드 (멀웨어, 성인웹 차단)
set /p choice=:

if "!choice!"=="1" (
  netsh interface ipv4 set dns name="이더넷" static !DNS_ipv4_1! primary
  netsh interface ipv4 add dns name="이더넷" !DNS_ipv4_1_b! index=2
  netsh interface ipv6 set dns name="이더넷" static !DNS_ipv6_1! primary
  netsh interface ipv6 add dns name="이더넷" !DNS_ipv6_1_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_1!과 !DNS_ipv6_1!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_1_b!과 !DNS_ipv6_1_b!입니다.
) else if "!choice!"=="2" (
  netsh interface ipv4 set dns name="이더넷" static !DNS_ipv4_2! primary
  netsh interface ipv4 add dns name="이더넷" !DNS_ipv4_2_b! index=2
  netsh interface ipv6 set dns name="이더넷" static !DNS_ipv6_2! primary
  netsh interface ipv6 add dns name="이더넷" !DNS_ipv6_2_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_2!과 !DNS_ipv6_2!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_2_b!과 !DNS_ipv6_2_b!입니다.
) else if "!choice!"=="3" (
  netsh interface ipv4 set dns name="이더넷" static !DNS_ipv4_3! primary
  netsh interface ipv4 add dns name="이더넷" !DNS_ipv4_3_b! index=2
  netsh interface ipv6 set dns name="이더넷" static !DNS_ipv6_3! primary
  netsh interface ipv6 add dns name="이더넷" !DNS_ipv6_3_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_3!과 !DNS_ipv6_3!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_3_b!과 !DNS_ipv6_3_b!입니다.
) else if "!choice!"=="4" (
  netsh interface ipv4 set dns name="이더넷" static !DNS_ipv4_4! primary
  netsh interface ipv4 add dns name="이더넷" !DNS_ipv4_4_b! index=2
  netsh interface ipv6 set dns name="이더넷" static !DNS_ipv6_4! primary
  netsh interface ipv6 add dns name="이더넷" !DNS_ipv6_4_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_4!과 !DNS_ipv6_4!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_4_b!과 !DNS_ipv6_4_b!입니다.
) else if "!choice!"=="5" (
  netsh interface ipv4 set dns name="이더넷" static !DNS_ipv4_5! primary
  netsh interface ipv4 add dns name="이더넷" !DNS_ipv4_5_b! index=2
  netsh interface ipv6 set dns name="이더넷" static !DNS_ipv6_5! primary
  netsh interface ipv6 add dns name="이더넷" !DNS_ipv6_5_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_2!과 !DNS_ipv6_2!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_5_b!과 !DNS_ipv6_5_b!입니다.
) else if "!choice!"=="6" (
  netsh interface ipv4 set dns name="이더넷" static !DNS_ipv4_6! primary
  netsh interface ipv4 add dns name="이더넷" !DNS_ipv4_6_b! index=2
  netsh interface ipv6 set dns name="이더넷" static !DNS_ipv6_6! primary
  netsh interface ipv6 add dns name="이더넷" !DNS_ipv6_6_b! index=2
  cls
  echo 네트워크 !network!의 DNS가 !DNS_ipv4_6!과 !DNS_ipv6_6!로 변경되었습니다.
  echo 보조 DNS 주소는 !DNS_ipv4_6_b!과 !DNS_ipv6_6_b!입니다.
) else (
  echo 잘못 입력하셨습니다.
   goto ethernet
)
echo.
echo 성공적으로 변경되었습니다. HTTPS / TLS 설정을 하려면 수동으로 설정해주세요.
choice /t 3 /d y >   nul
goto start





:a15
cls
exit