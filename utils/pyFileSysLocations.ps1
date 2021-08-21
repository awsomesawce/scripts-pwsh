#!/usr/bin/env -S pwsh -nop
# OriginalLocation: "D:\Carl\OneDrive\snippets\python\pyFileSysLocations.ps1
# Copy to "my-dotfiles/windows", "scripts-pwsh/config"

# Hashtable containing a bunch of locations
$pyHash = @{
# Var pointing to Windows Store installed python3.9.exe:
py39 = "C:\Users\Carl\AppData\Local\Microsoft\WindowsApps\python3.9.exe"
# Var pointing to msys-installed python3.9.exe
py39msys = "D:\MSYS2\usr\bin\python3.9.exe"
# Pointer to mingw64 python
py39mingw = "D:/MSYS2/mingw64/lib/python3.9"
# Var pointing to Windows Store installed python3.8.exe:
py38 = "C:\Users\Carl\AppData\Local\Microsoft\WindowsApps\python3.8.exe"
# Var pointing to system-site scripts installed by Windows Store python3.8:
py38Scripts = "C:\Program Files\Python38\Scripts"
# Var pointing to user-site scripts installed by Windows Store python3.8:
py38ScriptsUser = "D:/Carl/AppData/Python/Python38/Scripts"
# Var containing list of scripts in user-site scripts dir:
py38ScriptsList = (Get-ChildItem $py38ScriptsUser).FullName
# Var pointing to system-site scripts for Windows Store python3.9 -m pip
# `--user` and regular install both install to this folder (dir).
$py39Scripts = "C:\Users\Carl\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\Scripts"
}


$miniconda = "$env:USERPROFILE\miniconda3"

$pylibs = @{
msysmingw = @{
    mingw = @{
	lib = @{
	    py39 = "D:\MSYS2\mingw64\lib\python3.9"
	    py38 = "D:\MSYS2\mingw64\lib\python3.8"
	}
    }
    msys = @{
	lib = "D:\MSYS2\usr\lib\python3.9"
    }
}
}
# Source WriteColor.psm1 from dependencies as module
# TODO: figure out why this ends up in the global scope...
function Write-MySuccess {
    import-module "$scrps\ScriptsAndFunctions\dependencies\WriteColors.psm1"
    echoDarkYellow "Loaded $PSScriptRoot\pyFileSysLocations.ps1"
}
Write-MySuccess
# Add location to msys home
$pylibs.msysmingw.home = "D:\MSYS2\home\"
