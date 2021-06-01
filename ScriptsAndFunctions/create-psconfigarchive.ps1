#!/usr/bin/env pwsh
# Creates Zip archive containing contents of $scriptspwsh
# It works!
# TODO: Set an alias to this function from inside other_functions.ps1:
# Set-Alias -Name psconfArchive -Value "$scrps\Scripts\create-psconfigarchive.ps1"

function create-PSConfigArchive {
    $pwshConfigBackupDir = "$($dotfileDirs[0])windows\destination"
    $compParams = @{
	Path="$scriptspwsh"
	DestinationPath="$pwshConfigBackupDir\pwshConfig_$(Get-Date -Format FileDate).zip"
	Confirm=$true
    }
    if (Test-Path "$scriptspwsh") {
	Write-Host -foregroundcolor yellow "Compressing scripts-pwsh/config/* into a zip file $($compParams.DestinationPath)."
        Compress-archive @compParams
        } else {
        Write-Error "Something went wrong.  Check the function"
    }
}
Write-Output "Executing create-PSConfigArchive function"
create-PSConfigArchive
Write-Output "Function execute end"
