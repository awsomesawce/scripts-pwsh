#!/usr/bin/env -S pwsh -nop
# Functions relating to npm for Powershell

function rdme {
<#
.Description
Open readme of any npm-installed package in node_modules folder.
.NOTES
No notes.
#>
param([string[]]$dir)
$x = "./node_modules/$dir/README.md"
if ($dir) {
    if (Test-Path $x) {
        bat $x

    }
    else {
        Write-Output "$x not found"
    }
}
else {
    Write-Output "No arg"
}

}
