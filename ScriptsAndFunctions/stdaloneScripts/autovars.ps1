#!/usr/bin/env -S pwsh -noprofile
# testing automatic variables like PSScriptRoot

function writeYellow {
    <#
    .Description
    A simple wrapper for Write-Host for cyan coloring
    #>
    param (
        [string]
        $Message
    )
   if ($Message) {
      return Write-Host -ForegroundColor "Yellow" "$Message" 
   }
}

if (!($args)) {
    Write-Host -ForegroundColor Cyan @"
    Testing how automatic variables work in Powershell.
    This is `$PSScriptRoot: $PSScriptRoot
    This is `$PSCommandPath: $($PSCommandPath.GetType())
    This is `$PSCmdlet: $PSCmdlet
    This is `$MyInvocation: $MyInvocation
    > MyInvocation is probably the most complicated one.
    `$MyInvocation type: $($MyInvocation.GetType())
    `$MyInvocation.MyCommand.Description: $($MyInvocation.MyCommand.Description)
"@

$invocationList = @("BoundParameters", "CommandOrigin", "DisplayScriptPosition", "ExpectingInput", "HistoryId", "InvocationName", "Line",
"MyCommand", "OffsetInLine", "PipelineLength", "PipelinePosition", "PositionMessage", "PSCommandPath", "PSScriptRoot",
"ScriptLineNumber", "ScriptName", "UnboundArguments", "Equals", "GetHashCode", "GetType", "ToString")

writeYellow "$invocationList"

} else {Write-Error -Category "NotImplemented" -Message:"Do not use args for this test yet"
}

