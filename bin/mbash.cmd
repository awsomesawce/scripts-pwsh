@ECHO off
:: Hope this works.
IF EXIST D:\MSYS2\usr\bin\bash.exe (
    D:\MSYS2\usr\bin\bash.exe -l -i %*
)

EXIT /B %ERRORLEVEL%
:: test string, ignore me
