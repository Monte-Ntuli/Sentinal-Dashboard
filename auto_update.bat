@echo off
SET "BASE=C:\Users\E7240\AppData\Roaming\MetaQuotes\Terminal\Common\Files"
SET "WEB=C:\Users\Public\Bean_Website"

echo 🔄 Syncing Sentinel Data...
copy /Y "%BASE%\BEAN_TradeCloseLog.csv" "%WEB%\BEAN_TradeCloseLog.csv"
copy /Y "%BASE%\Live_Signals.csv" "%WEB%\Live_Signals.csv"

echo 🚀 Pushing to Dashboard...
cd /d "%WEB%"
git add .
git commit -m "Auto-update: %date% %time%"
git push origin main
timeout /t 5