@ECHO OFF
:: Loop de 10Horas
TITLE INICIALIZACAO

set/a a =0
:comeco
cls
echo %a%
set/a a = %a%+1
timeout 10
if %a% GTR 43200 goto end
start /min call C:\Dados\colab\monitora\get_file.bat
goto comeco
:end
pause>nul
