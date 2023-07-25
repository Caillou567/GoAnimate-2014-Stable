:: GoAnimate 2014 Updater
:: Author: SimplyA_Coder
:: License: MIT
title GoAnimate 2014 Updater [Initializing...]

::::::::::::::::::::
:: Initialization ::
::::::::::::::::::::

:: Stop commands from spamming stuff, cleans up the screen
@echo off && cls

:: Lets variables work or something idk im not a nerd
SETLOCAL ENABLEDELAYEDEXPANSION

:: Make sure we're starting in the correct folder, and that it worked (otherwise things would go horribly wrong)
pushd "%~dp0"
if !errorlevel! NEQ 0 goto error_location
if not exist utilities ( goto error_location )
if not exist wrapper ( goto error_location )
if not exist server ( goto error_location )
goto noerror_location
:error_location
echo Doesn't seem like this script is in a GoAnimate 2014 folder.
pause && exit
:noerror_location

:::::::::::::::::::::::::
:: Post-Initialization ::
:::::::::::::::::::::::::

title GoAnimate 2014 Updater

if not exist .git ( goto nogit )
:yesgit
echo GoAniamte 2014 Update
echo A Legacy Video Maker with the old GoAnimate from 2014, built on Flash Player and NodeJS.
echo:
echo Enter 1 to update GoAnimate 2014
echo Enter 0 to close the updater
goto wrapperidle
:nogit
echo You have not downloaded GoAnimate 2014 using the installer... somehow??
echo Please download the installer and run it https://wrapper-offline.ga/installer/installer_windows.exe.
pause & exit
:wrapperidle
echo:

:::::::::::::
:: Choices ::
:::::::::::::

set /p CHOICE=Choice:
if "!choice!"=="0" goto exit
if "!choice!"=="1" goto update
echo Time to choose. && goto wrapperidle

:update
cls
pushd "%~dp0"
echo Pulling repository from GitHub...
git pull
cls
echo GoAnimate 2014 has been updated^^!
start "" "%~dp0"
pause & exit

:exit
pause & exit
