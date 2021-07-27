#!/usr/bin/env -S pwsh -noprofile

<#
.Description
Showing how aliases can be created easily in Powershell Core scripts
#>

# You can create aliases inside scripts very easily
# They will exist only within the scope of the script.
# You don't have to worry about spillage of alias and function definitions to 
# spill over to your powershell session.
# Once the script ends, they're gone.

# Say I want to query the system for a pager command.
# I can do something like this.

$pagerCommand = if (Get-Command $env:PAGER -ErrorAction Ignore) {
    "$env:PAGER"
} elseif (Get-Command "less" -ErrorAction SilentlyContinue) {
    "less"
} else { "more.com" }

$Alias:pager = $pagerCommand

# Now can do this to make sure you have the alias set up:
Get-Alias pager | select * | out-host
# And since I love json, lets throw in some convertto-json fun:
Get-Alias pager | convertto-json -Depth 2 | out-host # Out-Host is unnecessary here since this statement outputs to stdout anyway.
# `Out-Host` can also be used as a pager with the -Paging parameter, but it's literally
# the same as `more` as in you _can't scroll back up_.
#
# Powershell devs, why doesn't Powershell have a builtin pager function that allows scrolling
# both up and down?  Get on it!

