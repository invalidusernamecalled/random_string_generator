REM Key Generator
if exist latestkeys.txt (for /f "delims=" %%i in (latestkeys.txt) do set realset=%%i) else (echo: please make sure you are running bonniewala.bat)