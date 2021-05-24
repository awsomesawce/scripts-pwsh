# Carl's kickass Powershell Profile!
# It's a little messy but it gets the job done.
# Author: Carl C. (awsomesawce at outlook dot com)
# Date: 4/26/2021
# License: MIT
# GitRepo: https://github.com/awsomesawce/scripts-pwsh/config
# OriginalLocation: D:\Carl\Documents\Powershell
# Notes: Adding params to used functions.
# 	> All small functions are not indented the same way as fleshed-out functions.
# 	> I try to keep them at max 2 lines.
# 	> In 2 line if statements, the else statement is the 2nd line.

# Disable Microsoft Telemetry
$env:POWERSHELL_TELEMETRY_OPTOUT = 1

$codepage = $(chcp)
# Check if codepage is set to 65001, and set it if it is not
($codepage -like "*65001*") ? ("Code page is already set to utf8!  Yay!") : (chcp 65001 > $null)
# Import current modules.
Import-Module posh-git
Import-Module oh-my-posh
#Import-Module z
# Set prompt
Set-PoshPrompt -Theme fish && Write-Verbose "Set posh prompt to fish"
# Source other_functions script and projectvars script.
$PSDirectory = (Split-path -Parent $PROFILE)

# BEGIN Source Scripts {{{
# TODO: Clean this up a bit.
if ([string]::IsNullOrWhitespace($scrps)) {
    $scrps = "$env:USERPROFILE\gitstuff\scripts-pwsh"} else {Write-Error "`$scrps var empty"
    }
$Script:scriptspwsh = "$scrps\config"
$otherFunctionsScript = "$Script:scriptspwsh\other_functions.ps1"

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
    $usefulNavFunctions = "C:\Users\Carl\gitstuff\scripts-pwsh\Scripts\useful-nav-functions.ps1"
    if (Test-Path "$usefulNavFunctions") {
	Write-Information "Dot-Sourcing $usefulNavFunctions"
	. "$usefulNavFunctions"
    } else {
	return Write-Error "$usefulNavFunctions script not found."
    }
}
Source-UsefulNavFunctions

# END Source Scripts }}}

## This option sets the command line editor to have Emacs-like keybindings.
## You can set more options using Set-PSReadlineKeyHandler
#Set-PSReadLineOption -EditMode Windows
$DOTFILESGIT = "$env:USERPROFILE\gitstuff\my-dotfiles"
# Fixing functions
function dotFiles {if (Test-Path "$DOTFILESGIT") {Set-Location $DOTFILESGIT} 
    else {Write-Error "`$DOTFILESGIT variable not found"}}
# Aliases
# use single-quotes for strings with spaces
# TODO: In progress: Moving Set-Alias declarations to separate
# file. other_functions.ps1 in config dir.
Function lsWide {Get-ChildItem | Format-Wide}
Set-Alias -Name lsw -Value lsWide -Description 'ls but format-wide'
Set-Alias -Name list -Value Get-ChildItemColorFormatWide
Set-Alias -Name lsc -Value Get-ChildItemColorFormatWide

## Set-Location to a wsl distro file system
Function gotoubuntu {Set-Location \\wsl$\Ubuntu-20.04\home\carlc}

