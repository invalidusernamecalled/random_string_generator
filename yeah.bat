@echo off
set realset=">/<~@#$*(){}[]\|:;?.,ABCDEFGabcdefg0123456789HIJKLMNOPhijklmnopQR0123456789STUVWXYZqrstuvwxyz"
set number=16
set numrealset=93
Setlocal enabledelayedexpansion
for /l %%a in (1,1,%numrealset%) do set setchr[%%a]=!realset:~%%a,1!
:repeat
set result=
set rand_lenth=
set lenth=0
call :setrand
for /l %%i in (93,-3,45) do (
set /a rand_gen=1+%%i*!randum!/32767
set rand_lenth=!rand_lenth! !rand_gen!
)
REM for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 delims= " %%a in ("!rand_lenth!") do set result=!result!"!setchr[%%a]!!setchr[%%b]!!setchr[%%c]!!setchr[%%d]!!setchr[%%e]!!setchr[%%f]!!setchr[%%g]!!setchr[%%h]!!setchr[%%i]!!setchr[%%j]!!setchr[%%k]!!setchr[%%l]!!setchr[%%m]!!setchr[%%n]!!setchr[%%o]!!setchr[%%p]!"
for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26 delims= " %%a in ("!rand_lenth!") do echo !setchr[%%a]!!setchr[%%b]!!setchr[%%c]!!setchr[%%d]!!setchr[%%e]!!setchr[%%f]!!setchr[%%g]!!setchr[%%h]!!setchr[%%i]!!setchr[%%j]!!setchr[%%k]!!setchr[%%l]!!setchr[%%m]!!setchr[%%n]!!setchr[%%o]!!setchr[%%p]!!setchr[%%q]!!setchr[%%r]!!setchr[%%s]!!setchr[%%t]!!setchr[%%u]!!setchr[%%v]!!setchr[%%w]!!setchr[%%x]!!setchr[%%y]!!setchr[%%z]! >>typepass.txt

REM set result="%result:"=%"
REM set result="!result:~1,%number%!"
REM for /f "tokens=*" %%i in (!result!) do echo %%~i  & REM powershell -c "\"%%~i\".length"
goto :repeat

:setrand
set randum=!random!
exit /b





