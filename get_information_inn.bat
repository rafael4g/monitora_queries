@ECHO OFF

title EXECUTANDO %1 %2

SET VAR_NOMEARQUIVO=%1
SET VAR_ANOMES=%2

set user="user_plsql"
set pass="pass_plsql"

SET LOCAL_PATH=C:\Dados\colab\monitora\_data
SET FILE=%LOCAL_PATH%\controle_data.txt

SET LOCAL_QUERIES=C:\Dados\colab\queries\GENERAL
SET QUERY_NAME=%LOCAL_QUERIES%\%VAR_NOMEARQUIVO%.sql
:: Start Tratamento para nome do arquivo e anomes
set #=%VAR_NOMEARQUIVO%
set length=0
set less_ext=2
:loop
if defined # (
    rem Encurtar a corda por um caractere
    set #=%#:~1%
    rem incrementa a string contando a variavel %length%
    set /A length += 1
    rem repetir ate string ser null
    goto loop
)
set /A new_length_ddd=%length% - %less_ext%
call set nr_ddd=%%VAR_NOMEARQUIVO:~%new_length_ddd%,2%%

FOR /F "tokens=1-7 delims=|" %%A in ('TYPE %FILE%') DO (
  IF %VAR_ANOMES% EQU %%A CALL :process %%A %%B %%C %%D %%E %%F %%G
)

:process
echo %1
IF %VAR_ANOMES% EQU %1 (
SQLPLUS %user%/%pass%@INSTANCIA_PLSQL @%QUERY_NAME% %1 %2 %3 %4 %5 %6 %7 %nr_ddd%
COPY C:\Dados\colab\extractions\%VAR_NOMEARQUIVO%_%VAR_ANOMES%.csv \\rede\%VAR_NOMEARQUIVO%_%VAR_ANOMES%.csv
GOTO end
EXIT
)

:end
exit

::SET ANOMES=%1
::SET DT_INI_TIPO1=%2
::SET DT_FIM_TIPO1=%3
::SET DT_INI_MES_LESS1=%4
::SET DT_INI_MES_PLUS1=%5
::SET DT_FIM_MES_PLUS2=%6
::SET DT_INI_MES_PLUS3_02=%7
