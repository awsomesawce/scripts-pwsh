function Backup-ScriptsFromLinuxs {
<#
.Description
A backup script with many conditionals and tests on the way down.
Entirely consists of ternary statements, no ifs.
.NOTES
This script will not work on versions lower than 6.0
#>

param(
    [Parameter(Mandatory = $false)]
    [String]
    $Path
)
Process {
    if (!($Path)) {
    (Test-Path "$env:USERPROFILE\bin") ? (Set-Location "$env:USERPROFILE\bin") : (Write-Error "Dir does not exist, exiting." && exit 1)
    ("$PWD" -eq "$env:USERPROFILE\bin") ? (`
        (Test-Path ".\scripts_from_linuxs\" -PathType Container) ? `
        (Compress-Archive -Path .\scripts_from_linuxs\ -DestinationPath ~/bin -Update -Verbose) : (Write-Error "scripts_from_linuxs is not a directory" && exit 2)) : `
    (Write-Error "In wrong directory" && exit 3)
    }
    if ($Path) { Write-Error -Category NotImplemented }
}
End {
    Write-Output "You have reached the end of the script, congratulations!"
}

}

