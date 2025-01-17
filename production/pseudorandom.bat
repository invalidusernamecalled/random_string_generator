@echo off
if exist keygenerator.bat (call keygenerator.bat) else (set realset="xjJkHz9z5Fp417abFlZSZ64y7B35d0mG0Bet84Dd1Xlsz61HU22MTSR7QPLlWKp324Xrf7co891JmA5XOy4K2fjlnj9q81P7ZEi0s10uINIagcGL0EXMnYNvmw66ywyYhBg5LBk75VJKRjCi90rhaUY593aTZtq938oeOYDxmADvzLbVucCJcD4WQK")
for /l %%a in (1,1,%numrealset%) do set setchr[%%a]=!realset:~%%a,1!
set number=16
set numrealset=186
set counter=0
Setlocal enabledelayedexpansion
for /l %%a in (1,1,%numrealset%) do set setchr[%%a]=!realset:~%%a,1!
:repeat
set result=
set rand_lenth=
set lenth=0
set history_counter=0
set history=9837987122
call :setrand
for /l %%i in (100,-2,68) do (
set /a rand_gen=1+%%i*!randum!/32767
set rand_lenth=!rand_lenth! !rand_gen!
if !rand_gen!==!history! set /a history_counter+=1
set history=!rand_gen!
)
if !history_counter! gtr 4 GOTO REPEAT
for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26 delims= " %%a in ("!rand_lenth!") do echo !setchr[%%a]!!setchr[%%b]!!setchr[%%c]!!setchr[%%d]!!setchr[%%e]!!setchr[%%f]!!setchr[%%g]!!setchr[%%h]!!setchr[%%i]!!setchr[%%j]!!setchr[%%k]!!setchr[%%l]!!setchr[%%m]!!setchr[%%n]!!setchr[%%o]!!setchr[%%p]!!setchr[%%q]!!setchr[%%r]!!setchr[%%s]!!setchr[%%t]!!setchr[%%u]!!setchr[%%v]!!setchr[%%w]!!setchr[%%x]!!setchr[%%y]!!setchr[%%z]!
set /a counter+=1 




:setrand
set randum=!random!
exit /b





