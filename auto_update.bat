@echo off
:: --- CONFIGURATION ---
SET "WEB_DIR=C:\Users\Public\Bean_Website"

echo ---------------------------------------------------
echo MULTI-NODE GITHUB SYNC INITIALIZED (LOOP MODE)
echo ---------------------------------------------------

:LOOP
echo.
echo [%DATE% %TIME%] Starting update cycle...

:: 1. Navigate to Web Directory
cd /d "%WEB_DIR%"

:: 2. Save local changes from this specific laptop
git add .
git commit -m "Auto Update: %date% %time%"

:: 3. Safely pull and stack any new files from the other laptop
echo Pulling latest changes from the central database...
git pull --rebase origin main

:: 4. Push everything combined back up to GitHub
echo Pushing to GitHub...
git push origin main

echo.
echo Update complete.
echo Waiting 15 minutes (900 seconds) for next cycle...
echo ---------------------------------------------------

:: Wait 900 seconds (15 Minutes)
timeout /t 900 /nobreak >nul
goto LOOP