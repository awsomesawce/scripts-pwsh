# Carl's New Powershell Profile
# Date: 9/22/2021


$env:PAGER = (get-command 'less' -erroraction ignore) ? ('less') : ('more')
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

param([string]$Name)
if ($Name) {
    if ([string]::IsNullOrWhiteSpace((Get-Command $name).Source)) {
        return (Get-Command $Name)
    }
    return (Get-Command $Name).Source
}
else { Write-Error "need name arg" }

}
# TODO: Eject these functions into a module file

function gitst {
    if (get-command git -erroraction ignore) {
        return git status
    } else {
        return write-error "Git not installed"
    }
}$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1
$newconfig = "C:\Users\Carl\OneDrive\dotfiles_backup\new-config\"
