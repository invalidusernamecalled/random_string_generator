```
 Syntax -
 "random.bat" /[number of chars to generate] /[generate options]

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
this key changer can mess up the brute-force dreams of any
schmucck arse in this world. *clap!!* *clap!!*
