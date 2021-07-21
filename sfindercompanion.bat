::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDRDSQqRAE+/Fb4I5/jH2++TsEQOaPE5cYHf36ayM+Ya5EHhZ5Ui22pblsIDAlVdZhfL
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title sfindercompanion
setlocal enableextensions

: 'start'
if exist sfinder.jar (set "start=java -jar sfinder.jar") else (echo This file isn't in the right directory! Make sure that this file is in the same directory as the file "sfinder.jar" from Knewjade's solution finder. If you don't have it installed, please do so here: https://github.com/knewjade/solution-finder/releases. && pause && exit)
set /p mode=What mode do you want to use? [Type "spin", "percent", "path", or "setup".] 
if [%mode%] == [] echo You didn't input anything. Please try again. && goto 'start'
if /I %mode%==spin goto 'fumen'
if /I %mode%==percent goto 'fumen'
if /I %mode%==path goto 'fumen'
if /I %mode%==setup goto 'fumen'
echo This isn't a valid input, please try again. && goto 'start'
pause
exit

: 'fumen'
set /p fumen=What is the fumen you want to use? 
if [%fumen%] == [] (echo You didn't input anything. Please try again. && goto 'fumen') else (goto 'next')
echo Some error occured. You shouldn't be seeing this, but if you are, DM me at Kerrmunism#2808.
pause
exit

: 'next'
set /p page=What page will you be using from the fumen %fumen%? [Input only the number, no spaces.] (Will default to 1). 
if [%page%] == [] set page=1 
set "fumen=--tetfu %fumen%" && goto 'specifications'
pause
exit

: 'specifications'
if /I %mode%==spin goto 'spin' 
if /I %mode%==percent goto 'percent'
if /I %mode%==setup goto 'setup'
if /I %mode%==path goto 'path'
echo Some sort of error has occured, sorry about that!
pause
exit

: 'spin'
set /p patterns=What bag do you want? [Answer as whatever bag you want inside of quotes, for example, "L, *p6"] (Will default to *p7, check https://knewjade.github.io/sfinder-docs/contents/patterns.html if confused on how to allocate bags).
if [%patterns%] == [] set patterns=*p7
set /p line=How many lines should your T-spin clear? (Will default to 2). 
if [%line%] == [] set line=2
set /p fillBottom=How high is your T-spin off the ground? (Will default to 0). 
if [%fillBottom%] == [] set fillBottom=0
set /p maxRoof=How high should we put pieces in order to find your T-Spin? (Defaults to being done automatically.) 
if [%maxRoof%] == [] set maxRoof=-1
set /p logPath=Where should the results of this be saved? (All outputs are saved in the output folder, default is therefore "spin.html") 
if [%logPath%] == [] set logPath=spin.html
set logPath=output/%logPath%
set /p etc=Any other specifications you need? (Check https://knewjade.github.io/sfinder-docs/contents/spin/main.html for a full list!) 
goto 'exportSpin'

: 'exportSpin'
set "exportBatch=placeholder"
set /p exportBatch=Do you want this to be saved to a batch file for later use? If so, type the full file name (for example, spin.bat). Otherwise, no batch file will be made. 
if [%exportBatch%] == [] set exportBatch=placeholder 
if %exportBatch%==placeholder goto 'finishSpin'
if exist %exportBatch% echo This name is taken. Please try again. && goto 'exportSpin'
if not [%exportBatch%] == [] echo %start% %mode% %fumen% -P %page% -p %patterns% -c %line% -fb %fillBottom% -ft %maxRoof% -o %logPath% %etc% >> %exportBatch%
if not [%exportBatch%] == [] echo pause >> %exportBatch%
goto 'finishSpin'

: 'finishSpin'
echo %start% %mode% %fumen% -P %page% -p %patterns% -c %line% -fb %fillBottom% -ft %maxRoof% -o %logPath% %etc%
%start% %mode% %fumen% -P %page% -p %patterns% -c %line% -fb %fillBottom% -ft %maxRoof% -o %logPath% %etc%
pause
echo The command should've run successfully. Thanks for your assistance!
pause
exit


: 'percent'
set /p patterns=What bag do you want? [Answer as whatever bag you want inside of quotes, for example, "L, *p6"] (Will default to *p7, check https://knewjade.github.io/sfinder-docs/contents/patterns.html if confused on how to allocate bags). 
if [%patterns%] == [] set patterns=*p7
set /p hold=Should hold be used? [Answer "yes" or "no"] (Will default to yes). 
if [%hold%] == [] set hold=use
if /I %hold%==yes set hold=use
if /I %hold%==no set hold=avoid
set /p clearLine=How many lines is this Perfect Clear build? (Will default to 4.) 
if [%clearLine%] == [] set clearLine=4
set /p drop=What types of drops and rotations should be allowed? [Answer "softdrop" for all types, answer "harddrop" for only harddrops, answer "180" for all types and 180s, answer "t-softdrop" to only softdrop the T mino but hard drop everything else.] (Will default to softdrop) 
if [%drop%] == [] set drop=softdrop
set /p logPath=Where should the results of this be saved? (All outputs are saved in the output folder, default is therefore "percent.txt") 
if [%logPath%] == [] set logPath=percent.txt
set logPath=output/%logPath%
set /p etc=Any other specifications you need? (Check https://knewjade.github.io/sfinder-docs/contents/percent/main.html for a full list!) 
goto 'exportPercent'

: 'exportPercent'
set "exportBatch=placeholder"
set /p exportBatch=Do you want this to be saved to a batch file for later use? If so, type the full file name (for example, percent.bat). Otherwise, no batch file will be made. 
if [%exportBatch%] == [] set exportBatch=placeholder 
if %exportBatch%==placeholder goto 'finishPercent'
if exist %exportBatch% echo A file with this name already exists. Please choose a different name. && goto 'exportPercent'
if not [%exportBatch%] == [] echo %start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -c %clearLine% -d %drop% -lp %logPath% %etc% >> %exportBatch%
if not [%exportBatch%] == [] echo pause >> %exportBatch%
goto 'finishPercent'

: 'finishPercent'
echo %start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -c %clearLine% -d %drop% -lp %logPath% %etc%
%start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -c %clearLine% -d %drop% -lp %logPath% %etc%
pause
echo The command should've run successfully. Thanks for your assistance!
pause
exit

: 'path'
set /p patterns=What bag do you want? [Answer as whatever bag you want inside of quotes, for example, "L, *p6"] (Will default to *p7, check https://knewjade.github.io/sfinder-docs/contents/patterns.html if confused on how to allocate bags). 
if [%patterns%] == [] set patterns=*p7
set /p hold=Should hold be used? [Answer "yes" or "no"] (Will default to yes). 
if [%hold%] == [] set hold=use
if /I %hold%==yes set hold=use
if /I %hold%==no set hold=avoid
set /p clearLine=How many lines is this Perfect Clear build? (Will default to 4.) 
if [%clearLine%] == [] set clearLine=4
set /p drop=What types of drops and rotations should be allowed? [Answer "softdrop" for all types, answer "harddrop" for only harddrops, answer "180" for all types and 180s, answer "t-softdrop" to only softdrop the T mino but hard drop everything else.] (Will default to softdrop) 
if [%drop%] == [] set drop=softdrop
set /p logPath=Where should the results of this be saved? (All outputs are saved in the output folder, default is therefore "path.html") 
if [%logPath%] == [] set logPath=path.html
set logPath=output/%logpath%
set /p etc=Any other specifications you need? (Check https://knewjade.github.io/sfinder-docs/contents/path/main.html for a full list!)
goto 'exportPath'

: 'exportPath'
set "exportBatch=placeholder"
set /p exportBatch=Do you want this to be saved to a batch file for later use? If so, type the full file name (for example, path.bat). Otherwise, no batch file will be made. 
if [%exportBatch%] == [] set exportBatch=placeholder 
if %exportBatch%==placeholder goto 'finishPath'
if exist %exportBatch% echo A file with this name already exists. Please choose a different name. && goto 'exportPath'
if not [%exportBatch%] == [] echo %start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -c %clearLine% -d %drop% -o %logPath% %etc% >> %exportBatch%
if not [%exportBatch%] == [] echo pause >> %exportBatch%
goto 'finishPath'

: 'finishPath'
echo %start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -c %clearLine% -d %drop% -o %logPath% %etc%
%start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -c %clearLine% -d %drop% -o %logPath% %etc%
pause
echo The command should've run successfully. Thanks for your assistance!
pause
exit

: 'setup'
set /p patterns=What bag do you want? [Answer as whatever bag you want inside of quotes, for example, "L, *p6"] (Will default to *p7, check https://knewjade.github.io/sfinder-docs/contents/patterns.html if confused on how to allocate bags).  
if [%patterns%] == [] set patterns=*p7
set /p holes=Should we allow setups with holes in the margin space (if it exists) to be counted? [Answer "none" for all holes to be excluded, even if there is a gap where a piece could be inserted, answer "some" for all holes to be excluded, except ones with gaps where pieces could be inserted, or "all" for all holes to be allowed.] (Will default to all) 
if [%holes%] == [] set holes=n0ne
if /I %holes%==none set holes=holes
if /I %holes%==some set holes=strict-holes
if /I %holes%==all set holes=none
if /I %holes%==n0ne set holes=none
set /p fill=What mino in the field indicates spaces that should be filled by the setup? (Will default to I) 
if [%fill%] == [] set fill=I
set /p margin=What mino in the field indicates spaces that may or may not be filled, but if filled, should not include holes? (Will default to O) 
if [%margin%] == [] set margin=O
set /p free=What mino in the field indicates spaces that may or may not be filled, and can include spaces in them? (Will default to S) 
if [%free%] == [] set free=S
set /p drop=What types of drops and rotations should be allowed? [Answer "softdrop" for all types, answer "harddrop" for only harddrops, answer "180" for all types and 180s, answer "t-softdrop" to only softdrop the T mino but hard drop everything else.] (Will default to softdrop) 
if [%drop%] == [] set drop=softdrop
set /p hold=Should hold be used? [Answer "yes" or "no"] (Will default to yes). 
if [%hold%] == [] set hold=use
if /I %hold%==yes set hold=use
if /I %hold%==no set hold=avoid
set /p pieceNum=How many pieces should be allowed to build the setup? (Will default to being set automatically) 
if [%pieceNum%] == [] set pieceNum=-1
set /p logPath=Where should the results of this be saved? (All outputs are saved in the output folder, default is therefore "setup.html") 
if [%logPath%] == [] set logPath=setup.html
set logPath=output/%logpath%
set /p etc=Any other specifications you need? (Check https://knewjade.github.io/sfinder-docs/contents/setup/main.html for a full list!) 
goto 'exportSetup'

: 'exportSetup'
set "exportBatch=placeholder"
set /p exportBatch=Do you want this to be saved to a batch file for later use? If so, type the full file name (for example, setup.bat). Otherwise, no batch file will be made. 
if [%exportBatch%] == [] set exportBatch=placeholder 
if %exportBatch%==placeholder goto 'finishSetup'
if exist %exportBatch% echo A file with this name already exists. Please choose a different name. && goto 'exportSetup'
if not [%exportBatch%] == [] echo %start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -f %fill% -m %margin% -F %free% -e %holes% -d %drop% -np %pieceNum% -o %logPath% %etc% >> %exportBatch%
if not [%exportBatch%] == [] echo pause >> %exportBatch%
goto 'finishSetup'

: 'finishSetup'
echo %start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -f %fill% -m %margin% -F %free% -e %holes% -d %drop% -np %pieceNum% -o %logPath% %etc%
%start% %mode% %fumen% -P %page% -p %patterns% -H %hold% -f %fill% -m %margin% -F %free% -e %holes% -d %drop% -np %pieceNum% -o %logPath% %etc%
pause
echo The command should've run successfully. Thanks for your assistance!
pause
exit




