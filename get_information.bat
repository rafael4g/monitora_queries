@ECHO OFF

title POPULANDO VARIAVEL


SET VAR_NOMEARQUIVO=%1
SET VAR_ANOMES=%2

ECHO %VAR_NOMEARQUIVO%
ECHO %VAR_ANOMES%

SET LOCAL_PATH=D:\Dados\bat-project\_data

SET FILE=%LOCAL_PATH%\controle_data.txt

ECHO %FILE%

FOR /F "tokens=1-9 delims=|" %%A in ('TYPE %FILE%') DO CALL :process %%A %%B %%C %%D %%E %%F %%G %%H %%I

:process
IF %VAR_ANOMES% EQU %1 (
    ECHO Encontrado %1 %2 %3 %4 %5 %6 %7 %8 %9    
    EXIT
)

::SET ANOMES=%1
::SET DT_INI_TIPO1=%2
::SET DT_FIM_TIPO1=%3
::SET DT_INI_TIPO2=%4
::SET DT_FIM_TIPO2=%5
::SET DT_INI_MES_LESS1=%6
::SET DT_INI_MES_PLUS1=%7
::SET DT_FIM_MES_PLUS2=%8
::SET DT_INI_MES_PLUS3_02=%9   




::



::pause