@echo off
setlocal


REM === Create new folder for output ===
set WORKDIR=encrypted_output
if not exist "%WORKDIR%" mkdir "%WORKDIR%"


REM ==== MOVE INTO WORKING FOLDER ====
cd /d "%WORKDIR%"

echo Using working directory: %WORKDIR%
echo.


REM ==== ACCESS ENCRYPTED FILE ====
echo.
echo Please enter the encrypted file name (inside encrypted_output folder):
set /p ENCFILE=Filename: 

echo.
echo Decrypting %ENCFILE%.txt.enc...

REM ==== DECRYPT USING pkeyutl ====
echo Decrypting data.txt...
openssl pkeyutl -decrypt -inkey private.pem -in "%ENCFILE%.txt.enc" -out decryptedData.txt

echo.
echo Showing decrypted text:
echo.

REM ==== PRINT THE PUBLIC KEY FOR SHARING ====
type "decryptedData.txt"

echo.
echo.

pause
