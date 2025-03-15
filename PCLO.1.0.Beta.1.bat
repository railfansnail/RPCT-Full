@echo off

echo ======================================== PCLO 1.0 Beta 1 [자동예약종료/로그삭제] =======================================
echo.
echo.
choice /C 123 /N /M "(예약종료만 하려면 1 입력 / 이벤트 뷰어 로그 삭제만 하려면 2 입력 / 둘 다 실행하려면 3 입력)"
if %errorlevel% equ 1 goto :mode1
if %errorlevel% equ 2 goto :mode2
if %errorlevel% equ 3 goto :mode3

cls

choice /t 1 /d y >   nul

:mode1
echo 예약종료 기능입니다.
echo.
echo.
@set /p miniute="언제 종료할지 분 단위로 입력해주세요: "
@set /a second=miniute*60
@echo. %miniute%분 뒤에 PC를 예약종료합니다.
@echo.
@echo.
@echo.
@shutdown -s -t %second%
@echo.
@echo.
@echo 예약종료 설정이 완료되었습니다. 잠시 후 자동으로 PCLO가 종료됩니다.
choice /t 3 /d y >   nul

exit

:mode2
echo 이벤트 뷰어 로그 삭제 기능입니다.
choice /t 1 /d y >   nul
echo.
echo.
wevtutil.exe cl Application
wevtutil.exe cl System
wevtutil.exe cl Security
wevtutil.exe cl Setup
wevtutil.exe cl ForwardedEvents
echo.
echo.
echo.
echo 이벤트 뷰어의 모든 로그 삭제가 완료되었습니다. 잠시 후 자동으로 PCLO가 종료됩니다.
choice /t 3 /d y >   nul

exit

:mode3
echo 예약종료 및 이벤트 뷰어 로그 삭제 기능입니다.
echo.
echo.
echo 먼저 로그 삭제를 진행합니다.
choice /t 3 /d y >   nul
echo.
echo.
wevtutil.exe cl Application
wevtutil.exe cl System
wevtutil.exe cl Security
wevtutil.exe cl Setup
wevtutil.exe cl ForwardedEvents
echo.
echo.
choice /t 3 /d y >   nul
cls
echo 이제 예약종료 설정을 시작합니다.
echo.
echo.
@set /p miniute="언제 종료할지 분 단위로 입력해주세요: "
@set /a second=miniute*60
@echo. %miniute%분 뒤에 PC를 예약종료합니다.
@echo.
@echo.
@echo.
@shutdown -s -t %second%
@echo.
@echo.
@echo 이벤트 뷰어의 모든 로그 삭제와 예약종료 설정이 완료되었습니다. 잠시 후 자동으로 PCLO가 종료됩니다.
choice /t 3 /d y >   nul

exit