#!/usr/bin/env pwsh

function create-PSConfigArchive {
        $compParams = @{
            Path="$scriptspwsh"
            DestinationPath="$pwshConfBackupDir\scriptspwshConfig$(Get-Date -Format FileDate).zip"
            Confirm=$true
        }
    if (Test-Path "$scriptspwsh") {
        Compress-archive @compParams
        } else {
        Write-Error "Something went wrong.  Check the function"
    }
}
Write-Output "Executing create-PSConfigArchive function"
create-PSConfigArchive
Write-Output "Function execute end"
