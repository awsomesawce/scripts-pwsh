#requires -version 5.0

<#PSScriptInfo

.VERSION 0.0.1

.GUID

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
 Check for module updates from the PowerShell gallery and create a comparison object.

#>

[CmdletBinding()]
Param(
    [Parameter(Position = 0, HelpMessage = "Opens ABS Guide in the browser")]
    [string[]]$Path
)

if ($Path) {
    Start-Process "$Path"
} else {
    $Path = "D:\Carl\Downloads\Latest-Import-From-C\info\abs-guide\index.html"
    Write-Verbose "Opening abs-guide index"
    Start-Process "$Path"
}

Write-Verbose "Script complete"
