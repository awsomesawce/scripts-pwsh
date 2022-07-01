@echo off
setlocal ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

@rem if it finds the msys2 file, it echos each dir in the parent dir of the msys2 file.
IF EXIST C:\msys64\msys2_shell.cmd (
    FOR %%i IN (C:\msys64\*) DO (
        echo %%i
    )
)
SET PAGER=less
IF DEFINED %PAGER (
    echo %PAGER%
) ELSE (
    echo PAGER is not defined
)

endlocal