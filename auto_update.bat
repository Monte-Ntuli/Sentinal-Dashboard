@echo off
:: --- CONFIGURATION ---
SET "WEB_DIR=C:\Users\Public\Bean_Website"
:: Ensure this matches your specific AppData path
SET "SOURCE_DIR=C:\Users\E7240\AppData\Roaming\MetaQuotes\Terminal\Common\Files"

echo ---------------------------------------------------
echo 🕐 HOURLY GITHUB SYNC INITIALIZED
echo ---------------------------------------------------

:LOOP
echo.
echo [%DATE% %TIME%] Starting hourly update...

:: 1. Navigate to Web Directory
cd /d "%WEB_DIR%"

:: 2. Force copy the latest CSVs from MT5 to ensure fresh data
copy /Y "%SOURCE_DIR%\BEAN_TradeCloseLog.csv" "BEAN_TradeCloseLog.csv" >nul
copy /Y "%SOURCE_DIR%\Live_Signals.csv" "Live_Signals.csv" >nul

:: 3. Git Sequence
git add .
git commit -m "Hourly Update: %date% %time%"

:: 4. Push to GitHub
echo 🚀 Pushing to GitHub...
git push origin main

echo.
echo ✅ Update complete.
echo 💤 Waiting 1 hour (3600 seconds) for next cycle...
echo ---------------------------------------------------

:: Wait 3600 seconds (1 Hour)
timeout /t 3600 /nobreak >nul
goto LOOP