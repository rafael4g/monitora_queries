@echo off

title Robo Extracao 'Pl/Sql'
CD _rsi2

cls
:main

FOR %%A IN (*.txt) DO CALL :process %%A


:process
SET arquivo_original=%1
:: Start Tratamento para nome do arquivo e anomes
set #=%arquivo_original%
set length=0
set less_arquivo=11
set less=10
set less_ext=3
:loop
if defined # (
    rem Encurtar a corda por um caractere
    set #=%#:~1%
    rem incrementa a string contando a variavel %length%
    set /A length += 1
    rem repetir ate string ser null
    goto loop
)
set /A new_length_arquivo=%length% - %less_arquivo%
set /A new_length=%length% - %less%
set /A new_length_ext=%length% - %less_ext%
call set n_anomes=%%arquivo_original:~%new_length%,6%%
call set n_arquivo=%%arquivo_original:~0,%new_length_arquivo%%%
call set n_ext=%%arquivo_original:~%new_length_ext%,3%%

IF "%n_ext%" EQU "txt" (
goto timed
) ELSE (goto end)

goto :eof

:timed
timeout 1
IF "%1" NEQ "" (
IF %n_ext% EQU txt IF %n_arquivo:~0,2% NEQ P- ( 
echo %1
IF NOT EXIST %1 goto end
del /q %1  
start call D:\Dados\bat-project\get_information.bat %n_arquivo% %n_anomes%
goto main
) 
)

:end
EXIT




::IF %n_arquivo% EQU AA_GROSS (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main            
::) 
::
::IF %n_arquivo% EQU AA_PORTABILIDADE (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU GROSS_REGIONAIS (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU MASTERATP_REGIONAIS (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU MIGRA_RSI (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU MKT_CHURN (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PEP_GROSS_RSI (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PEP_MASTER_RSI (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PEP_MIGRA_RSI (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PEP_MIX_CONTA (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PEP_MIX_CONTROLE (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PEP_PORTABILIDADE_NTC_VEND (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PEP_RECARGA_INSERCAO_PRE_II (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PME_CHURN (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PME_GROSS (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PME_MIG_IN (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PME_MIG_OUT (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PME_PORTABILIDADE (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PME_PS8 (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PORTABILIDADE_REGIONAIS (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU PORTABILIDADE_RSI (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU RECARGA_COMBO_PRE (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU RECARGA_D1 (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU RECARGA_GROSS_PRE (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU RECARGA_INSERCAO (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU RECARGA_INSERCAO_PRE_II (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU RECARGA_INSERIDORES (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU RECARGA_PORTABILIDADE (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU RECARGA_QUALIDADE_D1D30D60_SILENT (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU UPDOWN_RSI (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU VAREJO_GROSS (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU VAREJO_INSERCAO (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU VAREJO_MIGRA_TRAF (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU VAREJO_PORTABILIDADE (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 
::
::IF %n_arquivo% EQU VAREJO_TRAFEGO (     
::    del /q %1
::    copy NUL P-%arquivo_original% 
::    goto main               
::) 














::pause

::start call D:\Dados\bat-project\teste3.bat %1
::start call D:\Dados\bat-project\teste3.bat %1

::pause > nul

::EQU – Igual a
::NEQ - Não é igual a
::LSS – Menor que
::LEQ – Menor ou igual a
::GTR – Maior que
::GEQ – Maior ou igual a