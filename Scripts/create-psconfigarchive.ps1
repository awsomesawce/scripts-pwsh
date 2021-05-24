#!/usr/bin/env pwsh
function create-PSConfigArchive {
    $pwshConfigBackupDir = "$($dotfileDirs[0])dest"
    $compParams = @{
	Path="$scriptspwsh"
	DestinationPath="$pwshConfBackupDir\pwshConfig_$(Get-Date -Format FileDate).zip"
	Confirm=$true
    }
    if (Test-Path $compParams.Path) {
	Write-Verbose "Compressing scripts-pwsh/config/* into a zip file $($compParams.DestinationPath)."
        Compress-archive @compParams
        } else {
        Write-Error "Something went wrong.  Check the function"
    }
}
#Write-Output "Executing create-PSConfigArchive function"
#create-PSConfigArchive
#Write-Output "Function execute end"
