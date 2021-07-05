#requires -version 5.0

<#PSScriptInfo

.VERSION 0.1.0

.GUID f1776f96-c3e8-4a8d-b5c2-788dc892e96f


.AUTHOR Carl Capodice

.COMPANYNAME None

.COPYRIGHT (c) Carl C.

.TAGS TestModule TestScript

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
No release notes

#>

<#
.DESCRIPTION
Opens advanced bash scripting guide in the browser if no `-Path` is given.
Otherwise invokes the item at path.
.NOTES
Located in scripts-pwsh/ScriptsAndFunctions
#>

[CmdletBinding()]
Param(
    [Parameter(Mandatory = $false, Position = 0, HelpMessage = "Opens ABS Guide in the browser")]
    [string[]]$Path
)

if ($Path) {
    Invoke-item "$Path"
} else {
    $Path = "D:\Carl\Downloads\Latest-Import-From-C\info\abs-guide\index.html"
    Write-Verbose "Opening abs-guide index"
    Invoke-Item "$Path"
}

Write-Verbose "Script complete"
