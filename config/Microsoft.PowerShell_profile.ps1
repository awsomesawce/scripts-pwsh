# Carl's kickass Powershell Profile!
# Description: Powershell Profile that is sourced at every invocation of Powershell.
# 	Use `pwsh -nop` for cli scripting from another shell.
# Author: Carl C. (awsomesawce at outlook dot com)
# Date: 6/22/2021
# License: MIT
# GitRepo: https://github.com/awsomesawce/scripts-pwsh/config
# OriginalLocation: D:\Carl\Documents\Powershell
# Notes: Adding params to used functions.
# 	> All small functions are not indented the same way as fleshed-out functions.
# 	> I try to keep them at max 2 lines.
# 	> In 2 line if statements, the else statement is the 2nd line.

# Disable Microsoft Telemetry
$env:POWERSHELL_TELEMETRY_OPTOUT = 1
$env:DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT = 1

# Import current modules.
Import-Module posh-git
Import-Module oh-my-posh
#Import-Module z
# Set prompt
Set-PoshPrompt -Theme zash && Write-Verbose "Set posh prompt to zash"

# Adjust Python Path.
#${env:Python PATH} = "C:\Users\Carl\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache"

# Add requires statements because I'm using ternary operators.
#Requires -Version 6.2
#Requires -PSEdition Core

### IMPORTANT ENV VARIABLES ###
# Set `$env:PAGER` if it is null or empty, otherwise leave it alone.
#([string]::IsNullOrWhiteSpace($env:PAGER)) ? ($env:PAGER = "less" && Write-Output "Set `$env:PAGER to $env:PAGER.") : (Write-Output "`$env:PAGER already set to $env:PAGER")
# Set `$env:EDITOR` if it is null or empty, otherwise leave it alone and report back.
#([string]::IsNullOrWhitespace($env:EDITOR)) ? ($env:EDITOR = "vim" && Write-Output "Set `$env:EDITOR to $env:EDITOR.") : (Write-Output "`$env:EDITOR already set to $env:EDITOR")

# This little block of code tests whether Env:\PAGER has the correct
# value, then it acts accordingly .
($env:PAGER -eq "less") ? $(Write-Output "``less`` is already _set_ as the value for ``env:PAGER``") : `
$(Write-Output "``less`` is not the pager, setting less as pager."` 
$env:PAGER = "less")
# TODO: add if statements for env var declaration.
$env:EDITOR = "vim"
# Nifty code block:
# Sets the windows code page to UTF8 if it is not set, and reports back if it is correctly set.
# TODO: Fix this.
$codepage = $(chcp)
($codepage.EndsWith("65001")) ? (Write-Output "codepage is correctly set") : $(
Write-Output "Setting codepage"
chcp 65001 | Out-Null
$codepage = $(chcp)
Write-Output "Codepage is now set to 65001"
)

# Source other_functions script and projectvars script.
$PSDirectory = (Split-path -Parent $PROFILE)

# BEGIN Source Scripts {{{
# TODO: Clean this up a bit.


$scrps = if ([string]::IsNullOrWhitespace($scrps)) {
    "$env:USERPROFILE\gitstuff\scripts-pwsh"}
$Script:scriptspwsh = "$scrps\config"
$otherFunctionsScript = "$Script:scriptspwsh\other_functions.ps1"
$mainConfigScripts = @("$projectvarsScript", "$PROFILE", "$otherFunctionsScript")

# Try ternary operation.
# TODO: Add a failsafe so it works with Windows Powershell too.
if (Test-Path "$otherFunctionsScript") {
    . "$otherFunctionsScript"
    Write-Verbose "`$otherFunctionsScript has been loaded.  Its path = $otherFunctionsScript"
} else {
    Write-Error "$otherFunctionsScript file not found."
}

