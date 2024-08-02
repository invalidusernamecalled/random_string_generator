
@echo off
:process
set result=
set set1="abcdefghijklmnoprstuvwxyz"
set set2="0123456789"
set set3=">/<~@#$*(){}[]\|:;?.,"
set set4="@#$%&*(){}[]"
set set5="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set set6="ABCDEFGabcdefg0123456789HIJKLMNOPhijklmnopQR0123456789STUVWXYZqrstuvwxyz"
set set7=">/<~^^^!@#$%%^^^&*(){}[]\|:;?.,ABCDEFGabcdefg0123456789HIJKLMNOPhijklmnopQR0123456789STUVWXYZqrstuvwxyz"
set numset1=25
set numset2=10
set numset3=21
set numset4=11
set numset5=25
set numset6=71
set numset7=95
set loopcounter=0
set endprocess=
set e_mode=1
REM for /f "tokens=3,4 delims=:." %%i in ("%time%") do set one=%%i*60&set two=%%j&echo %%i.%%j
REM set /a sum_first=one+two
REM echo %sum_first%
Setlocal enabledelayedexpansion
set useset=
if /i "%1"=="/h" goto :printauthor
if "%1"=="" goto :printhelpmenu
if "%1" NEQ "" goto continue
goto :printhelpmenu
:continue
echo %1|findstr /ber "[/][0-9][0-9]*" >NUL&&type nul || goto :printhelpmenu
set number=%~1
set number=%number:~1%
if "%2"=="" set useset=1&goto init
if "%2" NEQ "" goto continuestyle
goto :printhelpmenu
:continuestyle
echo %2|findstr /ber "[/][CcsSnNxX][CcsSnNxX]*[CcsSnNxX]*[CcsSnNxX]*[CcsSnNxX]*[CcsSnNxX]*" >NUL&&type nul || goto :printhelpmenu
set style=%~2
set style=%style:~1%
set skip=0
for /l %%i in (0,1,5) do call :setlocaltest %%i %style%&if !skip!==1 goto init
:init
set counterset=0
REM for %%a in (%useset%) do set /a counterset+=1&set intr[!counterset!]=%%a
set realset=
for %%a in (%useset%) do CALL set realset=%%realset%%%%set%%a%%
set numrealset=0
for %%a in (%useset%) do CALL set /a numrealset=!numrealset!+!numset%%a!
set realset="%realset:"=%"
for /l %%a in (1,1,%numrealset%) do set setchr[%%a]=!realset:~%%a,1!
goto :randomgen
:setlocaltest
set stort=%2
set n=%1
set termchr=!stort:~%n%,1!
if "%termchr%"==""  exit /b
if "%termchr%"=="C" set useset=%useset% 5
if "%termchr%"=="c" set useset=%useset% 1
if /i "%termchr%"=="s" set useset=%useset% 4
if /i "%termchr%"=="x" set useset=%useset% 3
if /i "%termchr%"=="n" set useset=%useset% 2
exit /b


:randomgen
if %e_mode%==1 goto :emode
REM echo on
set /a loopcounter+=1
set /a rand_no=(%counterset%*%RANDOM%/32767)+1
set whatset=!intr[%rand_no%]!
set /a rand_lenth=(!numset%whatset%!*%RANDOM%/32767)+1
for /f "tokens=*" %%i in ('echo !set%whatset%!') do (
set some=%%i
set some="!some:~%rand_lenth%,1!"
set endprocess=!some!!endprocess!
rem debug info: echo using set%whatset% @ !rand_lenth! pass %loopcounter% endprocess is !endprocess!
)
if %loopcounter% LSS %number% goto randomgen
setlocal disabledelayedexpansion
set endprocess="%endprocess:"=%"

for /f "tokens=*" %%i in (%endprocess%) do echo %%i

goto :eof

:emode
set dopadding=0
set dontpad=1
set dontrepeat=1
set padset=0
if %numrealset% LSS 26 if %number% GTR %numrealset% set dontpad=0&set /a padset=number-numrealset&set dontrepeat=-1&goto setlesspad
REM echo %number%-%numrealset%
if %number% GTR 26 set dopadding=1&set /a padset=number-26&set dontrepeat=-1
REM echo %padset% pd
REM echo %padset% pd
:setlesspad
set /a lesspad=%number% %% %numrealset%
REM if %lesspad%==0 set /a number=number-2
:repeat
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
if %dontpad%==0 set /a padset=padset-numrealset
if %dontpad%==0 if %padset% LSS 0 set /a dontrepeat+=1&goto checkrepeat
if %dopadding%==1 set /a padset=padset-26
if %dopadding%==1 if %padset% LSS 0 set /a dontrepeat+=1
:checkrepeat
if %dontrepeat% LSS 1 goto repeat
Rem if %numrealset% GTR 26 set rand_lenth=!rand_lenth:~52! & goto next
set result="%result:"=%"
set /a number=number+1
if %lesspad%==0 (set result="!result:~0,%number%!") else (set result="!result:~0,%number%!")
for /f "tokens=*" %%i in (!result!) do echo %%~i & REM powershell -c "\"%%~i\".length"
goto :eof
for /f "tokens=*" %%i in ("!set6!") do (
set some=%%i
set some="!some:~%rand_lenth%,1!"
set endprocess=!some!!endprocess!
rem debug info: echo using set%whatset% @ !rand_lenth! pass %loopcounter% endprocess is !endprocess!
)
if %loopcounter% LSS %number% goto randomgen
setlocal disabledelayedexpansion
set endprocess="%endprocess:"=%"

for /f "tokens=*" %%i in (%endprocess%) do echo %%i
goto :eof
:setrand
set randum=%random%
exit /b
for /f "tokens=3,4 delims=:." %%i in ("%time%") do echo %%i.%%j&if %%i GEQ %one% echo proc&set first=%%i*60&set second=%%j
set /a sum_two=first+second
echo %time%
echo %sum_two%
set /a res=sum_two-sum_first
if %res% GTR 0 echo this took %res% ms Approx
:printhelpmenu
echo: Syntax -
echo: "%~nx0" /[n:number of chars to generate] /[:generate options]
echo:
echo:/c lower case alpha.
echo:/C upper case alpha.
echo:/n numbers
echo:/s symbol basic symbol set
echo:/x symbol extended symbol set
echo:/h author info
echo:
echo:All options must be combined like this /lu
echo:      NOT /l /u
echo:
goto :eof
:printauthor
echo:Author:        Puneet Bapna
echo:God:           Christian X
echo:Christian God, Christian Feelings
echo:Location:      India
echo:Immigrant:     No