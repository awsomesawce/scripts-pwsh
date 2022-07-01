<# 
.SYNOPSIS
Alias file for `config-new`
.DESCRIPTION
Create a few functions to serve as aliases to the traditional `cmd.exe` commands
Example: `dir /w` turns into `dirw`, but we need a function definition.
.NOTES
See `./aliases.ps1.md`
#>
Write-Host -ForegroundColor Red "Begin ./aliases.ps1"

set-alias l Get-ChildItem -Description "Easy way of listing child items"

function Get-ChildItemWide {
    param(
    [Parameter()][ValidateNotNullOrEmpty()][string]$Path,
    [switch]$Recurse,
    [switch]$Verbose
    )
    $Local:GciParams = @{
            Path=$Path;Recurse=$Recurse;Verbose=$Verbose
        }
    return Get-ChildItem @GciParams | Format-Wide
}
$Script:aliasParams = @{Name="dirw";Value="Get-ChildItemWide";Description="Simulation of cmd.exe's ``dir /w`` command."
Option="None"; Scope="Local"; Verbose=$true}
New-Alias @aliasParams

$Script:aliasParamsOld = $Script:aliasParams

Set-Variable -Description "Parameter hashtable for New-Alias and Set-Alias functions." -Name aliasParams -Verbose -Scope "Script"

$Script:aliasParams.Name = "gciw"
$Script:aliasParams.Option = "Constant"
$Script:aliasParams.Description = "Another simulation of dir /w"
New-Alias @aliasParams

Write-Host -fore red "End ./aliases.ps1"

Write-Host -fore cyan "
====== BEGIN Testing aliasParams object ======
"

Write-Output "
aliasParams.Name is equal to aliasParamsOld.Name?: 
$($Script:aliasParams.Name -ieq $Script:aliasParamsOld.Name)"

Write-Output "aliasParams == aliasParamsOld?: "
Write-Output $($aliasParams -eq $aliasParamsOld)

Write-Output "variable description: $(get-variable aliasParams -scope Script | select-object -exp Description)"
Write-Output "Variable value: ", (get-variable -Scope Script -Verbose -Name aliasParams | select-object -expa value)

Write-Host -fore cyan "====== END Testing aliasParams object ======"
