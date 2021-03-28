# This is the _system-wide_ Powershell profile.
# Author: Carl C
# This profile is meant to have the bare minimum needed to work, because
# it is shared amongst ALLUSERS.

# Set telemetry _off_
$env:POWERSHELL_TELEMETRY_OPTOUT = 1

# Optional module imports
#Import-Module posh-git
#Import-Module oh-my-posh
# Aliases
# use single-quotes for strings with spaces
#Set-Alias -Name lsw -Value 'Get-ChildItem | Format-Wide' -Description 'ls but format-wide'
#Set-Alias list Get-ChildItemColorFormatWide

# Standard command aliases that everybody can agree on.
Set-Alias -Name np -Value notepad.exe -Description "Easy way of opening notepad at the cmdline."
set-alias -name rubyri -value C:\Ruby26-x64\bin\ri.cmd -Description "A workaround for ruby's ri, cuz in pwsh ri is remove-item"
Set-Alias -Name exp -Value explorer.exe
Set-Alias -Name cygman -Value D:\Cygwin\bin\man.exe -Description "Show info file from cygwin which includes a lot more documentation than the windows emacs info"
Set-Alias -Name lsc -Value Get-ChildItemColorFormatWide -Description "Better alias for color ls"
Set-Alias -Name pd -Value pandoc -Description "Shorter Pandoc"

# Standard cmdlet aliases everyone can deem useful.
Set-Alias -Name ghlp -Value Get-Help -Description "A shorter get-help"
Set-Alias -Name hlp -Value "Help" -Description "Save time typing in help."
Set-Alias -Name c2jn -Value ConvertTo-Json -Description "Save time converting that hash table to json"


## Functions

# Next is a function that allows me to change to my powershell directory where my profile is.
Function PSDir {Set-Location -Path D:\carl\documents\PowerShell\}

# This is just a function to cd to my notes dir
Function NotesDir {Set-Location -Path D:\Carl\Onedrive\Notable\Notes}
# Set-Alias to make notes dir even more easily accessible
Set-Alias -Name ndir -Value NotesDir
Function gitdir {Set-Location -Path D:\Carl\Documents\GitHub}
Function localappdata {Set-Location -Path C:\Users\Carl\AppData}

## TODO and NOTE

<placeholder>PH</placeholder>
