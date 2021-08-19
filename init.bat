@ECHO OFF
:: Loop de 10Horas
TITLE processamento

set/a a =0
:comeco
cls
echo %a%
set/a a = %a%+1
timeout 4
if %a% GTR 43200 goto end
start call D:\Dados\bat-project\get_file.bat
goto comeco
:end
pause>nul



