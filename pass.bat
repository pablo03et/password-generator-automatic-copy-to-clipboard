@echo off
setlocal enabledelayedexpansion

set "all=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()"
set "password="
set /a len=24
for /l %%a in (1,1,%len%) do (
    set /a index=!random! %% 78
    for %%b in (!index!) do set "char=!all:~%%b,1!"
    set "password=!password!!char!"
)

echo %password%| clip

powershell -command "Add-Type -AssemblyName System.Windows.Forms;[System.Windows.Forms.Clipboard]::GetText()"

exit