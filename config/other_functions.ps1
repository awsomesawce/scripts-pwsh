##### Other PS Functions #####
# Please add functions to this file instead of the main powershell profile.
# Author: Carl C. (awsomesawce@github.com)
# Updated: Friday, April 9, 2021 12:37:35 AM


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
Function GitStatusFunc {git status}
set-alias -Name gitst -Value GitStatusFunc -Description "Gets git status in one command."
Set-Alias -Name l -Value Get-ChildItem -Description "List items in directory in one letter"
Set-Alias -Name np -Value notepad.exe -Description "A simple way to open notepad"
Function Open-Node-Docs {Start-Process https://nodejs.org/dist/latest-v14.x/docs/api/}
Set-Alias -Name nodedocs -Value Open-Node-Docs -Description "Open NodeJS docs in a browser"

## Other useful functions

## WSL-specific functions
Function catbashrc { wsl cat ~/.bashrc } # This will output content of ~/.bashrc to terminal.
Function editbashrc { wsl nvim ~/.bashrc }
Function wslubuntu {wsl -u carlc}
Set-Alias -Name wslubu -Value wslubuntu -Description "Shorter wsl ubuntu command"

# Next up is editor functions!
# Neovim config shortcut # remember to use backslashes.
$nvimInitFile = "$env:LOCALAPPDATA\nvim\init.vim"
function gotonvimconfig {set-location $localAppData\nvim}
function nvimconfig {nvim $nvimInitFile}


# TODO: test this function for starting a powershell process as Admin.
# EXPERIMENTAL: Function below is experimental.
#function Start-PSAdmin {Start-Process pwsh -Verb RunAs}
set-alias -Name split -Value Split-Path
# Use curl chtsh as a function
# TODO: Do same thing but use invoke-webrequest instead.
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
function gotoNotesDir { set-location $env:OneDrive\Notable\notes }
Set-Alias -Name ndir -Value gotoNotesDir -Description "Created alias to short command, function has longer name"
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
# This function allows for searching apt-cache database from powershell
function aptcshow {wsl apt-cache show $args}
function aptcsearch {wsl -u carlc apt-cache search $args}
function wslUserLogin {wsl -u carlc}
set-alias wslu -Value wslUserLogin -Description "Shorter access to wsl -u carlc"
# Some nice functions for listing items and sorting them
function list-bigfiles {
get-childitem | where-object -Property length -gt 10000 | sort-object -property Length -Ascending
}
set-alias lsbig list-bigfiles -description "Shorter way to list big files"
function list-hugefiles {
get-childitem | where-object -Property length -gt 100000 | Sort-Object -Property Length -Descending | write-output
}
Set-Alias lshuge -Value list-hugefiles -Description "Shorter way to list huge files"
# TODO: fix the following two functions
#set-alias -Name hjson -Value "$PWD\hjson.cmd" -Description "Set hjson alias so that it references the npm binary instead of the scoop binary, which itself i believe is based on Python"
#set-alias -Name hjson-js -Value "$PWD\hjson.cmd" -Description "Alias for npms hjson which makes it more clear which binary it links to"
set-alias find -Value "D:\Cygwin\bin\find.exe" -Description "Use a better find than the windows version"
function git-commit {git commit -m "$args"}
set-alias gcom -Value git-commit -Description "Git commit shortening"
function git-addcommit {git add . && git commit -m "$args"}
set-alias gaddcom -Value git-addcommit -Description "Shorter git add and commit.  Use arg as git commit message"

# This function goes to the parent directory of the named file.
# Useful for going to the directory of a variable pointing to a file.
# Try `cdto-filelocation $PROFILE`
function cdto-filelocation {
if (Test-Path $args) {
set-location (Split-Path -parent "$args")
} else {
write-output "That is not a valid file name"
}
}

# Standard git shortcuts.  These are usually aliases in bash, but Powershell does not
# allow setting aliases with arguments. Set-Alias won't work.
# The proper way is to create a function with a very specific name, then set an alias to it.
# Like this:
function GitPush {git push}
Set-Alias -Name gpush -Value GitPush -Description "An alias for git push.  Has to be a function first, then point the alias to the function"
function gpull {git pull}

# This function is the same as the one above, but shorter and with no else statement.
function cdfile { 
cd (Split-path -Parent $args) }
# cdfile function allows cding to the parent directory of the named file
# The above function works just like chtsh function in bash.
function pschtsh {
Invoke-webrequest -Uri https://cht.sh/$args | select-object -expandProperty content
}
# To invoke, type "pschtsh term_to_lookup"
# Pipe to a file using `Out-File`

# The function below starts the MSYS2 version of Zsh in place from the host terminal.
# Useful for opening MSYS's zsh _inside_ a modern terminal like Windows Terminal.
# You need to adjust zshrc in order for it to work with msys pathnames instead of cygwin pathnames.
function start-MSYS-zsh {
$script:zshx = "D:\MSYS2\usr\bin\zsh.exe"
if (Test-Path $script:zshx) {
echo "starting msys zsh"
invoke-expression "$script:zshx -l -i"
} else {
echo "cannot find msys zsh"
}
}
function msys-bash {
if (test-path "$msysbin") {
write-host "`$msysbin is set"
write-host "invoking msys bash with -l and -i options"
invoke-expression "$msysbin/bash -l -i"
} else {
write-error "`$msysbin is not set or is not there"
write-error "Not starting msys bash"
}
}
function aptitude-show {
# $function:command could be adapted as a param
$function:command = "aptitude show"
Invoke-Expression -Command "wsl -u carlc $function:command $args"
}
