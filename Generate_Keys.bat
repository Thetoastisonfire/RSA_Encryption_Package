@echo off
setlocal


REM === Create new folder for output ===
set WORKDIR=encrypted_output
if not exist "%WORKDIR%" mkdir "%WORKDIR%"


REM ==== MOVE INTO WORKING FOLDER ====
cd /d "%WORKDIR%"

echo Using working directory: %WORKDIR%
echo.


REM ==== GENERATE PRIVATE KEY ====
echo Generating private key...
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private.pem


REM ==== GENERATE PUBLIC KEY ====
echo Generating public key...
openssl pkey -in private.pem -pubout -out public.pem

echo.
echo ==== DONE! ====
echo Created: private.pem, public.pem
echo.

REM ==== PRINT THE PUBLIC KEY FOR SHARING ====
type public.pem
echo.

pause
