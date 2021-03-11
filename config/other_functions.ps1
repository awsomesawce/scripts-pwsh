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
    Get-Help "$@" | less
}


## Aliases for common external commands and programs, like Git
# INFO: In powershell, Aliases can generally have no arguments.  If you want to add arguments to an alias
# you need to write a function first.
#
Set-Alias -Name g -Value git -Description "Git in one letter"
Set-Alias -Name l -Value Get-ChildItem -Description "List items in directory in one letter"
Set-Alias -Name np -Value notepad.exe -Description "A simple way to open notepad"
Function Open-Node-Docs {Start-Process https://nodejs.org/dist/latest-v14.x/docs/api/}
Set-Alias -Name nodedocs -Value Open-Node-Docs -Description "Open NodeJS docs in a browser"

## Other useful functions

# WSL-specific functions
Function catbashrc { wsl cat ~/.bashrc } # This will output content of ~/.bashrc to terminal.
Function editbashrc { wsl nvim ~/.bashrc }
Function wslubuntu {
    wsl -u carlc
}
Set-Alias -Name wslubu -Value wslubuntu -Description "Shorter wsl ubuntu command"

# TODO: test this function for starting a powershell process as Admin.
function Start-PSAdmin {Start-Process pwsh -Verb RunAs}
set-alias -Name split -Value Split-Path
# Use curl chtsh as a function
function chtsh { curl cht.sh/$args }


# This function can be used if sourced by the powershell session.
# use `. name-of-script.ps1' and the function is then available to use
# This script makes the Send-Greeting cmdlet available to the host!

function Send-Greeting
{
    <#
    .Description
    Send-Greeting: Gets a greeting if name is supplied.
    .PARAMETER Name
    The name of the person you want to greet!
    #>
    [CmdletBinding()]
    Param(
	[Parameter(Mandatory=$true,
	HelpMessage="Enter your name to get a greeting!")]
	[Alias("greeting","sendgreet")]
	[string] $Name
    )

    Process
    {
	Write-Output ("Hello " + $Name + "!")
    }
}
function duks {Start-Process https://duckduckgo.com/?q=$args}
# The above implements what Ive been trying to do for a long time
# Search from the command line!
function kaku {wsl -u carlc kak}
function gitpushsync {git add . && git commit -m "$args" && git pull && git push }
