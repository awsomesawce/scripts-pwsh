using namespace System
using namespace System.Collections
using namespace System.IO

function Get-ImportantCommands {
    <#
    .Description
    Gets locations of important commands and returns a get-command object for
    each one inside a hashtable
    .Notes
    There seems to be a bug but I'm not sure what's causing it.
    It says wsl is being added to $hash twice, but I only have it once in the commands object.
    #>
    # Getting the basename of command can be done like this:
    # $name = (Get-item $(get-command vim).source).BaseName
    $hash = @{}
    $commands = @('git', 'rg', 'scoop', 'choco', 'vim', 'nvim', 'wsl', 'where', 'xz', 'tar', "cmd")
    $commands | ForEach-Object {
        if (Get-Command $_ -ErrorAction ignore) {
            $comObj = Get-Command $_
            # Get basename of command without file extension
            $name = if (Test-Path $comObj.Source) {
                (Get-Item $comObj.Source).BaseName
            } else {
                ($comObj)
            }
            $hash.add($name, $comObj)
        }
        else {
            Write-Warning "$_ command not found on path.  Key will be `"not found`""
            $hash.add($_, "not found")
        }
    }
    return $hash
}

function Get-ImportantModules {
    <#
    .SYNOPSIS
    Gets important modules
    #>
    param()
    $Local:moduleDirs = @(
        "$env:OneDrive/PSModules",
        "$env:USERPROFILE/gitstuff/scripts-pwsh",
        "$env:OneDrive/snippets/utilFunc"
    )
    foreach ($i in $Local:moduleDirs) {
        Write-Output $(get-item $i)
    }
    return $moduleDirs | Get-Member
}
