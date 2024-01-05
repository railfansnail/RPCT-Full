rem PCLO �����ڵ�


if not exist C:\PCBPBackup\%date%\music mkdir C:\PCBPBackup\%date%\music
set source=C:\Users\%user%\music
set target=C:\PCBPBackup\%date%\music
xcopy %source% %target% /s /e /h /i /y



rem PDNS �����ڵ�


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
echo ���Ͻô� �۾� ��ȣ(1~15) �Է� �� ����(Enter) Ű�� ��������.
echo.
echo === PCOT 4 ����ȭ �� �׸� ===
echo.
echo [1] Windows ���� ��� ���� Ȯ�� (����)
echo [2] Windows ���� ��� ���� Ȯ�� (����)
echo [3] Windows ���� ��� �ջ� ���� (���ͳ� ���� �ʿ�)
echo [4] Windows �ý��� ���� �ջ� ���� (���ͳ� ���� �ʿ�)
echo [5] Windows DNS ĳ�� ���� (���ͳ� ���� �� ����ϼ���)
echo [6] Windows ��Ʈ��ũ ���� �ӵ� ���̱� (���ͳ� ���� �� ����ϼ���)
echo [7] Windows �ӽ� ���� ���� (������ ���� ����, ������� ����ȭ)
echo [8] Windows �ִ�������� ��Ȱ��ȭ (������� ����ȭ)
echo.
echo.
echo === PCLO 1 ��������, �α׻��� �� �׸� ===
echo.
echo [9] �������Ḹ
echo [10] �̺�Ʈ ��� �α� ������
echo [11] ��ü ����
echo.
echo.
echo === PCPB 1 ��� �� �׸� ===
echo.
echo [12] ����� ���� ���
echo [13] ������ ��� ���� ��ġ ����
echo.
echo.
echo === PDNS 2 DNS �ڵ����� �� �׸� ===
echo.
echo [14] PDNS ����
echo.
echo.
echo === ��Ÿ �۾� ===
echo.
echo [15] ���α׷� ����
echo.
echo.
set menu=
set /p menu= [ �۾���ȣ �Է� ] : 
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
echo ��ũ ���� ���μ����� �� PC���� �ʿ� ���� ������ �����ϰ� �ֽ��ϴ� . . .
echo.
echo �� â�� ���� ������. �������� ���� ������ �߻��� �� �ֽ��ϴ�.
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
@set /p miniute="���� �������� �� ������ �Է����ּ���: "
@set /a second=miniute*60
echo.
@echo. %miniute%�� �ڿ� PC�� ���������մϴ�.
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
echo �̺�Ʈ ����� ��� �α� ������ �Ϸ�Ǿ����ϴ�.
choice /t 3 /d y >   nul
goto start





:a11
cls
@echo off&color 1f&mode con cols=70 lines=23
echo ���� �α� ������ �����մϴ�.
wevtutil.exe cl Application
wevtutil.exe cl System
wevtutil.exe cl Security
wevtutil.exe cl Setup
wevtutil.exe cl ForwardedEvents
echo.
echo ���� �������� ������ �����մϴ�.
echo.
@set /p miniute="���� �������� �� ������ �Է����ּ���: "
@set /a second=miniute*60
@echo.
@echo. %miniute%�� �ڿ� PC�� ���������մϴ�.
@shutdown -s -t %second%
choice /t 3 /d y >   nul
goto start





:a12
@echo off&color 1f&mode con cols=70 lines=23
cls
echo ����� ���� ����� �����մϴ�.
echo.
timeout /t 2 /nobreak > NUL
echo 1�ܰ�. �ٿ�ε� ������ ����մϴ�.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\downloads mkdir C:\PCBPBackup\%date%\downloads
set source=C:\Users\%user%\downloads
set target=C:\PCBPBackup\%date%\downloads
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 2�ܰ�. ���� ������ ����մϴ�.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\documents mkdir C:\PCBPBackup\%date%\documents
set source=C:\Users\%user%\documents
set target=C:\PCBPBackup\%date%\documents
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 3�ܰ�. ���� ������ ����մϴ�.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\pictures mkdir C:\PCBPBackup\%date%\pictures
set source=C:\Users\%user%\pictures
set target=C:\PCBPBackup\%date%\pictures
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 4�ܰ�. ���� ������ ����մϴ�.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\music mkdir C:\PCBPBackup\%date%\music
set source=C:\Users\%user%\music
set target=C:\PCBPBackup\%date%\music
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 5�ܰ�. ������ ������ ����մϴ�.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\videos mkdir C:\PCBPBackup\%date%\videos
set source=C:\Users\%user%\videos
set target=C:\PCBPBackup\%date%\videos
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.

