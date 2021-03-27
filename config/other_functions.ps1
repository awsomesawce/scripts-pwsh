##### Other PS Functions #####
# Please add functions to this file instead of the main powershell profile.
# Author: Carl C. (awsomesawce@github.com)

## Aliases for common Cmdlets
# These aliases aren't defined by default, but they are quite useful.
#
Set-Alias cfjs -Value ConvertFrom-Json -Description "Convertfrom json in 4 letters"
Set-Alias c2json -Value Convertto-Json -Description "Different from ConvertFrom-Json by 2 letters"
Set-Alias add -Value Add-Content -Description "An alias for Add-Content that just makes sense."
Set-Alias -Name "sob" -Value "Select-Object" -Description "A shorter select"
Set-Alias ghlp -Value Get-Help -Description "A short get-help"
Set-Alias -Name "hlp" -Value "Help" -Description "An even shorter help.  One less letter."
#
# TODO: Create a function for viewing Get-Help output in a pager.
# UPDATE: Function isn't needed.  Powershell 7 detects the
# $env:PAGER variable which was set in the profile.  If it has `less` as the PAGER,
# then using `Help` will then use `less` as it's pager program.
# This will allow you to go up or down when viewing the documentation.
#
# Aliases for common external commands and programs, like Git
# INFO: In powershell, Aliases can generally have no arguments.  If you want to add arguments to an alias
# you need to write a function first.
#
Set-Alias -Name g -Value git -Description "Git in one letter"
Function gitst {git status}
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

# Next up is editor functions!
# Neovim config shortcut # remember to use backslashes.
$nvimInitFile = "$localAppData\nvim\init.vim"
function gotonvimconfig {set-location $localAppData\nvim}
Function nvimconfig {nvim $nvimInitFile}

# TODO: test this function for starting a powershell process as Admin.
# EXPERIMENTAL: Function below is experimental.
function Start-PSAdmin {Start-Process pwsh -Verb RunAs}
set-alias -Name split -Value Split-Path
# Use curl chtsh as a function
function chtsh { curl cht.sh/$args }


# This function serves as an example on how to write advanced functions.

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
function gitpp {git pull && git push}

# The following block is copied from barebones_Functions.ps1
# barebones_Functions.ps1
# Author: Carl C (awsomesawce@outlook.com)
# These are functions that are very helpful but don't require a lot of setup.
# This is normally sourced by `barebones_pwsh_profile.ps1` and not by itself.
#
# psWhich is a function that mimicks the output of the `which` unix command.
function psWhich {Get-Command $args | Select-Object -ExpandProperty Source}
# duks allows the user to search from the command line.
function duks {Start-Process https://duckduckgo.com/?q=$args}
# gotoexelocation is a nice command that allows you to chdir right to the directory where 
# the executable is located.  Pretty neat, huh?
function gotoexelocation {
    Set-Location (Split-Path -Parent (get-command $args | Select-Object -ExpandProperty Source))
}
Set-Alias -Name ExeLocation -Value gotoexelocation -Description "Shorter gotoexelocation"
function ndir { set-location $env:OneDrive\Notable\notes }
<#
# The following command is EXPERIMENTAL
#
#>
function getcommandinfo {
    # This is a test to see how splatting works.
    # The $selProps var contains properties that the command should show.
    $Local:selProps = @("name", "commandtype", "source")
    Get-Command -Name @args | Select-Object -Property $Local:selProps
    Write-Information "This is a test"
 }
# End-of-block from barebones_Functions.ps1


# Let the user know that this file was sourced
Write-Host "other_functions file has been loaded from here: "
Write-Host "$otherFunctionsScript"
