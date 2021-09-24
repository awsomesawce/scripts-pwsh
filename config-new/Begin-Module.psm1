#!/usr/bin/env pwsh
# Beginner Functions Module
# Starting module for new powershell setup
# Author: Carl Capodice

$_AUTHOR = "Carl Capodice"
function duks {

    <#
    .Description
    duks -Search "search string"
    Searches duckduckgo for string
#>
    param([string]$Search)
    if ($Search) {
	Start-Process "https://duckduckgo.com/$Search"
    }
    else {
	Write-Error "need search string"
    }

}
function get-commandlocation {
    <#
    .Description
    An updated which command
    #>

    param([string]$Name)
    if ($Name) {
        if ([string]::IsNullOrWhiteSpace((Get-Command $name).Source)) {
            return (Get-Command $Name)
        }
        return (Get-Command $Name).Source
    }
    else { Write-Error "need name arg" }

}
set-alias which -Value get-commandlocation -Description "Standard which program"
# TODO: Eject these functions into a module file

function gitst {
    <#
    .Description
    Standard git status wrapper
    #>
    if (get-command git -erroraction ignore) {
        return git status
    } else {
        return write-error "Git not installed"
    }
}

write-output "Loaded Begin-Module.psm1" # FIXME: this does not show up