## Open Powershell profile from anywhere
## Just type $EDITOR $PROFILE where $EDITOR is any text editor.
# IMPORTANT: Copied nvim config functions to other_functions.ps1
## Nvim 2 window shortcut
Function nvim2 {nvim -O2}
Function nvim22 {nvim -O2 -p2}
Function nvimdiff {nvim -d}
function nvimqtdiff {nvim-qt -d $args}
## Shortcut for duckduckgo
$duckduck = "https://duckduckgo.com"
function ducks { Start-Process $duckduck/?q=$args }
# This one sets an alias for the ri command in ruby
set-alias -name rubyri -value D:\Ruby27-x64\bin\ri.cmd -Description "A workaround for ruby's ri, cuz in pwsh ri is remove-item"
Set-Alias -Name exp -Value explorer.exe
Set-Alias -Name man -Value D:\Cygwin\bin\man.exe -Description "Show info file from cygwin which includes a lot more documentation than the windows emacs info"
#Set-Alias -Name lsc -Value Get-ChildItemColorFormatWide -Description "Better alias for color ls"
# The above alias is already in your other_functions.ps1
function linuxls {D:\Cygwin\ls.exe --color=always --group-directories-first}
Set-Alias -Name lxls -Value linuxls -Description "Linux type of ls."
Set-Alias -Name rdis -Value rdiscount -Description "Shorter rdiscount"
Set-Alias -Name kram -Value kramdown -Description "Shorter kramdown"
Set-Alias -Name pd -Value pandoc -Description "Shorter Pandoc"
Set-Alias -Name msys -Value D:\MSYS2\msys2_shell.cmd -Description "Use --help for invoke options"
Set-Alias -Name git-cola -Value C:\Users\Carl\AppData\Local\git-cola\bin\git-cola.exe -Description "Git-cola because "
## Beware when starting shells directly from cygwin's bin.
## It will not inherit the necessary env variables from Windows.
Set-Alias -Name cygtcsh -Value D:\Cygwin\bin\tcsh.exe -Description "Cygwin's tcsh"
$CYGDIR = (Get-Item "D:\Cygwin")
Set-Variable -Name CYGBIN -Value "$CYGDIR\bin" -Description "Variable that points to Cygwin's bin directory."
Set-Alias -Name cygbash -Value "$CYGBIN\bash.exe"
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
Function org_dir {Set-Location -Path $oneDrive\org_dir}
# This is a function for git status, not Get-GitStatus, which is a posh-git cmdlet.
Function gpgmee {gpg -se -r Carl}
Function localAppData {Set-Location -Path C:\Users\Carl\AppData\Local}
Function chdirGAppData {Set-Location -Path $globalAppData}
Function gcift {Get-ChildItem | Format-Table}
Function npmDoc {Set-Location -Path 'C:\Program Files\nodejs\node_modules\npm\docs'}
# Backup folder for dotfiles in both Windows and Ubuntu
Function gotodotfilesbackup {Set-Location -Path $oneDrive\dotfiles_backup}
# Easily page thru long ls lists
Function lspage {Get-ChildItem | less}
Set-Alias -Name lsl -Value lspage
Set-Alias -Name dotdir -Value gotodotfilesbackup
Set-Alias -Name lg -Value 'lazygit' -Description "lazygit is a git management cli"
Set-Alias -name localad -Value localappdata 
Set-Alias -Name gitbash -Value 'D:\Program Files\Git\git-bash.exe'
# TODO: Instead of creating external scripts, you can create a function for each.
Set-Alias -Name ... -Value D:\Carl\Documents\PowerShell\Scripts\backwards_cd.ps1 -Description "go up two directories."
Set-Alias -Name .. -Value D:\Carl\Documents\PowerShell\Scripts\backwards_cd1.ps1 -Description "go up a directory"
Set-Alias -name ipinfo -Value D:\Carl\Documents\PowerShell\Scripts\getipinfo.ps1
Set-alias -Name invo -Value Invoke-Item -description "Shorter invoke-item"
# Alias for Get-GitStatus function provided by posh-git
set-alias -Name gitstat -Value Get-GitStatus
# ren is also an alias for rename-item
Set-Alias -Name rename -Value Rename-Item -Description "A smart rename alias"
Set-Variable -Name CYGBIN -Value 'D:/Cygwin/bin' -Description 'Location for cygwin binaries'
Set-Variable -Name msysbin -Value D:\MSYS2\usr\bin
Set-Alias -Name ghlp -Value Get-Help -Description "A shorter gethelp."
# Reset rememberfile variable to quicktodo instead
Set-Variable -Name quicktodo -Value D:\Carl\OneDrive\TODO\quicktodo.md
Set-Variable -Name rememberfile -Value D:\Carl\OneDrive\TODO\quicktodo.md
Set-Variable -Name remember -Value $oneDrive/remember.md
Set-Variable -Name DESKTOP -Value D:\Carl\OneDrive\Desktop\ -Description "Shortcut to the Desktop folder"
Write-Output "Welcome Carl!"
Set-Alias -Name shmd -Value Show-Markdown -Description "Alias for Show-Markdown"
Function shmdall {
    Show-Markdown -Path *.md
}
Function shmdbrowser {
    Show-Markdown -UseBrowser
}
# TODO: Organize aliases and functions.
# TODO: Put all aliases in separate script and source the script.
# Hello from embedded nvim!
# Use `K' to see a docstring for the cmdlet at point in `nvim'
Set-Variable -Name NVIMINITVIM -Value C:\Users\Carl\AppData\Local\nvim\init.vim -Description "Main config file for neovim"
Function dotgitdiff {Set-Location -Path C:\Users\Carl\gitstuff\my-dotfiles\ && git diff && cd -}
Function dotgitstatus { Set-Location -Path "$HOME/gitstuff/my-dotfiles" && git status && cd - }
# Save this and other weird variables to a sourcable pwsh script:
Set-Variable -Name randomnotes -Value D:\Carl\OneDrive\TODO\randomoutput.md
Set-Variable pwshsnippets -Value "D:\Carl\OneDrive\snippets\pwsh\powershell_snippets.txt" -Description "out-file for writing quick powershell snippets from the command line"

## Sourcing Scripts
. D:\Carl\Documents\PowerShell\Scripts\_rg.ps1 # source rg completion script

# DONE: Copy the above two lines to .\Scripts\other_functions.ps1 scriptfile, and set a variable to 
# refer to the script file for ease of access
# This expression is necessary for python's fuck module to work.
#Invoke-Expression "$(thefuck --alias)"
# This is a test
# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
 }
