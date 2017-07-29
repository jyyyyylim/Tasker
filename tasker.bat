@echo off
color a
title Tasker (JYLim#4802)

:ANSWER
set /P c=Choose an action. (Shutdown/Restart/Hibernate/Cancel) [S/R/H/X]
if /I "%c%" EQU "S" goto :shutdown
if /I "%c%" EQU "R" goto :restart
if /I "%c%" EQU "H" goto :hibernate
if /I "%c%" EQU "X" goto :exit
goto :ANSWER

:shutdown
c:\windows\system32\shutdown -s -f -t 02  
exit

:restart
c:\windows\system32\shutdown -r -f -t 02
exit

:hibernate
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
exit

:exit
echo Cancelled menu.
exit