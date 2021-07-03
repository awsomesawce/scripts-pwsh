# Author: Carl Capodice
# Date: Monday, May 24, 2021 11:57:18 AM
# Description: "Useful Nav Functions"
# OriginalLocation: scripts-pwsh/Scripts/useful-nav-functions.ps1
# TODO: This document is INPROGRESS

# This func goes to the parent dir of the argument
function goto-parentdir {
    <#
    .Description
    goto-parentdir simply goes to the parent directory of the file.
    .NOTES
    This function is duplicated in other_functions as cdfile.
    #>
    param([string]$File)
    if ($File) {
	set-location (Split-Path -Parent "$args")
    } elseif ($args) {
	Write-Error "This function needs arguments"
    } else {
	Write-Error "Enter the file to cd into its parent dir."
    }
}

function windowsDotfilesBackup {
<#
.Description
Easy Navigation to windows dotfiles backup folder
#>
$x = "D:\Carl\OneDrive\dotfiles_backup\windows\"
if (Test-Path $x) {
    cd $x
}
else {
    Write-Error "$x not found by test-path"
}
}
