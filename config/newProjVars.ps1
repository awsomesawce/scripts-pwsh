# List of variables that point to common directories
# Author: Carl C. (awsomesawce@outlook.com)
# Date: 8/29/2021

# projectvars.ps1 not working right, so for now
# this script may be the main snippets file.

$newProjVars = "$PSScriptRoot\newProjVars.ps1"
$newProjVarsLoaded = $true

$snippets = "$env:OneDrive\snippets"

# Known variables from other sources:
# $scrps, $scriptspwsh

$profileGitTracked = "$scrps/config/Microsoft.PowerShell_profile.ps1"

$ddocuments = "D:\Carl\Documents"

# Common Spelling mistakes
set-alias -Name dotent -Value dotnet -Description "Start dotnet on spelling error"
set-alias -Name get-hlep -Value get-help -Description "Spelling error correction"

# Set barebones profile variables for easy navigation.
$barebonesDir = "D:\Carl\OneDrive\snippets\pwsh\barebones\"
$barebonesFunctionScript = Get-Item "D:\Carl\OneDrive\snippets\pwsh\barebones\barebones_Functions.psm1" # notice psm1
$templates = "C:\Users\Carl\gitstuff\my-dotfiles\templates\"
$nodedocs = "C:\Users\Carl\dumps\nodedocs\latest-fermium\api" # TODO: move nodedocs somewhere else (D:)
$UbuntuHome = "\\wsl$\Ubuntu-20.04\home\carlc"

function listPowershellNotes {
    $one = "$env:OneDrive\Notable\notes\Powershell*"
    $two = "$env:UserProfile\gitstuff\scripts-pwsh-wiki"
    try {	
	return Get-Childitem "$one", "$two"
    } catch {
	return write-error "Error finding powershell notes"
    }
}
# New Python project using conda
$currentPyProj = 'D:\Carl\Documents\PythonProjs'
