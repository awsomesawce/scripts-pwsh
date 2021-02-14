##### Other PS Functions #####
# Please add functions to this file instead of the main powershell profile.

## Aliases for common Cmdlets
# These aliases aren't defined by default, but they are quite useful.
#
Set-Alias cfjs -Value ConvertFrom-Json
Set-Alias add -Value Add-Content -Description "An alias for Add-Content that just makes sense."
Set-Alias -Name "sob" -Value "Select-Object" -Description "A shorter select"
Set-Alias -Name rename -Value Rename-Item -Description "A smart rename alias"
Set-Alias ghlp -Value Get-Help -Description "A short get-help"

# TODO: Create a function for viewing Get-Help output in a pager.

function getHelpPage {
    Get-Help "$@"
}


## Aliases for common external commands and programs, like Git
# INFO: In powershell, Aliases can generally have no arguments.  If you want to add arguments to an alias
# you need to write a function first.
Set-Alias -Name g -Value git -Description "Git in one letter"
Set-Alias -Name np -Value notepad.exe -Description "A simple way to open notepad" -Option ReadOnly

## Other useful functions

# WSL-specific functions
Function catbashrc { wsl cat ~/.bashrc } # This will output content of ~/.bashrc to terminal.
Function editbashrc { wsl nvim ~/.bashrc }

# TODO: test this function for starting a powershell process as Admin.
function Start-PSAdmin {Start-Process pwsh -Verb RunAs}
