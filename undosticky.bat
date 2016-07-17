REM puts sticky keys back to normal
REM this file is for testing purposes only, in the final version the WinPirate script will do it

takeown /f c:\windows\system32\sethc.exe
takeown /f c:\windows\system32\sethcold.exe
icacls c:\windows\system32\sethc.exe /grant %username%:F /q /t
icacls c:\windows\system32\sethc.exe /grant %username%:F /q /t
ren sethc.exe sethcbad.exe
ren sethcold.exe sethc.exe