#!/usr/bin/env pwsh
# Extra stuff that makes the pwsh profile unreadable
# Might get rid of most if not all this crap
# Sourced from $PROFILE at line 167 as of 20210728. Grep for ProfileExtra

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
Set-Variable pwshsnips -Value "D:\Carl\OneDrive\snippets\pwsh\" -Description "Powershell snippet directory"
