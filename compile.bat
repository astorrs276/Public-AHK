@echo off
setlocal

:: Path to Ahk2Exe.exe
set compiler="C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"

:: Loop through all AHK files in the current folder
for %%F in (*.ahk) do (
    echo Compiling %%F...
    %compiler% /in "%%F" /out "%%~nF.exe"
)

echo Done.
pause
