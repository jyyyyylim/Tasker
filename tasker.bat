@echo off 
@setlocal enableextensions enabledelayedexpansion
REM JY was here 
REM this is supposed to be messy, uwot
color a & title Tasker (JYLim#4802) 
echo ------------------------------------------ & echo Current Version: & ver & echo: & echo ------------------------------------------ & echo: & echo:
echo Shutdown - S & echo Restart - R & echo Hibernate - H & echo Misc - M & echo Exit - X & echo: & echo:
:QUESTION 
set /P c=Choose an action. (not case-sensitive)  
if /I "%c%" EQU "S" goto :shutdown 
if /I "%c%" EQU "R" goto :restart
if /I "%c%" EQU "H" goto :hibernate
if /I "%c%" EQU "M" goto :misc
if /I "%c%" EQU "X" goto :exit
goto :QUESTION
:shutdown 
c:\windows\system32\shutdown -s -f -t 00 & exit
:restart
c:\windows\system32\shutdown -r -f -t 00 & exit
:hibernate
rundll32.exe powrprof.dll,SetSuspendState 0,1,0 & exit
:MISC
echo: & echo ----------------------------------------------------------------- & echo: & echo ClearDNSCache - D & echo DefragDrives - F & echo SystemInfo - I & echo FileList - P & echo Cancel - X & echo: & echo:
set /P c=Select an advanced action. Use sparingly.   
if /I "%c%" EQU "D" goto :dns
if /I "%c%" EQU "F" goto :def
if /I "%c%" EQU "I" goto :info
if /I "%c%" EQU "P" goto :tree
if /I "%c%" EQU "X" goto :exit
if /I "%c%" EQU "t" goto :t
goto :MISC
:dns
echo: & echo ----------------------------------------------------------------- & echo: & ipconfig /flushdns & echo Flushed the DNS resolver cache. & pause & exit
:def
echo: & echo ----------------------------------------------------------------- & echo: & defrag c: /u  & defrag d: /u & echo Defragged both drives. & pause & exit
:info
echo: & echo ----------------------------------------------------------------- & echo: & systeminfo & echo Fetched system info. Press any key to exit. & pause & exit
:tree
echo: & echo ----------------------------------------------------------------- & echo: & echo Display a totally legit file tree?   & pause & tree %systemdrive%/../../../../.. & pause
goto exit
:exit
echo: & echo Cancelled menu. & timeout /t 2 & exit