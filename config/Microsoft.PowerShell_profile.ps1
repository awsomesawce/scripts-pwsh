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

Import-Module posh-git
#Import-Module oh-my-posh # temp disable
#Import-Module z
# Set prompt
#Set-PoshPrompt -Theme zash && Write-Verbose "Set posh prompt to zash"

# Adjust Python Path.
#${env:Python PATH} = "${env:Python PATH};C:\Users\Carl\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\Scripts"

# TODO: Create a profile version for use with Powershell 5

# This little block of code tests whether Env:\PAGER has the correct
# value, then it acts accordingly .
#### TODO ####: Create sourcable script that sets env vars in a more thorough way using type literals like above.
# That way it doesn't muck up the profile.
$env:PAGER = if (Get-Command less -ErrorAction ignore) {"less"} else {"more"}
# TODO: add if statements for env var declaration.
$env:EDITOR = "vim"
# Sets the windows code page to UTF8 if it is not set, and reports back if it is correctly set.
$codepage = $(chcp)
if ($codepage.EndsWith("65001")) {
    Write-Output "codepage is correctly set"
} else {
    Write-Output "Setting codepage"
    chcp 65001
    $codepage = $(chcp)
    Write-Output "Codepage is now set to 65001"
}

# Source other_functions script and projectvars script.
$PSDirectory = 'D:/Carl/Documents/Powershell'

# BEGIN Source Scripts {{{

# Set this value to wherever you have the git repo installed
$scrps = if ([string]::IsNullOrWhitespace($scrps)) {
    "$env:USERPROFILE\gitstuff\scripts-pwsh"}
$Script:scriptspwsh = "$scrps\config"
$otherFunctionsScript = "$scriptspwsh\other_functions.ps1"
$projectvarsScript = "$scriptspwsh\projectvars.ps1"
$newProjVarsScript = "$scriptspwsh\newProjVars.ps1"

# Try ternary operation.
# TODO: Add a failsafe so it works with Windows Powershell too.
if (Test-Path "$otherFunctionsScript") {
    . "$otherFunctionsScript"
    Write-Output "`$otherFunctionsScript has been loaded.  Its path = $otherFunctionsScript"
} else {
    Write-Error "$otherFunctionsScript file not found."
}

# ProjectvarsScript not working, use newProjVars.ps1 instead
if (test-path $projectvarsScript) {
    Write-Host -Fore yellow "Loading projectvars script"
    . $projectvarsScript
} else {
    Write-Host -Fore red "`$projectvarsScript not found!"
}

if (test-path $newProjVarsScript) {
    . $newProjVarsScript
    write-host -fore cyan "Loaded $newProjVarsScript"
} else { Write-Error "$newProjVarsScript not found" }

# BEGIN set psdir variable to local powershell directory, and set other variables.
$gitDir="D:/Carl/Documents/GitHub"
$oneDrive="$env:OneDrive"
$localAppData="$env:LOCALAPPDATA"
$globalAppData="$env:APPDATA"
# END set psdir variable to local powershell directory, and set other variables.

### TODO: Make this a sourcable module for easy maintainability.

$pwshconfig = (Get-Item "C:\Users\Carl\gitstuff\scripts-pwsh\config")
$pwshconfigstr = if ($pwshconfig) {$pwshconfig.FullName}

# Source PATH_mods.ps1
$pathModsScript = "$pwshconfigstr\PATH_mods.ps1"
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

# NOTE: Array that lists every script file that is sourced upon pwsh init.
# TODO: Implement modules for each file that involves base functions that don't require other files. INCOMPLETE
# 	NOTE on projectvarsscript: Temporarily using $newProjVarsScript instead.
$mainConfigScripts = @("$projectvarsScript", "$PROFILE", "$otherFunctionsScript")
$Script:sourcedPwshFiles = @( $mainConfigScripts,
"$pathModsScript", 
"$scrps\ScriptsAndFunctions\useful-nav-functions.ps1", 
"$Script:textFunctions", 
"$scrps\config\other_functions.ps1"
"$newProjVarsScript")

foreach ($i in $Script:sourcedPwshFiles) {
    Write-Output "Sourced $i"
}
# END Source Scripts }}}

$DOTFILESGIT = "$env:USERPROFILE\gitstuff\my-dotfiles"
# TODO: In progress: Moving Set-Alias declarations to separate
# file. other_functions.ps1 in config dir.
Set-Alias -Name lscolor -Value Get-ChildItemColorFormatWide -Description "A better color ls"

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
# TODO: Do this in the Windows GUI
$env:Path = "C:\Users\Carl\.deno\bin;$env:Path"
# Source wslFunctions.ps1 script
(test-path $wslFuncs) ? (. $wslFuncs) : (Write-error "$wslFuncs not found")
# Source hugo completion script TODO: needs work
$script:hugocomp = (get-item "$scrps/completion/_hugo.ps1").fullname
(test-path "$hugocomp") ? (. "$hugocomp") : (Write-error "hugo completion not found")
# Source completions in completion folder
# TODO
