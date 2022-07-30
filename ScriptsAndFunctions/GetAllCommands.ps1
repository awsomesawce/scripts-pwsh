#!/usr/bin/env -S pwsh -nop
<#
.DESCRIPTION
Get all commands depending on commandType
#>
[CmdletBinding()]
param()

$Script:allCommands = @{
    Functions = Get-Command -CommandType Function
    Applications = Get-Command -CommandType Application
    ExternalScripts = Get-Command -CommandType ExternalScript
    Aliases = get-command -commandType Alias
    Cmdlets = Get-Command -CommandType Cmdlet
    Filters = Get-Command -CommandType Filter
    Scripts = gcm -CommandType Script
}

return $allCommands
