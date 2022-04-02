# Carl's New Powershell Profile
# Date: 9/22/2021
# Update: 4-2-2022

# Set env vars
$env:PAGER = (get-command 'less' -erroraction ignore) ? ('less') : ('more')
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1
$env:MYPY_CACHE_DIR = "$env:USERPROFILE/.mypycache"
$env:PSMODULEPATH = "$env:PSMODULEPATH;$env:OneDrive/PSModules"

$newconfig = "C:\Users\Carl\OneDrive\dotfiles_backup\config-new" # Path to OneDrive backup for new-config
# Set npm -g bin to beginning of path. FIXME: this is done twice in this file
$env:Path = "C:\Users\Carl\AppData\Roaming\npm;C:\Users\Carl\gitstuff\scripts-pwsh\bin\;$env:Path"
$scrps = (Get-Item "~\gitstuff\scripts-pwsh").FullName

if (get-command start-condaenv -ErrorAction Ignore) {
    Write-Verbose "Starting conda env"
    start-condaenv
} else {
    Write-Warning "start-condaenv not on path."
}


import-module posh-git
# Begin-Module has beginning functions for new setup
import-module "$scrps\config-new\Begin-Module.psm1"
# MySetup has some interesting functions
if (test-path "$scrps\config-new\MySetup.psm1") {import-module "$scrps/config-new/MySetup.psm1"}
$utilFuncs = "$env:OneDrive\snippets\pwsh\utilFuncs\UtilFuncs.psd1"
import-module "$utilFuncs"



$Script:loadgitconfig = $False

if ($loadgitconfig) {
    if (test-path $scrps) {
	    . $scrps/config/Microsoft.Powershell_profile.ps1
    } else {
	    write-error "Cannot find profile"
    }
} else {
	write-host -fore red "`$loadgitconfig = `$False"
}
$env:OLD_PATH = $env:PATH
$env:Path = "C:\Program Files\dotnet\;$env:path"
$changeenvpath = '$env:Path = "C:\Program Files\Go\bin\;$env:Path"'
$Old_path = $env:Path
iex $changeenvpath
write-output "Go has been added to PATH"

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
}
$env:OLD_PATH = $env:Path
$env:Path = "C:\Users\Carl\.cargo\bin;$env:Path"
# FIXME: Add all these path modifications into one place.
$OLD_PATH = $env:path
$env:path = "$codebin;$env:path" # FIXME: I don't know what I did here...

# Use command from Begin-Module
setNpmToBeginning # Sets npm to beginning of path
# End of File: vim sw=4;
$env:OLD_PATH = $env:PATH
$env:Path = "C:\Users\Carl\AppData\Roaming\Python\Python39\Scripts;$env:Path"
# Source rustup completion script
. $scrps\completion\_rustup.ps1
# Source gh completion present on filesystem.
if (test-path $scrps\completion\_gh.ps1) {
    . "$scrps\completion\_gh.ps1"
} else {
    write-output "Initializing gh completion by using gh"
    Invoke-Expression -Command $(gh completion -s powershell | out-string)
}
# FIXME: Add this variable to Begin-Module
# Add var for psenv used in npm projects
$psenv = "$env:USERPROFILE\gitstuff\my-dotfiles\templates\.psenv.ps1"
# Automatic gh completion
#Invoke-Expression -Command $(gh completion -s powershell | out-string)
set-alias l -Value get-childitem -Description "Super small ls"
set-alias '..' -Value cd..
# This is not working...
<#set-alias ImportAllModules -Value $(get-command "$env:OneDrive/PSModules/importAll.ps1") -Description @"
This alias will import all modules in the `$env:OneDrive/PSModules dir
"@
#>
set-alias gj Get-Job
Set-Alias -Name f8 -Value flake8 -Description "flake8 is a python checker/linter"

# Set default conda env
conda activate pyscriptenv
$ubuntu_home = "Microsoft.PowerShell.Core\FileSystem::\\wsl$\Ubuntu-20.04\home\carlc"
$env:VCPKG_DISABLE_METRICS = $true
$env:RUBY_BIN = "C:\Ruby31-x64\bin"
