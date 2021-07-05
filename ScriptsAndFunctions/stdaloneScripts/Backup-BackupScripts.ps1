
<#
.Description
The simplest function for copying files that start with Backup-*
#>
$backupscripts = ls -Path Backup-*
$dest = "$scrps\ScriptsAndFunctions"
if ((Test-Path $backupscripts -PathType Leaf) -and (Test-Path $dest -PathType Container)) {
    Copy-Item -Path $backupscripts -Destination $dest -Verbose
}
else { throw "test-path did not work" }

