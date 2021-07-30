# Carl's kickass Powershell Profile!
# Description: Powershell Profile that is sourced at every invocation of Powershell.
# 	Use `pwsh -nop` for cli scripting from another shell.
# Author: Carl C. (awsomesawce at outlook dot com)
# Date: 6/22/2021
# License: MIT
# GitRepo: https://github.com/awsomesawce/scripts-pwsh/
# OriginalLocation: D:\Carl\Documents\Powershell
# Notes: Adding params to used functions.
# 	> All small functions are not indented the same way as fleshed-out functions.
# 	> I try to keep them at max 2 lines.
# 	> In 2 line if statements, the else statement is the 2nd line.

# Disable Microsoft Telemetry
$env:POWERSHELL_TELEMETRY_OPTOUT = 1
$env:DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT = 1

# Import current modules.
# 7/29/2021 - Disabled import-module for posh-git and oh-my-posh, but they are still loading
#Import-Module posh-git # temp disable
#Import-Module oh-my-posh # temp disable
#Import-Module z
# Set prompt
Set-PoshPrompt -Theme zash && Write-Verbose "Set posh prompt to zash"

# Adjust Python Path.
#${env:Python PATH} = "${env:Python PATH};C:\Users\Carl\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\Scripts"

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
#### TODO ####: Create sourcable script that sets env vars in a more thorough way using type literals like above.
# That way it doesn't muck up the profile.
$env:PAGER = if (Get-Command less -ErrorAction ignore) {"less"} else {"more"}
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

# Set this value to wherever you have the git repo installed
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
$Script:sourcedPwshFiles = @("$pathModsScript", "$scrps\ScriptsAndFunctions\useful-nav-functions.ps1", "$Script:textFunctions", "$scrps\config\other_functions.ps1")

foreach ($i in $Script:sourcedPwshFiles) {
    Write-Output "Sourced $i"
}
# END Source Scripts }}}

$DOTFILESGIT = "$env:USERPROFILE\gitstuff\my-dotfiles"
# TODO: In progress: Moving Set-Alias declarations to separate
# file. other_functions.ps1 in config dir.
Set-Alias -Name lsc -Value Get-ChildItemColorFormatWide -Description "A better color ls"

## Source Profile_Extra.ps1
## Profile_Extra.ps1 contains a bunch of aliases and quick functions that may or may not still be necessary, but we're
## Keeping it for now.

$ProfileExtra = if (test-path "$scrps\config\Profile_Extra.ps1") {"$scrps\config\Profile_Extra.ps1"} else {return Write-Error "ProfileExtra not found"}
. "$ProfileExtra"

## Sourcing Scripts
# TODO: Put all sourced scripts in the same place.
. D:\Carl\Documents\PowerShell\Scripts\_rg.ps1 # source rg completion script

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
 }


# TODO: Adjust profile to source all scripts at the end.
$psenv = if (test-path "C:\Users\Carl\gitstuff\my-dotfiles\templates\.psenv.ps1") {
    "C:\Users\Carl\gitstuff\my-dotfiles\templates\.psenv.ps1" }
    else { return Write-Error ".psenv.ps1 not found in my-dotfiles repo"}
# If .psenv.ps1 is in current directory, dotsource, else write error
# TODO: Write alternate non-ternary version
#(get-item .psenv.ps1 -ErrorAction Ignore) ? ( . ./.psenv.ps1) : (Write-error ".psenv.ps1 is not there")

$pyFileSys = (Test-Path "$scrps\utils\pyFileSysLocations.ps1") ? ("$scrps\utils\pyFileSysLocations.ps1") : (Write-Error "pyfilesys script not found")
$choice = read-host -Prompt "Load psFileSysLocations variables? y or n "
if ($choice -eq "y") {
    . $pyFileSys
} else { Write-Error "Not loading $pyFileSys"}
# Adjust path to accept deno bin dir
$env:Path = "C:\Users\Carl\.deno\bin;$env:Path"