echo 6�ܰ�. ����ȭ�� ������ ����մϴ�.
timeout /t 2 /nobreak > NUL
if not exist C:\PCBPBackup\%date%\desktop mkdir C:\PCBPBackup\%date%\desktop
set source=C:\Users\%user%\desktop
set target=C:\PCBPBackup\%date%\desktop
xcopy %source% %target% /s /e /h /i /y
timeout /t 1 /nobreak > NUL
echo.
echo.
echo ����� �������ϴ�. �޴� ȭ������ ���ư��ϴ�.
echo �۾��� �Ϸ��߽��ϴ�. ȭ�鿡 ǥ�õ� �ڵ带 �˾ƺ����� �����ڿ��� �����Ͻʽÿ�.
echo [PCBP-110xS1000]
pause
goto start





:a13
@echo off&color 1f&mode con cols=70 lines=23
cls
echo ���� ��� ������ ����: %backuptarget%
echo.
echo ���� ��� ������ ����Ǵ� ����: %backupfolder%
timeout /t 5 /nobreak > NUL
goto start





:a14
cls
echo �ڽ��� ��� ���� ��ġ�� �����ϼ���.
echo.
echo [1] �̴��� (���� ����)
echo [2] Wi-Fi (���� ����)
echo.
echo.
set /p choice=:

if "!choice!"=="1" (
  goto ethernet
) else if "!choice!"=="2" (
  goto wifi
) else (
  echo �߸� �Է��ϼ̽��ϴ�.
  goto cho
)


:wifi
cls
echo.
echo PDNS�� ���������� ����Ǿ����ϴ�.
echo.
echo �Ʒ����� ������ DNS �ּҸ� �����ϼ���.
echo DNS over HTTPS
echo DNS over TLS
echo �� ���� ����Ϸ��� �������� ������ �ٲ��ּž� �մϴ�.
echo.
echo ���� ���� ���� �޽����� ������ ���� �����Դϴ�. DNS �ּҴ� ��� ���������� ����ǿ��� ���� �����ʽÿ�.
echo.
echo.
echo [1] Google Public DNS (�⺻���� ���⿡ ��õ)
echo [2] Cloudflare DNS (���������� ���⿡ ��õ)
echo [3] AdGuard DNS (����, ���� �� �ǽ� ����)
echo [4] Cisco OpenDNS (���������� ���⿡ ��õ)
echo [5] AdGuard DNS ��ȣ ��� (����, ������ ����, ��������ġ)
echo [6] Cloudflare DNS ��ȣ ��� (�ֿ���, ������ ����)
set /p choice=:

if "!choice!"=="1" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_1! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_1_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_1! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_1_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_1!�� !DNS_ipv6_1!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_1_b!�� !DNS_ipv6_1_b!�Դϴ�.
) else if "!choice!"=="2" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_2! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_2_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_2! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_2_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_2!�� !DNS_ipv6_2!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_2_b!�� !DNS_ipv6_2_b!�Դϴ�.
) else if "!choice!"=="3" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_3! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_3_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_3! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_3_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_3!�� !DNS_ipv6_3!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_3_b!�� !DNS_ipv6_3_b!�Դϴ�.
) else if "!choice!"=="4" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_4! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_4_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_4! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_4_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_4!�� !DNS_ipv6_4!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_4_b!�� !DNS_ipv6_4_b!�Դϴ�.
) else if "!choice!"=="5" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_5! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_5_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_5! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_5_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_2!�� !DNS_ipv6_2!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_5_b!�� !DNS_ipv6_5_b!�Դϴ�.
) else if "!choice!"=="6" (
  netsh interface ipv4 set dns name="Wi-Fi" static !DNS_ipv4_6! primary
  netsh interface ipv4 add dns name="Wi-Fi" !DNS_ipv4_6_b! index=2
  netsh interface ipv6 set dns name="Wi-Fi" static !DNS_ipv6_6! primary
  netsh interface ipv6 add dns name="Wi-Fi" !DNS_ipv6_6_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_6!�� !DNS_ipv6_6!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_6_b!�� !DNS_ipv6_6_b!�Դϴ�.
) else (
  echo �߸� �Է��ϼ̽��ϴ�.
   goto wifi
)

echo ���������� ����Ǿ����ϴ�. HTTPS / TLS ������ �Ϸ��� �������� �������ּ���.
choice /t 3 /d y >   nul
goto start

