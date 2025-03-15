@echo off
set user=%username%
set backuptarget=c:\%user%
set backupfolder=c:\PCBPBackup
if not exist C:\PCBPBackup mkdir C:\PCBPBackup
echo.
echo.
echo PCBP 백업 툴을 초기화 합니다  . . . (0%)
timeout /t 1 /nobreak > NUL
cls
echo.
echo.
echo PCBP 백업 툴을 초기화 합니다 . . . (37%)
timeout /t 1 /nobreak > NUL
cls
echo.
echo.
echo PCBP 백업 툴을 초기화 합니다 . . . (75%)
timeout /t 1 /nobreak > NUL
cls
echo.
echo.
echo PCBP 백업 툴을 초기화 합니다 . . . (100%)
timeout /t 3 /nobreak > NUL
cls
echo.
echo.
timeout /t 3 /nobreak > NUL

:menu
echo 원하는 항목을 선택하십시오.
echo.
echo [1] 지금 백업
echo [2] 백업 종료
echo [3] 설정된 백업 위치 알아보기
echo.
choice /c 123 /n /m ""

if errorlevel 3 goto folder
if errorlevel 2 goto exit
if errorlevel 1 goto backup

:backup
color 3F
timeout /t 1 /nobreak > NUL
echo.
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
color 2F
echo 백업이 끝났습니다. 메뉴 화면으로 돌아갑니다.
echo 작업을 완료했습니다. 화면에 표시된 코드를 알아보려면 제작자에게 문의하십시오.
echo [PCBP-110xS1000]
pause
color 0F
cls
goto menu





:exit
color 6F
timeout /t 1 /nobreak > NUL
echo.
echo 백업을 종료합니다.
echo.
echo.
echo 작업을 완료했습니다. 화면에 표시된 코드를 알아보려면 제작자에게 문의하십시오.
echo [PCBP-110xC2000]
timeout /t 10 /nobreak > NUL
exit




:folder
color 6F
timeout /t 1 /nobreak > NUL
echo.
echo 현재 백업 설정된 폴더: %backuptarget%
echo.
echo 현재 백업 파일이 저장되는 폴더: %backupfolder%
echo.
echo.
echo 작업을 완료했습니다. 화면에 표시된 코드를 알아보려면 제작자에게 문의하십시오.
echo [PCBP-310xS1000]
pause
color 0F
cls
goto menu