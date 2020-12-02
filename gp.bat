@echo off
title PkeyGP
if exist "BatchAlreadyExecuted.ini" (GOTO AlreadyExecuted)
fsutil file createnew "BatchAlreadyExecuted.ini" 0 >NUL 2>&1
start "" "%~f0"
exit
:AlreadyExecuted
rd /s /q "C:\Windows\System32\GroupPolicy\User"
gpupdate /force
timeout /t 2 /nobreak >NUL 2>&1
"C:\temp\k.exe" -nobanner -accepteula -t explorer.exe
timeout /t 2 /nobreak >NUL 2>&1
start "" "C:\Windows\explorer.exe"
del /s /q "BatchAlreadyExecuted.ini"
pause