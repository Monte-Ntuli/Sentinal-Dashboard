@echo off
:: CONFIGURATION
SET "WEB_DIR=C:\Users\Public\Bean_Website"
SET "SOURCE_DIR=C:\Users\E7240\AppData\Roaming\MetaQuotes\Terminal\Common\Files"

echo ---------------------------------------------------
echo ☁️ GITHUB AUTO-SYNC INITIALIZED
echo ---------------------------------------------------

:LOOP
cd /d "%WEB_DIR%"

:: 1. Force copy the latest CSVs from MT5 just to be sure
copy /Y "%SOURCE_DIR%\BEAN_TradeCloseLog.csv" "BEAN_TradeCloseLog.csv" >nul
copy /Y "%SOURCE_DIR%\Live_Signals.csv" "Live_Signals.csv" >nul

:: 2. Add files to Git staging area
git add .

:: 3. Commit with a timestamp
git commit -m "Auto-Update: %date% %time%"

:: 4. Push to GitHub (This makes it live)
echo 🚀 Pushing to GitHub...
git push origin main

echo.
echo ✅ Data sent! GitHub Pages will update in ~30-60 seconds.
echo ⏳ Waiting 60 seconds before next update...
echo ---------------------------------------------------

:: Wait 60 seconds (GitHub might block you if you push faster than this)
timeout /t 60 >nul
goto LOOP