# Disable Telemetry
$env:POWERSHELL_TELEMETRY_OPTOUT = 1
# Import current modules.
Import-Module posh-git
Import-Module oh-my-posh
#Import-Module z
# Set prompt
Set-PoshPrompt -Theme sorin
# Source variables for current projects into PSSession
$PSDirectory="D:/Carl/Documents/Powershell"

$otherFunctionsScript = "$PSDirectory/Scripts/other_functions.ps1"
if (Test-Path "$otherFunctionsScript") {
    . "$otherFunctionsScript"
    Write-Progress "`$otherFunctionsScript = $otherFunctionsScript and 
    has been loaded."
} else {
    "$otherFunctionsScript file not found."
}

$scriptspwsh = "$env:USERPROFILE\gitstuff\scripts-pwsh\config"
$projectvarsScript = "$scriptspwsh\projectvars.ps1"
(Test-Path $projectvarsScript) ? (. $projectvarsScript) : (Write-Output "projectvars.ps1 not found")
# If ternary operator is incompatible, use this:
# if (Test-Path ~/gitstuff/scripts-pwsh/config/projectvars.ps1) {
# . ~/gitstuff/scripts-pwsh/config/projectvars.ps1
# } else {
# Write-Output "projectvars.ps1 not found"
# }
# Set prompt
Set-PoshPrompt -Theme powerlevel10k_classic
# set psdir variable to local powershell directory, and set other variables.
$gitDir="D:/Carl/Documents/GitHub"
$oneDrive="D:/Carl/OneDrive"
$localAppData="C:/Users/Carl/AppData/Local"
$globalAppData="D:/Carl/Appdata"
# The environment variable below sets XDG_CONFIG_HOME, which then tells nvim to look for it's
# init file in that directory instead of AppData/local/nvim
# That is bad, we don't want that because it gets rid of our configuration.
# If you want to start nvim without having any confing, set the $env:XDG_CONFIG_HOME variable.
#$env:XDG_CONFIG_HOME="C:\Users\Carl\.config"

## This option sets the command line editor to have Emacs-like keybindings.
## You can set more options using Set-PSReadlineKeyHandler
#Set-PSReadLineOption -EditMode Windows
$DOTFILESGIT = "$HOME/gitstuff/my-dotfiles"
function dotFiles {Set-Location $DOTFILESGIT}
# Aliases
# use single-quotes for strings with spaces
# TODO: In progress: Moving Set-Alias declarations to separate
# file.
Function lsWide {Get-ChildItem | Format-Wide}
Set-Alias -Name lsw -Value lsWide -Description 'ls but format-wide'
Set-Alias -Name list -Value Get-ChildItemColorFormatWide

## Set-Location to a wsl distro file system
Function gotoubuntu {Set-Location \\wsl$\Ubuntu-20.04\home\carlc}

## Open Powershell profile from anywhere
## Just type $EDITOR $PROFILE where $EDITOR is any text editor.
## Nvim config shortcut # remember to use backslashes.
Function nvimconfig {nvim $localAppData\nvim\init.vim}
Function neovconfig {neovide.ps1 $localAppData\nvim\init.vim}
## Nvim 2 window shortcut
Function nvim2 {nvim -O2}
Function nvim22 {nvim -O2 -p2}
Function fvim22 {fvim -O2 -p2}
Function nvimdiff {nvim -d}
Function fvimdiff {fvim -d}
function nvimqtdiff {nvim-qt -d $args}
## Shortcut for duckduckgo
$duckduck = "https://duckduckgo.com"
function ducks { Start-Process $duckduck }
$CYGDIR = (Get-Item "D:\Cygwin")
Set-Variable -Name CYGBIN -Value "$CYGDIR\bin" -Description "Variable that points to Cygwin's bin directory."
Set-Alias -Name np -Value notepad.exe -Description "A shorter notepad alias."
# This one sets an alias for the ri command in ruby
set-alias -name rubyri -value D:\Ruby27-x64\bin\ri.cmd -Description "A workaround for ruby's ri, cuz in pwsh ri is remove-item"
Set-Alias -Name exp -Value explorer
Set-Alias -Name man -Value D:\Cygwin\bin\man.exe -Description "Show info file from cygwin which includes a lot more documentation than the windows emacs info"
Set-Alias -Name lsc -Value Get-ChildItemColorFormatWide -Description "Better alias for color ls"
function linuxls {D:\Cygwin\ls.exe --color=always --group-directories-first}
Set-Alias -Name lxls -Value linuxls -Description "Linux type of ls."
Set-Alias -Name rdis -Value rdiscount -Description "Shorter rdiscount"
Set-Alias -Name kram -Value kramdown -Description "Shorter kramdown"
Set-Alias -Name pd -Value pandoc -Description "Shorter Pandoc"
Set-Alias -Name msys -Value D:\MSYS2\msys2_shell.cmd -Description "Use --help for invoke options"
Set-Alias -Name git-cola -Value C:\Users\Carl\AppData\Local\git-cola\bin\git-cola.exe -Description "Git-cola because "
## Beware when starting shells directly from cygwin's bin.
## It will not inherit the necessary env variables from Windows.
Set-Alias -Name cygbash -Value D:\Cygwin\bin\bash.exe -Description "Use man bash for help"
Set-Alias -Name cygtcsh -Value D:\Cygwin\bin\tcsh.exe -Description "Cygwin's tcsh"
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
Function gitst {git status}
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
Set-Alias -Name lg -Value 'lazygit'
Set-Alias -name localad -Value localappdata
Set-Alias -Name gitbash -Value 'D:\Program Files\Git\git-bash.exe'
Set-Alias -Name ... -Value D:\Carl\Documents\PowerShell\Scripts\backwards_cd.ps1
Set-Alias -Name .. -Value D:\Carl\Documents\PowerShell\Scripts\backwards_cd1.ps1
Set-Alias -name ipinfo -Value D:\Carl\Documents\PowerShell\Scripts\getipinfo.ps1
Set-alias -Name invo -Value Invoke-Item -description "Shorter invoke-item"
# Alias for Get-GitStatus function provided by posh-git
set-alias -Name gitstat -Value Get-GitStatus
Set-Alias -Name list -Value Get-ChildItemColor
# Above makes the ls command always use Get-ChildItemColor
# This attaches the rename command to rename item
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
