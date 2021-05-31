# This powershell file instantiates a hash table for easy access
# to a slew of Module-based commands and config.
# Author: Carl C.
# OriginalLocation: scripts-pwsh\config\moduleHash.ps1
# Status: INPROGRESS

$importantModules = @{}
$importantModules.psake = @{
commands = (Get-Command Invoke-psake), (get-command Exec)
allCommands = (Get-Command -Module psake)
location = (Get-Item "$PSDirectory\Modules\psake\4.9.0")
description = "A Powershell build tool similar to **Rake** in ruby"
}
$importantModules.poshgit = @{
commands = @()
allCommands = (Get-Command -Module posh-git)
location = (Get-Item "D:\Carl\Documents\PowerShell\Modules\posh-git\0.7.3\")
description = "The most popular Powershell module for git integration"
tags = @("git", "automation", "completion")
}
