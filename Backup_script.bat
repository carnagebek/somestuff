@echo off
cls
color 17
echo  ---------------------------
echo      Script para Backups
echo  ---------------------------
echo  [1] - Iniciar Backup
echo  [2] - Sair
echo  ---------------------------

set /p opcao= Digite uma Opcao :
if "%opcao%" == "1" goto :option1
if "%opcao%" == "2" goto :option2

:option1


echo.
set/p origem=Informe o endereco da origem da copia(Ex: C:\Copia):
echo.
set/p destino=Informe o endereco de destino da copia(Ex: C:\Copia):
echo.
echo Pressione enter para iniciar a copia...
pause >nul

echo.
@echo off
robocopy %origem% %destino% /e /eta /LOG:logcopia.txt /tee >nul
echo.
echo COPIA REALIZADA COM SUCESSO!
echo.
pause >nul

:option2
exit






