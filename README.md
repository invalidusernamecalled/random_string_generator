```
 Syntax -
 "random.bat" [number of chars to generate] /[generate options]

/e efficiency mode 1 (cannot be use with any other option)
/E efficiency mode 2 (cannot be use with any other option)
/c lower case alpha.
/C upper case alpha.
/n numbers
/s symbol basic symbol set
/x symbol extended symbol set
/h author info

All options must be combined like this /Cn
      NOT /C /n


```
### Examples:-
`for /f "delims=" %%i in ('random.bat /12 /e') do set random_string=%%i`
___
<b>/production/pseudorandom.bat:-</b>
clocking 690 strings per minute `pseudorandom.bat` generates high speed output. it suits your need for speed project. this batch script requires
`bonniewala.bat` to run as a service (ongoing in background)
and `keygenerator.bat` needs be present in the working directory.
this key changer can mess up the brute-force shmuck arse dreams of any
pretender in this world. *clap!!* *clap!!*

### Example for /production/pseudorandom.bat:-

`bonniewala.bat` must be running in one shell.
<br>in another shell, we run (for example)<br>
`echo off & for /l %i in (1,1,200000) do pseudorandom.bat`

### Why is there a need for pseudorandom.bat
##### Why a need for *anything* (asked the Great Medieval Clown)
+ Some people are batch-lovers (just..) and they must need and have the appropriate concurrent/parallel/likewise tools that the otherwise places (languages/environments) have. 
+ You usually can't build everything yourself, so i try to chip in where i can.