$projectvarsScript = "$Script:scriptspwsh\projectvars.ps1"
if ($PSVersionTable.PSVersion.Major -gt 5) {
    # Use ternary operator
    (Test-Path $projectvarsScript) ? (. $projectvarsScript) : (Write-Output "projectvars.ps1 not found")
} else {
    if (Test-Path "$projectvarsScript") {
	. "$projectvarsScript"
    } else {
	Write-Error "Could not find $projectvarsScript"
    }
}
# BEGIN set psdir variable to local powershell directory, and set other variables.
$gitDir="D:/Carl/Documents/GitHub"
$oneDrive="$env:OneDrive"
$localAppData="C:/Users/Carl/AppData/Local"
$globalAppData="D:/Carl/Appdata"
# END set psdir variable to local powershell directory, and set other variables.
# The environment variable below sets XDG_CONFIG_HOME, which then tells nvim to look for it's
# init file in that directory instead of AppData/local/nvim
# That is bad, we have no configuration in ~/.config.
# If you want to start nvim without having any config, set the $env:XDG_CONFIG_HOME variable.
#$env:XDG_CONFIG_HOME="C:\Users\Carl\.config"

### BEGIN SOURCING PROFILE SCRIPTS
### TODO: Make this a sourcable module for easy maintainability.


# Source PATH_mods.ps1
$Script:pwshconfig = (Get-Item "C:\Users\Carl\gitstuff\scripts-pwsh\config")
$Script:pwshconfigstr = "C:\Users\Carl\gitstuff\scripts-pwsh\config"
$Script:pathModsScript = "$pwshconfigstr\PATH_mods.ps1"
if (Test-Path $pathModsScript) {
    Write-Verbose "Sourcing $pathModsScript"
    . "$pathModsScript"
} else {
    Write-Error "PATH_mods.ps1 file not existing"
}

# Source choco_functions.ps1
function Source-Chocofuncs {
    if (Test-Path "$pwshconfigstr\choco_functions.ps1") {
	Write-Verbose "Sourcing $pwshconfigstr\choco_functions.ps1"
	. "$pwshconfigstr\choco_functions.ps1"
    } else {
	Write-Error "choco_functions script is not where its supposed to be"
    }
}
Source-Chocofuncs

function Source-UsefulNavFunctions {
    $usefulNavFunctions = "C:\Users\Carl\gitstuff\scripts-pwsh\ScriptsAndFunctions\useful-nav-functions.ps1"
    if (Test-Path "$usefulNavFunctions") {
	Write-Information "Dot-Sourcing $usefulNavFunctions"
	. "$usefulNavFunctions"
    } else {
	return Write-Error "$usefulNavFunctions script not found."
    }
}
Source-UsefulNavFunctions

$Script:textFunctions = if ($scrps) {"$scrps\ScriptsAndFunctions\textFunctions.ps1"}
if (Test-Path $Script:textFunctions) {
    . "$Script:textFunctions"
} else {
    Write-Error "$Script:textFunctions not found"
}

# NOTE: Array that lists every script file that is sourced upon pwsh init. INCOMPLETE
$Script:sourcedPwshFiles = @("$pathModsScript", "$pwshconfigstr\choco_functions.ps1", "$scrps\ScriptsAndFunctions\useful-nav-functions.ps1", "$Script:textFunctions", "$scrps\config\other_functions.ps1")

foreach ($i in $Script:sourcedPwshFiles) {
    Write-Output "Sourced $i"
}
# END Source Scripts }}}

$DOTFILESGIT = "$env:USERPROFILE\gitstuff\my-dotfiles"
# Fixing functions
# DONE: Get rid of unnecessary functions in $PROFILE
# Aliases
# use single-quotes for strings with spaces
# TODO: In progress: Moving Set-Alias declarations to separate
# file. other_functions.ps1 in config dir.
Set-Alias -Name lsc -Value Get-ChildItemColorFormatWide -Description "A better color ls"

# This one sets an alias for the ri command in ruby
set-alias -name rubyri -value D:\Ruby27-x64\bin\ri.cmd -Description "A workaround for ruby's ri, cuz in pwsh ri is remove-item"
Set-Alias -Name exp -Value explorer.exe
Set-Alias -Name man -Value D:\Cygwin\bin\man.exe -Description "Show info file from cygwin which includes a lot more documentation than the windows emacs info"
## TODO: Move Aliases and Functions into their own respective files and source each file.
## Functions

