@echo off
echo ================================================
echo  Chopper App — Sync + Push to GitHub
echo ================================================
echo [1/2] Syncing from Google Drive...
python "%~dp0sync_data.py"
if %errorlevel% neq 0 (
    echo ERROR: sync_data.py failed.
    pause & exit /b 1
)
echo.
echo [2/2] Pushing to GitHub...
git add -A
git commit -m "sync %date%"
git push
echo.
echo Done! Refresh on iPhone / desktop (index.html / status.html)
pause
