# Debug Module

Set-StrictMode -Version 2.0
$DebugPreference = 'SilentlyContinue'
$VerbosePreference = 'SilentlyContinue'

function Test-Debug {
    <#
    .Description
    Test which setting DebugPreference variable is set to.
    #>
    [CmdletBinding()]
    param()
    Write-Debug ('$DebugPreference is ' + $DebugPreference)
    Write-Host ('$DebugPreference is ' + $DebugPreference)
    if ($DebugPreference -eq "Continue") {
        Write-Host -ForegroundColor "Yellow" "`$DebugPreference is correctly set as $DebugPreference"
    }
}

function Write-Cyan {
    <#
    .Description
    Simple Cyan-only wrapper to Write-Host
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, HelpMessage = "Message to send", ValueFromPipeline = $true)]
        [string]
        $Message
    )
    if ($Message) {
        Write-Host -ForegroundColor Cyan $Message
    } else {
        Write-Host -ForegroundColor Cyan "no message"
    }
}

function main() {
    $local:DebugPreference = 'Continue'
    $local:VerbosePreference = 'Continue'
    $local:msgOne = @"
    This is the message
    Verbose pref is $VerbosePreference
    Debug pref is $DebugPreference
"@
    Write-Verbose $msgOne
    Write-Cyan -Message "Write-Cyan works inside here!"
}

main

Write-Output ("Verbose preference is " + $VerbosePreference)
Write-Cyan ("Debug pref is " + $DebugPreference)
