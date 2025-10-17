@echo off
setlocal enabledelayedexpansion

echo Checking for browsers...

:: Check Google Chrome
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" >nul 2>&1
if %errorlevel% equ 0 (
    echo Google Chrome is installed
    set CHROME_INSTALLED=1
) else (
    echo Google Chrome is not installed
    set CHROME_INSTALLED=0
)

:: Check Microsoft Edge
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe" >nul 2>&1
if %errorlevel% equ 0 (
    echo Microsoft Edge is installed
    set EDGE_INSTALLED=1
) else (
    echo Microsoft Edge is not installed
    set EDGE_INSTALLED=0
)

if !CHROME_INSTALLED! equ 1 (
	start chrome "%~dp0template.html" --disable-web-security --user-data-dir="C:/ChromeDevSession"
) else if !EDGE_INSTALLED! equ 1 (
	start msedge "%~dp0template.html" --disable-web-security --user-data-dir="C:/EdgeDevSession"
) else (
	echo Neither Chrome nor Edge found on this computer, please install one of the two browsers
)

endlocal