# Next is a function that allows me to change to my powershell directory where my profile is.
Function GotoPSDir {Set-Location -Path $PSDirectory}
Set-Alias -Name psdir -Value GotoPSDir

# This is just a function to cd to my notes dir
Set-Variable -Name notesdir -Value D:\Carl\OneDrive\Notable\notes\ -Description "Notable notes directory"
Function GotoNotesDir {Set-Location -Path $notesdir}
# Set-Alias to make notes dir even more easily accessible
Set-Alias -Name ndir -Value GotoNotesDir
# Function for invoking ubuntu wsl with carlc user and zsh shell
# Function to get to standard parent git directory
Function gitdir {Set-Location -Path $gitDir}
Function nodeschool {Set-Location -Path "D:\Carl\Documents\GitHub\node-school"}
# get to emacs org directory located in OneDrive quickly.
# This is a function for git status, not Get-GitStatus, which is a posh-git cmdlet.
Function gpgmee {gpg -se -r Carl}
Function gcift {Get-ChildItem | Format-Table}
Function npmDoc {Set-Location -Path 'C:\Program Files\nodejs\node_modules\npm\docs'}
# Backup folder for dotfiles in both Windows and Ubuntu
# Easily page thru long ls lists
Function lspage {Get-ChildItem | less}
Set-Alias -Name lsl -Value lspage
Set-Alias -Name gitbash -Value 'D:\Program Files\Git\git-bash.exe'
# TODO: Instead of creating external scripts, you can create a function for each.
Set-Alias -Name ... -Value D:\Carl\Documents\PowerShell\Scripts\backwards_cd.ps1 -Description "go up two directories."
Set-Alias -Name .. -Value D:\Carl\Documents\PowerShell\Scripts\backwards_cd1.ps1 -Description "go up a directory"
Set-Alias -name ipinfo -Value D:\Carl\Documents\PowerShell\Scripts\getipinfo.ps1
# Alias for Get-GitStatus function provided by posh-git
set-alias -Name gitstat -Value Get-GitStatus
# ren is also an alias for rename-item
Set-Alias -Name ghlp -Value Get-Help -Description "A shorter gethelp."
# Reset rememberfile variable to quicktodo instead
Set-Variable -Name quicktodo -Value D:\Carl\OneDrive\TODO\quicktodo.md
Set-Variable -Name rememberfile -Value D:\Carl\OneDrive\TODO\quicktodo.md
Set-Variable -Name remember -Value $oneDrive/remember.md
Set-Variable -Name DESKTOP -Value D:\Carl\OneDrive\Desktop\ -Description "Shortcut to the Desktop folder"
Write-Output "Welcome Carl!"
Set-Alias -Name shmd -Value Show-Markdown -Description "Alias for Show-Markdown"
# TODO: Organize aliases and functions.
# TODO: Put all aliases in separate script and source the script.
# Hello from embedded nvim!
# Use `K' to see a docstring for the cmdlet at point in `nvim'
Set-Variable -Name NVIMINITVIM -Value C:\Users\Carl\AppData\Local\nvim\init.vim -Description "Main config file for neovim"
# Save this and other weird variables to a sourcable pwsh script:
Set-Variable -Name randomnotes -Value D:\Carl\OneDrive\TODO\randomoutput.md
Set-Variable pwshsnippets -Value "D:\Carl\OneDrive\snippets\pwsh\powershell_snippets.txt" -Description "out-file for writing quick powershell snippets from the command line"

## Sourcing Scripts
# TODO: Put all sourced scripts in the same place.
. D:\Carl\Documents\PowerShell\Scripts\_rg.ps1 # source rg completion script

# DONE: Copy the above two lines to .\Scripts\other_functions.ps1 scriptfile, and set a variable to
# refer to the script file for ease of access
# This expression is necessary for python's fuck module to work.
#Invoke-Expression "$(thefuck --alias)"
# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
 }
