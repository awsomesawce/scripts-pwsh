#!/usr/bin/env -S pwsh -noprofile
# `which` command in pwsh
# returns location of executable if it is an application,
# else returns the CommandInfo object

<#
.DESCRIPTION
Which command in a powershell script
.PARAMETER CommandName
Name of command to query with `which`.
.PARAMETER ScoopInfo
Query scoop package manager for CommandName if installed by `scoop install`
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [String]$CommandName
)

$Local:CommInfo = Get-Command $CommandName
# CommandType had to be instansiated in a separate variable...
$Local:CommType = $Local:CommInfo.CommandType

switch ($CommType) {
    "Application" {
        Write-Debug "$CommandName is an application"
         return "$($Local:CommInfo.Source)" 
        }
    "Function" { return "Command is a function" }
    default {
        Write-Output "Default response"
        return $CommInfo
    }
}
