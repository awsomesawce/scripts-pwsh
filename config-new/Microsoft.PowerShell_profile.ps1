# Carl's New Powershell Profile
# Date: 9/22/2021

# Set env vars
$env:PAGER = (get-command 'less' -erroraction ignore) ? ('less') : ('more')
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1
$newconfig = "C:\Users\Carl\OneDrive\dotfiles_backup\config-new"
$env:Path = "C:\Users\Carl\gitstuff\scripts-pwsh\bin\;$env:Path"
$scrps = (Get-Item "~\gitstuff\scripts-pwsh")

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
