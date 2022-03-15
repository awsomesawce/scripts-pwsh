#!/usr/bin/env pwsh
# Beginner Functions Module
# Starting module for new powershell setup
# Author: Carl Capodice

$_AUTHOR = "Carl Capodice"

# TODO: Move this function to scoop_functions.ps*1

function Get-ScoopInfo {
    <#
    .DESCRIPTION
    Foreach loop for multiple scoop infos
    #>
    [CmdletBinding()]
    param(
    [Parameter(Mandatory)]
    [string[]]$Params
    )
    return ($Params | ForEach-Object {
        scoop info $_
    })
}
if (!(Get-Command sinfo -ErrorAction ignore)) {
    set-alias sinfo -Value "Get-ScoopInfo"
} else {
    Write-Warning "Command 'sinfo' exists, use 'Get-ScoopInfo' for scoop infos"
}

function Get-ChildItemNames {
<#
.DESCRIPTION
Get Child items names as list of strings
.NOTES
Located in `$scrps\bin\`
#>
    [cmdletbinding()]
    param(
	[Parameter(Mandatory = $false, HelpMessage = "helpmsg", ValueFromPipeline = $true)]
	[string]$Path,
	[Parameter(ParameterSetName = "set1")]
	[string]$Separator = " "
    )
    return Get-ChildItem $Path | Join-String -Property Name -Separator $Separator
}

function Get-ModuleFiles {
    <#
    .Description
    Simply gets all psm1 files in the directory
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $False,HelpMessage="Help Message",Position=0)]
        [string]$Path = "$env:OneDrive/PSModules"
    )
    if (!($Path)) {
        return get-childitem "*.psm1"
    } else {
        return Get-ChildItem "$Path/*.psm1"
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

# Source completion scripts
if ($scrps) {
    $script:completionScript = Get-Item "$scrps/config-new/completions.ps1"
    . "$completionScript"
}

if (!(Get-Command fzf -ErrorAction Ignore)) {
    Write-Host "fzf not on path" -ForegroundColor Red
}

