@echo off
echo ================================================
echo  Chopper App — Sync + Push to GitHub
echo ================================================
echo [1/3] Syncing from Google Drive...
python "..\sync_data.py"
if %errorlevel% neq 0 (
    echo ERROR: sync_data.py failed.
    pause & exit /b 1
)
echo.
echo [2/3] Copying keytakeaway_data.js...
copy /Y "..\keytakeaway_data.js" "keytakeaway_data.js"
if %errorlevel% neq 0 (
    echo ERROR: copy failed.
    pause & exit /b 1
)
echo.
echo [3/3] Pushing to GitHub...
git add -A
git commit -m "sync %date%"
git push
echo.
echo Done! เปิด iPhone แล้ว refresh ได้เลย (index.html / status.html)
pause
