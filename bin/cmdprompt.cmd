:: Prompt setter for cmd.exe
:: This will set the prompt to the prompt string below
:: Author: Carl C
:: License: MIT
:: Date: Monday, April 26, 2021 3:07:28 AM
:: OriginalLocation: %USERPROFILE%\dumps\cmdprompt.cmd

@ECHO off
start wt.exe new-tab
cmd.exe /K
@PROMPT $C$T$F$M$_$L$P$G$$
ECHO "Prompt string has been set"
