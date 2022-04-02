#!/usr/bin/env -S pwsh -noprofile
# `which` command in pwsh
# returns location of executable if it is an application,
# else returns the CommandInfo object

<#
.DESCRIPTION
Which command as a powershell script
.PARAMETER CommandName
Name of command to query with `which`.
.PARAMETER ScoopInfo
Query scoop package manager for CommandName if installed by `scoop install`
.NOTES
This returns different data depending on what kind of command is queried.
.EXAMPLE
./which-script -CommandName vim
    Return the location of the executable on PATH (C:\Users\Carl\scoop\shims\vim.exe)
.EXAMPLE
./which-script Get-GitStatus
    Returns the definition of Get-GitStatus function from the `posh-git` module.
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
    "Function" {
         Write-Verbose "Command is a function, returning function definition:"
         return $Local:CommInfo.Definition
        }
    default {
        Write-Output "Default response"
        return $CommInfo
    }
}
