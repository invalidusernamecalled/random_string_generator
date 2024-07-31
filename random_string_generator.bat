
@echo off
Setlocal enabledelayedexpansion
set useset=
if /i "%1"=="/h" goto :printauthor
if "%1"=="" goto :printhelpmenu
if "%1" NEQ "" goto continue
goto :printhelpmenu
:continue
echo %1|findstr /ber "[/][0-9][0-9]*" >NUL&&echo: >NUL || goto :printhelpmenu
set number=%~1
set number=%number:~1%
if "%2"=="" set useset=1&goto init
if "%2" NEQ "" goto continuestyle
goto :printhelpmenu
:continuestyle
echo %2|findstr /ber "[/][uUlLsSeEnNxX][uUlLsSeEnNxX]*[uUlLsSeEnNxX]*[uUlLsSeEnNxX]*[uUlLsSeEnNxX]*[uUlLsSeEnNxX]*" >NUL&&echo: >NUL || goto :printhelpmenu
set style=%~2
set style=%style:~1%
set skip=0
for /l %%i in (0,1,5) do call :setlocaltest %%i %style%&if !skip!==1 goto init
:init
set counterset=0
for %%a in (%useset%) do set /a counterset+=1&set intr[!counterset!]=%%a
goto :process
:setlocaltest
set stort=%2
set n=%1
set termchr=!stort:~%n%,1!
if "%termchr%"==""  exit /b
if /i "%termchr%"=="u" set useset=%useset% 5
if /i "%termchr%"=="l" set useset=%useset% 1
if /i "%termchr%"=="s" set useset=%useset% 4
if /i "%termchr%"=="x" set useset=%useset% 3
if /i "%termchr%"=="n" set useset=%useset% 2
if /i "%termchr%"=="e" set useset=%useset% 6 & set skip=1
exit /b

:process
set set1="abcdefghijklmnoprstuvwxyz"
set set2="0123456789"
set set3=">/<~^^^!@#$%%^^^&*(){}[]\|:;?.,"
set set4="!@#$%&*(){}[]"
set set5="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set set6="ABCDEFGabcdefg0123456789HIJKLMNOPhijklmnopQR0123456789STUVWXYZqrstuvwxyz"
set numset1=25
set numset2=9
set numset3=24
set numset4=12
set numset5=25
set numset6=71
set loopcounter=0
set endprocess=
:randomgen
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
:printhelpmenu
echo: Syntax -
echo: "%~nx0" /[n:number of chars to generate] /[:generate options]
echo:
echo:/e efficiency mode - generate faster includes lowercase, uppercase, numbers
echo:   will be in effective if used along with any other option
echo:/l lower case alpha.
echo:/u upper case alpha.
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
echo:Author: Puneet Bapna
echo:God: Christian X