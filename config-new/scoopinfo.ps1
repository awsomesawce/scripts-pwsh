#!/usr/bin/env -S pwsh -nop

function Get-MyScoopInfo {
<#
.DESCRIPTION
Scoop info but allows array of strings
.NOTES
Changed $Params to Mandatory instead of using an if statement.
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string[]]$Params
    )
    return ($Params | ForEach-Object {scoop info $_})
}
Set-Alias scoopinfo Get-MyScoopInfo -Description:"A shorter scoop info that accepts an array of strings"
