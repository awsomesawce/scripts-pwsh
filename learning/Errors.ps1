#!/usr/bin/env -S pwsh -nop

$Script:NotImplementedException = [System.Exception]::new("NotImplemented")


function Get-DirectoriesThenFiles ([string]$Path, [switch]$Recurse) {
    if ($Recurse) {
    $err = Write-Error -Message "`$Recurse: Not impl" -Exception $Script:NotImplementedException -Category NotImplemented
    throw $NotImplementedException
    }
    $Local:MyDir = Get-Item $Path
    $Local:Files = $Local:MyDir.GetFiles()
    $Local:Dirs = $MyDir.GetDirectories()
    return $Files, $Dirs
}

function TestFunc {
    return Get-DirectoriesThenFiles -Path . -Recurse
}

write-output $(TestFunc)