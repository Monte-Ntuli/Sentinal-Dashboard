@echo off
:: 1. Source: Where MT5 saves files (Check your MT5 -> File -> Open Data Folder -> Up to Terminal -> Common -> Files)
SET "SOURCE=C:\Users\E7240\AppData\Roaming\MetaQuotes\Terminal\Common\Files"

:: 2. Destination: Where your index.html is located
SET "DEST=C:\Users\Public\Bean_Website"

:: Create dest if missing
if not exist "%DEST%" mkdir "%DEST%"

echo ---------------------------------------------------
echo 🔄 SYNCING SENTINEL DATA...
echo Source: %SOURCE%
echo Dest:   %DEST%
echo ---------------------------------------------------

:LOOP
:: Copy logs from MT5 to Website folder
copy /Y "%SOURCE%\BEAN_TradeCloseLog.csv" "%DEST%\BEAN_TradeCloseLog.csv" >nul
copy /Y "%SOURCE%\Live_Signals.csv" "%DEST%\Live_Signals.csv" >nul

:: Update every 3 seconds
timeout /t 3 /nobreak >nul
goto LOOP