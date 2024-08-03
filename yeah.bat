@echo off
set realset=">/<~@#$*(){}[]\|:;?.,ABCDEFGabcdefg0123456789HIJKLMNOPhijklmnopQR0123456789STUVWXYZqrstuvwxyz"
set number=16
set numrealset=93
Setlocal enabledelayedexpansion
for /l %%a in (1,1,%numrealset%) do set setchr[%%a]=!realset:~%%a,1!
:randomgen

:repeat
set result=
set rand_lenth=
set lenth=0
for /l %%i in (%numrealset%,-1,1) do (
call :setrand
set /a rand_gen=1+%%i*!randum!/32767
set rand_lenth=!rand_lenth! !rand_gen!
set /a lenth+=1
if !lenth! GTR  %number% goto next
if !lenth! GTR  26 goto next
)
:next
for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26 delims= " %%a in ("!rand_lenth!") do set result=!result!"!setchr[%%a]!!setchr[%%b]!!setchr[%%c]!!setchr[%%d]!!setchr[%%e]!!setchr[%%f]!!setchr[%%g]!!setchr[%%h]!!setchr[%%i]!!setchr[%%j]!!setchr[%%k]!!setchr[%%l]!!setchr[%%m]!!setchr[%%n]!!setchr[%%o]!!setchr[%%p]!!setchr[%%q]!!setchr[%%r]!!setchr[%%s]!!setchr[%%t]!!setchr[%%u]!!setchr[%%v]!!setchr[%%w]!!setchr[%%x]!!setchr[%%y]!!setchr[%%z]!"

set result="%result:"=%"
REM set result="!result:~1,%number%!"
for /f "tokens=*" %%i in (!result!) do echo %%~i >>typepass.txt& REM powershell -c "\"%%~i\".length"
goto :repeat

:setrand
set randum=!random!
exit /b





