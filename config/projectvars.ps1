# A list of variables that point to project directories
# Use `gf` in vim to goto the file at point.
# TODO: add second script for sourcing functions
# Author: Carl C (awsomesawce@outlook.com)
# Date: Mar 28, 2021

# First, set the variable to this script.
# TODO: Get this variable from $PSScriptRoot
Set-Variable -Name projectVarsScript -Value "C:\Users\Carl\gitstuff\scripts-pwsh\config\projectvars.ps1" -Description "Variable pointing to the script."
# NOTE: Ignore warnings based on method of setting pwsh variables.
# BEGIN Added Mar 29, 2021
$gitstuffC = Get-Item "$env:USERPROFILE\gitstuff"
$myDotfiles = Get-Item "$gitstuffC\my-dotfiles"
# END Added Mar 29, 2021
$Local:scriptspwshDir = "$gitstuffC\scripts-pwsh"
$script:configDir = "$Local:scriptspwshDir/config"

# Get the location of the git-tracket pwsh profile and put it in a variable.
Set-Variable -Name profileGitTracked -Value (Get-Item "$Script:configDir/Microsoft.PowerShell_profile.ps1")

# Then, set the rest of the current project variables.
set-variable -Name labscurrent -Value "~/Downloads/labs-node/labs-jan-5-2021/labs" -Description "Current labs"

Set-Variable -Name "UserProfileD" -Value (Get-Item "D:\Carl") -Description "Userprofile directory on data drive"

Set-Variable -Name GitDirectoryD -Value $UserProfileD\Documents\GitHub -Description "Main directory for github hosted projects"

Set-Variable -Name nodeschool -Value "D:\Carl\Documents\GitHub\node-school\" -Description "node-school directory"

Set-Variable -Name nodewebpackproj -Value "D:\Carl\Documents\GitHub\my-webpack-demo" -Description "My webpack demo git dir"

Set-Variable -Name pwshsnippets -Value "D:\Carl\OneDrive\snippets\pwsh\powershell_snippets.txt" -Description "out-file for writing quick powershell snippets from the command line"

Set-Variable -Name NVIMINITVIM -Value C:\Users\Carl\AppData\Local\nvim\init.vim -Description "Main config file for neovim"
Set-Variable -Name DESKTOP -Value $env:OneDrive\Desktop\ -Description "Shortcut to the Desktop folder"
Set-Variable -Name randomnotes -Value $env:OneDrive\TODO\randomoutput.md -Description "A place to pipe output from pwsh"

function nodesch {set-location $nodeschool}

$env:EDITOR = "nvim" # EDITOR variable to use when invoking unix-like programs.
$env:PAGER = "less" # PAGER variable used by a ton of unix-like programs.
Write-Output "Variables have been imported from $PSScriptRoot\projectvars.ps1"
Set-Variable -Name cyghome -Value "D:\Cygwin\home\Carl" -Description "Set an env variable for this next time"

($profile -clike "*Microsoft*") ? ("Default powershell profile " + $PROFILE + " loaded") : ("Powershell profile does not contain `"Microsoft`"")
# Add variable for perlcbin installed from scoop
$perlcbin = Get-item $env:USERPROFILE\scoop\apps\perl\current\c\bin\
$binDirs = "$env:OneDrive\Desktop", "$env:USERPROFILE\bin", "D:\Carl\bin"
function listBinDirs {
  Write-Output "This will list all the bin directories and optionally their contents."
  Write-Output "`$binDirs = $binDirs"
  Write-Output "`$perlcbin = $perlcbin"
}
set-alias -Name dotent -Value dotnet -Description "Start dotnet on spelling error"
$snippets = "$oneDrive\snippets"
$snippets = "$env:OneDrive\snippets"

$cygwin_installer = C:\Users\Carl\Downloads\Cygwin Package Installer

Write-Output "`$cygwin_installer is set to $cygwin_installer"
$barebonesDir = "D:\Carl\OneDrive\snippets\pwsh\barebones\"
$barebonesFunctionScript = "D:\Carl\OneDrive\snippets\pwsh\barebones\barebones_Functions.ps1"
