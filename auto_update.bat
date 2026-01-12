@echo off
echo ---------------------------------------------------
echo      BEAN SENTINEL - AUTO WEBSITE UPDATE
echo ---------------------------------------------------

:: 1. Define Paths
SET "SOURCE=C:/Users/E7240/AppData/Roaming/MetaQuotes/Terminal/Common/Files/"
SET "DEST=C:\Users\Public\Bean_Website\BEAN_TradeCloseLog.csv"
SET "REPO=C:\Users\Public\Bean_Website"
SET "SIG_SOURCE=C:\Users\E7240\AppData\Roaming\MetaQuotes\Terminal\Common\Files\Live_Signals.csv"
SET "SIG_DEST=C:\Users\Public\Bean_Website\Live_Signals.csv"

copy /Y "%SIG_SOURCE%" "%SIG_DEST%"
copy /Y "C:\Users\E7240\AppData\Roaming\MetaQuotes\Terminal\Common\Files\Live_Signals.csv" "C:\Users\Public\Bean_Website\Live_Signals.csv"

:: 2. Copy the latest log file to the website folder
echo Copying latest trade logs...
copy /Y "%SOURCE%" "%DEST%"

:: 3. Git Commands
echo Pushing to GitHub...
cd /d "%REPO%"
git add .
git commit -m "Auto-update: %date% %time%"
git push origin main

echo ---------------------------------------------------
echo      UPDATE COMPLETE.
echo ---------------------------------------------------
timeout /t 5