:ethernet
cls
echo.
echo PDNS�� ���������� ����Ǿ����ϴ�.
echo.
echo �Ʒ����� ������ DNS �ּҸ� �����ϼ���.
echo DNS over HTTPS
echo DNS over TLS
echo �� ���� ����Ϸ��� �������� ������ �ٲ��ּž� �մϴ�.
echo.
echo ���� ���� ���� �޽����� ������ ���� �����Դϴ�. DNS �ּҴ� ��� ���������� ����ǿ��� ���� �����ʽÿ�.
echo.
echo.
echo [1] Google Public DNS (�⺻���� ���⿡ ��õ)
echo [2] Cloudflare DNS (���������� ���⿡ ��õ)
echo [3] AdGuard DNS (����, ���� �� �ǽ� ����)
echo [4] Cisco OpenDNS (���������� ���⿡ ��õ)
echo [5] AdGuard DNS ��ȣ ��� (����, ������ ����, ��������ġ)
echo [6] Cloudflare DNS ��ȣ ��� (�ֿ���, ������ ����)
set /p choice=:

if "!choice!"=="1" (
  netsh interface ipv4 set dns name="�̴���" static !DNS_ipv4_1! primary
  netsh interface ipv4 add dns name="�̴���" !DNS_ipv4_1_b! index=2
  netsh interface ipv6 set dns name="�̴���" static !DNS_ipv6_1! primary
  netsh interface ipv6 add dns name="�̴���" !DNS_ipv6_1_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_1!�� !DNS_ipv6_1!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_1_b!�� !DNS_ipv6_1_b!�Դϴ�.
) else if "!choice!"=="2" (
  netsh interface ipv4 set dns name="�̴���" static !DNS_ipv4_2! primary
  netsh interface ipv4 add dns name="�̴���" !DNS_ipv4_2_b! index=2
  netsh interface ipv6 set dns name="�̴���" static !DNS_ipv6_2! primary
  netsh interface ipv6 add dns name="�̴���" !DNS_ipv6_2_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_2!�� !DNS_ipv6_2!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_2_b!�� !DNS_ipv6_2_b!�Դϴ�.
) else if "!choice!"=="3" (
  netsh interface ipv4 set dns name="�̴���" static !DNS_ipv4_3! primary
  netsh interface ipv4 add dns name="�̴���" !DNS_ipv4_3_b! index=2
  netsh interface ipv6 set dns name="�̴���" static !DNS_ipv6_3! primary
  netsh interface ipv6 add dns name="�̴���" !DNS_ipv6_3_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_3!�� !DNS_ipv6_3!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_3_b!�� !DNS_ipv6_3_b!�Դϴ�.
) else if "!choice!"=="4" (
  netsh interface ipv4 set dns name="�̴���" static !DNS_ipv4_4! primary
  netsh interface ipv4 add dns name="�̴���" !DNS_ipv4_4_b! index=2
  netsh interface ipv6 set dns name="�̴���" static !DNS_ipv6_4! primary
  netsh interface ipv6 add dns name="�̴���" !DNS_ipv6_4_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_4!�� !DNS_ipv6_4!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_4_b!�� !DNS_ipv6_4_b!�Դϴ�.
) else if "!choice!"=="5" (
  netsh interface ipv4 set dns name="�̴���" static !DNS_ipv4_5! primary
  netsh interface ipv4 add dns name="�̴���" !DNS_ipv4_5_b! index=2
  netsh interface ipv6 set dns name="�̴���" static !DNS_ipv6_5! primary
  netsh interface ipv6 add dns name="�̴���" !DNS_ipv6_5_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_2!�� !DNS_ipv6_2!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_5_b!�� !DNS_ipv6_5_b!�Դϴ�.
) else if "!choice!"=="6" (
  netsh interface ipv4 set dns name="�̴���" static !DNS_ipv4_6! primary
  netsh interface ipv4 add dns name="�̴���" !DNS_ipv4_6_b! index=2
  netsh interface ipv6 set dns name="�̴���" static !DNS_ipv6_6! primary
  netsh interface ipv6 add dns name="�̴���" !DNS_ipv6_6_b! index=2
  cls
  echo ��Ʈ��ũ !network!�� DNS�� !DNS_ipv4_6!�� !DNS_ipv6_6!�� ����Ǿ����ϴ�.
  echo ���� DNS �ּҴ� !DNS_ipv4_6_b!�� !DNS_ipv6_6_b!�Դϴ�.
) else (
  echo �߸� �Է��ϼ̽��ϴ�.
   goto ethernet
)
echo.
echo ���������� ����Ǿ����ϴ�. HTTPS / TLS ������ �Ϸ��� �������� �������ּ���.
choice /t 3 /d y >   nul
goto start





:a15
cls
exit