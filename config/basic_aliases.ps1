# Pwsh Aliases file
# This is where I plan to house most if not all my aliases
# Update: as of right now, this file is a placeholder.  Aliases are contained in
# `other_functions.ps1`.  The reason for this is because of how PowerShell handles Aliases.
# Separating aliases from the functions they relate to would just make things more difficult to maintain.
# TODO: rename this file to `basic_aliases.ps1`.

# Plain-old useful aliases:

Set-Alias -Name "g" -Value "git" -Description "Super short git alias"
Set-Alias -Name "np" -Value "notepad.exe" -Description "Super short notepad shortcut alias"
Set-Alias -Name "exp" -Value "explorer.exe" -Description "Super short way to open Windows explorer"

# More obscure aliases that are not set by default:

set-alias -Name wh -Value Write-Host
set-alias -Name cvfm -Value ConvertFrom-Markdown -Description "Easier to type convertfrom-markdown"

# These aliases aren't defined by default, but they are quite useful.

Set-Alias cfjs -Value ConvertFrom-Json -Description "Convertfrom json in 4 letters"
Set-Alias c2json -Value Convertto-Json -Description "Different from ConvertFrom-Json by 2 letters"
Set-Alias add -Value Add-Content -Description "An alias for Add-Content that just makes sense."
Set-Alias -Name "sob" -Value "Select-Object" -Description "A shorter select"
Set-Alias ghlp -Value Get-Help -Description "A short get-help"
Set-Alias -Name "hlp" -Value "Help" -Description "An even shorter help.  One less letter."
