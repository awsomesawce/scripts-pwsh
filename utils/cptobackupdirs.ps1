
<#PSScriptInfo

.VERSION 0.0.1

.GUID 8ceaebe6-407e-4c75-ba5d-ce5847cc4dbb

.AUTHOR Carl C

.COMPANYNAME None

.COPYRIGHT Carl Capodice

.TAGS copy, backup, simple

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES

.PRIVATEDATA
#>

<# 
.DESCRIPTION
 copy file to backup dirs

#>

[CmdletBinding()]
param([string]$FilePath)
$dirs = @("D:\Carl\OneDrive\dotfiles_backup\windows\", "C:\Users\Carl\gitstuff\my-dotfiles\windows\")
if ($FilePath) {
    foreach ($d in $dirs) {
        Write-Verbose "Copying $FilePath to $d"
        Copy-Item -Path $FilePath -Destination $d -Confirm
    }
    Write-Verbose "Done"
}
else {
    Write-Error "Need `$FilePath parameter"
}

