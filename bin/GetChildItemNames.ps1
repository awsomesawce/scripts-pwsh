#!/usr/bin/env pwsh
<#
.DESCRIPTION
Get Child items names as list of strings
.NOTES
Located in `$scrps\bin`
#>
[cmdletbinding()]
param(
    [Parameter(Mandatory = $false, HelpMessage = "helpmsg", ValueFromPipeline = $true)]
    [string]$Path,
    [Parameter(ParameterSetName = "set1")]
    [string]$Separator = " "
)
Get-ChildItem $Path | Join-String -Property Name -Separator $Separator

