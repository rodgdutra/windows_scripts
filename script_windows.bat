SET c=0
:while
ECHO checking internet connection
ping google.com -n 1 -w 1000
cls
if errorlevel 1 (ECHO off && ECHO sem internet && SET /A c=c+1 && ECHO %c%) else (ECHO off && ECHO com internet && SET /A c=0 && ECHO %c%)
IF /I "%c%" EQU "100" (ECHO desliga a maquina && SHUTDOWN /s /t 0)
TIMEOUT 1
GOTO :while

