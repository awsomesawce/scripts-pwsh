Set-StrictMode -Version 2.0
Import-Module "./7zBase.psm1"

Get-Scoop7zCommand

function Get-ScoopCommand {
    <#
    .Description
    Super simple wrapper and abstraction over scoop
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
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
    } else {
        Write-Warning "No Command Name specified."
        return (scoop which scoop)
    }
}

Get-ScoopCommand # Only works when the function definition is part of the same file.

#regionbegin
<#
$VerbosePreference = 'Continue'
write-verbose @"
scoop which command is:
$(Get-ScoopCommand -CommandName git)
"@
$VerbosePreference = 'SilentlyContinue'
#>
#regionend