# Carl's New Powershell Profile
# Date: 9/22/2021

# Set env vars
$env:PAGER = (get-command 'less' -erroraction ignore) ? ('less') : ('more')
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1
$newconfig = "C:\Users\Carl\OneDrive\dotfiles_backup\config-new" # Path to OneDrive backup for new-config
# Set npm -g bin to beginning of path.
$env:Path = "C:\Users\Carl\AppData\Roaming\npm;C:\Users\Carl\gitstuff\scripts-pwsh\bin\;$env:Path"
$scrps = (Get-Item "~\gitstuff\scripts-pwsh").FullName

if (get-command start-condaenv -ErrorAction Ignore) {
    start-condaenv
} else {
    Write-Warning "start-condaenv not on path."
}

import-module posh-git
# Begin-Module has beginning functions for new setup
import-module "$scrps\config-new\Begin-Module.psm1"
$utilFuncs = "$env:OneDrive\snippets\pwsh\utilFuncs\UtilFuncs.psd1"
import-module "$utilFuncs"



$loadgitconfig = $False

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
$OLD_PATH = $env:path
$env:path = "$codebin;$env:path"

# Use command from Begin-Module
setNpmToBeginning
# End of File: vim sw=4;
