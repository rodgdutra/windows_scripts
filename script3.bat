SET c=0
:: inicializando o contador

:while
:: entrando no loop

ECHO checking internet connection

ping 8.8.8.8 -n 1 -w 1000 | findstr /r /c:"[0-9] *ms"
:: manda um pacote para 8.8.8.8

cls
:: limpa a tela do terminal

if %errorlevel% == 0 (ECHO off && ECHO Com internet && SET /A c=0 && ECHO sem quedas de conexao a %c%s ) else (
ECHO off && ECHO Sem internet && SET /A c=c+1 && ECHO sem conexao a %c%s)
:: testa se o comando ping retornou erros e com base nisso conclui se a maquina está conectada ou não na internet

IF /I "%c%" EQU "100" (ECHO desliga a maquina && SHUTDOWN /s /t 0)
:: checa se a contagem chegou em 100 segundos sem internet, caso sim desliga a maquina   


TIMEOUT 1
:: conta um segundo

GOTO :while
