#!/usr/bin/env -S pwsh -nop
<#
.SYNOPSIS
Copy `$PROFILE` file to `./config-new/Microsoft.Powershell_profile.ps1` and fail if it exists
.DESCRIPTION
Uses `$fileinfoobject.CopyTo()` method instead of `Copy-Item` to prevent accidental overwrites.
.NOTES
I felt that I needed to keep this separate from the profile and the config modules, so I did.
#>
param(
    [switch]$Overwrite
)

. ./CONSTANTS.PS1

Write-Output $CONSTANTS

# TODO: Use vars for easy access to git profile location.
