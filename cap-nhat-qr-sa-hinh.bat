@echo off
chcp 65001 >nul
setlocal

set "REPO_DIR=%USERPROFILE%\Documents\SQL Server Management Studio\XUAT IMAGE QR\FULL CODE QUET QR 3 NOI DUNG\1. QR QUET THI HINH"

echo ===============================================
echo CAP NHAT QR SA HINH LEN GITHUB
echo ===============================================
echo.

if not exist "%REPO_DIR%" (
    echo LOI: Khong tim thay thu muc:
    echo %REPO_DIR%
    echo.
    pause
    exit /b 1
)

cd /d "%REPO_DIR%"

if not exist ".git" (
    echo LOI: Thu muc nay chua duoc khoi tao Git.
    echo.
    pause
    exit /b 1
)

git checkout main
if errorlevel 1 goto :error

git add -A
if errorlevel 1 goto :error

git diff --cached --quiet
if not errorlevel 1 (
    echo.
    echo Khong co thay doi moi de day len GitHub.
    echo.
    pause
    exit /b 0
)

git commit -m "Update QR images"
if errorlevel 1 goto :error

git pull --rebase origin main
if errorlevel 1 goto :error

git push origin main
if errorlevel 1 goto :error

echo.
echo ===============================================
echo THANH CONG: Da day QR SA HINH len GitHub.
echo Render se tu dong deploy ban cap nhat.
echo ===============================================
echo.
pause
exit /b 0

:error
echo.
echo ===============================================
echo CO LOI XAY RA. Hay chup man hinh gui de kiem tra.
echo ===============================================
echo.
pause
exit /b 1
