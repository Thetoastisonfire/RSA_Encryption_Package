@echo off
setlocal


REM === Create new folder for output ===
set WORKDIR=encrypted_output
if not exist "%WORKDIR%" mkdir "%WORKDIR%"


REM ==== MOVE INTO WORKING FOLDER ====
cd /d "%WORKDIR%"

echo Using working directory: %WORKDIR%
echo.


REM ==== Paste recipient's public key ====
echo Please enter the file name of your desired public key!!! (inside encrypted_output folder):
set /p ENCFILE=Filename: 
echo.

echo Using public key at %ENCFILE%.pem...


REM ==== Enter text to encrypt ====
echo Type the text you want to encrypt. Press CTRL+Z then Enter when finished:
copy con data.txt
echo.
echo Text saved as data.txt
echo.


REM ==== ENCRYPT USING pkeyutl ====
echo Encrypting data.txt...
openssl pkeyutl -encrypt -inkey "%ENCFILE%.pem" -pubin -in data.txt -out data.txt.enc

echo.
echo ==== DONE! ====
echo Created:  their_public.pem, data.txt, data.txt.enc
echo.

REM ==== PRINT THE PUBLIC KEY FOR SHARING ====
type public.pem
echo.

pause
