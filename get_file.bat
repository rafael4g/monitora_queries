@echo off

title PEGAR ARQUIVO

SET PATHLOCALARQUIVOS="X:\_rsi2"
pushd %PATHLOCALARQUIVOS%

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

echo teste_extencao
IF "%n_ext%" EQU "txt" GOTO timed

:timed
echo esse %1

IF "%1"=="" set set novo=0%1& Goto livrar

IF %n_ext% EQU txt goto valida

IF NOT EXIST %1 goto end

:valida
timeout 1
IF %n_ext% EQU txt (
IF EXIST %1.ini goto end
IF NOT EXIST %1 goto end
del /q %1
copy NUL %arquivo_original%.ini
::novo inn
IF "%n_arquivo:~0,4%"=="INN_" goto proc_inn
::atual dwh
start /min call C:\Dados\colab\monitora\get_information.bat %n_arquivo% %n_anomes%
EXIT
)

:proc_inn
start /min call C:\Dados\colab\monitora\get_information_inn.bat %n_arquivo% %n_anomes%
EXIT

:livrar
echo sair %novo%
exit

:end
EXIT

goto :eof
::EQU – Igual a
::NEQ - Não é igual a
::LSS – Menor que
::LEQ – Menor ou igual a
::GTR – Maior que
::GEQ – Maior ou igual a
