@echo off
:: --- CONFIGURATION ---
SET "WEB_DIR=C:\Users\Public\Bean_Website"
:: Ensure this matches your specific AppData path
SET "SOURCE_DIR=C:\Users\E7240\AppData\Roaming\MetaQuotes\Terminal\Common\Files"

echo ---------------------------------------------------
echo 15-MINUTE GITHUB SYNC INITIALIZED
echo ---------------------------------------------------

:LOOP
echo.
echo [%DATE% %TIME%] Starting 15-minute update...

:: 1. Navigate to Web Directory
cd /d "%WEB_DIR%"

:: 2. Force copy the latest CSVs from MT5 to ensure fresh data
copy /Y "%SOURCE_DIR%\BEAN_TradeCloseLog.csv" "BEAN_TradeCloseLog.csv" >nul
copy /Y "%SOURCE_DIR%\Live_Signals.csv" "Live_Signals.csv" >nul

:: 3. Git Sequence
git add .
git commit -m "Auto Update: %date% %time%"

:: 4. Push to GitHub
echo Pushing to GitHub...
git push origin main

echo.
echo Update complete.
echo Waiting 15 minutes (900 seconds) for next cycle...
echo ---------------------------------------------------

:: Wait 900 seconds (15 Minutes)
timeout /t 900 /nobreak >nul
goto LOOP