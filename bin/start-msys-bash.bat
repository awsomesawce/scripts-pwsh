@ECHO off
SETLOCAL enableextensions
@rem This file will start msys-bash
@rem Gonna try to make this a cmd.exe only bat file.
::start pwsh.exe -noprofile -f .\msys-bash.ps1
set PAGER=less
set TERM=
SET MSYSTEM=mingw64
SET msysbin=D:\MSYS2\usr\bin
IF EXIST "%msysbin%\bash.exe" (
  ECHO Bash.exe exists, I need to invoke the expression.
  ::"%msysbin%\bash.exe -l -i"
) ELSE (
  ECHO The referenced directory\bash.exe doesnt exist.
)
ENDLOCAL
