#!/usr/bin/env -S powershell.exe -noprofile
# Working with script blocks

<#
.Description
Working with script blocks instead of function definitions
.NOTES
They are similarly executed, but you have to use Invoke-Expression to execute a
script block stored in a variable
#>
[scriptblock]$x = {
split-path (get-command -all python*).Source | Sort-Object -Unique}
# Typing "$x".<tab> or <CTRL>+<Space> will show some interesting
# methods around script-block functions.
# They have the same methods as the `$function:myfunc` variable does
