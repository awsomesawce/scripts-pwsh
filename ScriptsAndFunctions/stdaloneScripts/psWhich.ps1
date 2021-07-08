#!/usr/bin/env -S pwsh -noprofile
# Taken from $env:OneDrive\snippets\pwsh\barebones\barebones_Functions.ps1
# OriginalLocation $env:OneDrive\snippets\pwsh\barebones\psWhich.ps1
# Copied to https://github.com/awsomesawce/scripts-pwsh/ScriptsAndFunctions/stdaloneScripts/psWhich.ps1

<#
.Description
Acts just like the which command from unix.
Might need it's own script file and set an alias to it.
.NOTES
Outputs just the string of the location of the command,
not a PSObject.
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory=$False, HelpMessage="Command name.")]
    [string]
    $Command
)
function writeyellow ([string]$msg) {
    if ($msg) {
        Write-Host -ForegroundColor Yellow "$msg"
    }
}
function die {
    param([string]$msg)
    if ($msg) {
        Write-Error "$msg"
    }
}
if ($Command) {
    # Get-Command already tests whether the command is available.
    # TODO: create test for whether command is an application or function.
    (Get-Command $Command).Source
} else {
    writeyellow -msg "$($MyInvocation.MyCommand.Name): needs arg to `$Command param."
    #die -msg "No args"
}
