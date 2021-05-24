# Author: Carl Capodice
# Date: Monday, May 24, 2021 11:57:18 AM
# Description: "Useful Nav Functions"
# OriginalLocation: scripts-pwsh/Scripts/useful-nav-functions.ps1
# TODO: This document is INPROGRESS

# This func goes to the parent dir of the argument
function goto-parentdir {
    param([string]$File)
    if ($File) {
	set-location (Split-Path -Parent "$args")
    } elseif ($args) {
	Write-Error "This function needs arguments"
    } else {
	Write-Error "Enter the file to cd into its parent dir."
    }
}
