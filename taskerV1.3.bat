@echo off 
@setlocal enableextensions enabledelayedexpansion
REM JY was here 
REM this is supposed to be messy, uwot
color a & title Tasker (JYLim#4802) & echo ------------------------------------------ & ver & echo: & echo ------------------------------------------ & echo: & echo:
:start1
echo Shutdown - S & echo Restart - R & echo Hibernate - H & echo Misc - M & echo Exit - X & echo: & echo:
:QUESTION
set /P c=Choose an action. (not case-sensitive)   
if /I "%c%" EQU "S" goto :shutdown
if /I "%c%" EQU "R" goto :restart
if /I "%c%" EQU "H" goto :hibernate
if /I "%c%" EQU "M" goto :misc
if /I "%c%" EQU "X" goto :exit
echo: & echo Invalid response. & echo: & goto :QUESTION
:start
echo: & echo ----------------------------------------------------------------- & echo: & goto :start1
:shutdown
c:\windows\system32\shutdown -s -f -t 00 & exit
:restart
c:\windows\system32\shutdown -r -f -t 00 & exit
:hibernate
rundll32.exe powrprof.dll,SetSuspendState 0,1,0 & exit
:MISC
echo: & echo ----------------------------------------------------------------- & echo: & echo Update, then shutdown - S & echo Update, then restart - R & echo ClearDNSCache - D & echo DefragDrives - F & echo SystemInfo - I & echo FileList - P & echo Back - B & echo Cancel - X & echo: & echo:
set /P c=Select an advanced action. Use sparingly.   
if /I "%c%" EQU "S" goto :usd
if /I "%c%" EQU "R" goto :urs
if /I "%c%" EQU "D" goto :dns
if /I "%c%" EQU "F" goto :def
if /I "%c%" EQU "I" goto :info
if /I "%c%" EQU "P" goto :tree
if /I "%c%" EQU "B" goto :start
if /I "%c%" EQU "X" goto :exit
echo: & echo Invalid response. & echo: & goto :MISC
:usd
echo: & echo ----------------------------------------------------------------- & echo: & shutdown.exe /s /t 0 & pause & exit
:urs
echo: & echo ----------------------------------------------------------------- & echo: & shutdown.exe /r /t 0 & pause & exit
:dns
echo: & echo ----------------------------------------------------------------- & echo: & ipconfig /flushdns & echo Flushed the DNS resolver cache. & pause & exit

:def
echo: & echo ----------------------------------------------------------------- & echo: & defrag c: /u  & defrag d: /u & echo Defragged both drives. & pause & exit

:info
echo: & echo ----------------------------------------------------------------- & echo: & systeminfo & echo Fetched system info. Press any key to exit. & pause & exit


:tree
echo: & echo ----------------------------------------------------------------- & echo: & echo Display a totally legit file tree? (exhaustive)   & pause & tree %systemdrive%/../../../.. & pause & goto exit

:exit
echo: & echo Cancelled menu. & timeout /t 5 & exit
