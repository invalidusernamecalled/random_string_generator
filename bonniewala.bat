@echo off
echo. RUNNING bonniewala....
:loop
echo [%time%]::
set realset=aBcDXyZzY019754JjKlLmABCDEFGabcdefg0123456789HIJKLMNOPhijklmnopQR0123456789STUVWXYZqrstuvwxyzaBcDXyZzY019754JjKlLmABCDEFGabcdefg0123456789HIJKLMNOPhijklmnopQR0123456789STUVWXYZqrstuvwxyz

for /f "delims=" %%i in ('powershell -Command "$string = \"%realset%\"; -join ($string.ToCharArray() | Get-Random -Count $string.Length)"') do echo "%%i">latestkeys.txt
timeout 5 >NUL
goto loop
endlocal
