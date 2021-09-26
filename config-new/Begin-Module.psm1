#!/usr/bin/env pwsh
# Beginner Functions Module
# Starting module for new powershell setup
# Author: Carl Capodice

$_AUTHOR = "Carl Capodice"

function Get-ModuleFiles {
    <#
    .Description
    Simply gets all psm1 files in the directory
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $False)]
        [string]
        $Path
    )
    if ($Path) {
        Get-ChildItem "$Path/*.psm1"
    } else {
        get-childitem "*.psm1"
    } 
}

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


function setNpmToBeginning {
    <#
    .Description
    Set npm to beginning of path if it is not
    #>
    param()
    if ($env:Path.Split(";")[0] -ne "*npm*") {
    $OLD_PATH = $env:PATH
    $env:PATH = "$(npm -g bin);$env:PATH"
    write-host -fore Cyan "Set npm to beginning of path"
    } else {
    Write-Host -fore Cyan "NPM is already at beginning of path"
    }
}
