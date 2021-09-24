# Carl's New Powershell Profile
# Date: 9/22/2021

# Set env vars
$env:PAGER = (get-command 'less' -erroraction ignore) ? ('less') : ('more')
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1
$newconfig = "C:\Users\Carl\OneDrive\dotfiles_backup\new-config\"
$env:Path = "C:\Users\Carl\gitstuff\scripts-pwsh\bin\;$env:Path"
$scrps = (Get-Item "~\gitstuff\scripts-pwsh")


$loadgitconfig = $False

if ($loadgitconfig) {
    if (test-path $scrps) {
	    . $scrps/config/Microsoft.Powershell_profile.ps1
    } else {
	    write-error "Cannot find profile"
    }
} else {
	write-host -fore red "`$loadgitconfig = `$False"
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

