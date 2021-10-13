#!/usr/bin/env pwsh
Set-StrictMode 2.0
<#
.Description
7z base file operations module
#>

function Get-ScoopCommand {
    <#
    .Description
    Super simple wrapper and abstraction over scoop
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $CommandName
    )
    if (!(Get-Command scoop -ErrorAction 'continue')) {
        return Write-Warning "Scoop command not found"
    }
    if ($CommandName) {
        # Return output of scoop which
        $Local:output = (scoop which $CommandName)
        return $Local:output
    }
}

function get7zCommand {
    <#
    .Description
    Return a [psobject] containing 7z command info
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, HelpMessage = "Return 7z command info")]
        [Switch]
        $AsString
    )
    if (!(Get-Command 7z -ErrorAction "Ignore")) {
        throw "7z command not found on PATH"
    }

    if (!($AsString)) {
        return Get-Command 7z
    } else {
        $Local:CmdObject = (Get-Command 7z).Source
        return $Local:CmdObject
    }
}

function Get-Scoop7zCommand {
    [CmdletBinding()]
    param()

    $Local:result = (Get-Command scoop -ErrorAction "ignore") ? (scoop which 7z) : ($false)
    if (!($Local:result)) {
        Write-Error ("Scoop result is " + $Local:result)
    } else {
        return $Local:result
    }
}