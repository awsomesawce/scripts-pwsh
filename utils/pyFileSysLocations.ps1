#!/usr/bin/env -S pwsh -nop
# OriginalLocation: "D:\Carl\OneDrive\snippets\python\pyFileSysLocations.ps1
# Copy to "my-dotfiles/windows", "scripts-pwsh/config"

# Var pointing to Windows Store installed python3.9.exe:
$py39 = "C:\Users\Carl\AppData\Local\Microsoft\WindowsApps\python3.9.exe"
# Var pointing to msys-installed python3.9.exe
$py39msys = "D:\MSYS2\usr\bin\python3.9.exe"
# Var pointing to Windows Store installed python3.8.exe:
$py38 = "C:\Users\Carl\AppData\Local\Microsoft\WindowsApps\python3.8.exe"
# Var pointing to system-site scripts installed by Windows Store python3.8:
$py38Scripts = "C:\Program Files\Python38\Scripts"
# Var pointing to user-site scripts installed by Windows Store python3.8:
$py38ScriptsUser = "D:/Carl/AppData/Python/Python38/Scripts"
# Var containing list of scripts in user-site scripts dir:
$py38ScriptsList = (Get-ChildItem $py38ScriptsUser)
# Var pointing to system-site scripts for Windows Store python3.9 -m pip
# `--user` and regular install both install to this folder (dir).
$py39Scripts = "C:\Users\Carl\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\Scripts"

${msysmingw} = @{
    mingw = @{
	lib = @{
	    py39 = "D:\MSYS2\mingw64\lib\python3.9\"
	    py38 = "D:\MSYS2\mingw64\lib\python3.8"
	}
    }
    msys = @{
	lib = "D:\MSYS2\usr\lib\python3.9"
    }
}
return Write-Host -ForegroundColor Yellow "Loaded $PSScriptRoot\pyFileSysLocations.ps1"
