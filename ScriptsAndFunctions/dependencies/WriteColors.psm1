# WriteColors.ps1
# Contains functions that wrap around Write-Host to get colorized output
#
# :alternatives: Using nodejs's ansi-colors or chalk to colorize output.
# :NOTE: Write-Host is much easier to use as a dependency for pwsh scripts than nodejs chalk would be
<#
.Description
WriteColors.psm1 - wrappers around Write-Host
.NOTES
This was predominantly a test on how to make easily importable modules for use
in homemade scripts and functions, including PROFILE
.Author Carl C.
#>


Set-Alias whc -Value Write-Host -Description "Shortening of Write-Host's command"

function echoCyan {
    <#
    .Description
    Wrapper around write-host to output text in cyan
    #>
    return whc -Foregroundcolor Cyan -msg "$args"
}

function echoYellow {
    <#
    .Description
    Wrapper around write-host to output text in Yellow
    #>
    return whc -foregroundcolor Yellow -msg "$args"
}

function echoRed {
    <#
    .Description
    Wrapper around write-host to output text in red
    #>
    return whc Red "$args"
}
function echoDarkCyan {
    <#
    .Description
    Wrapper around write-host to output text in darkcyan
    #>
    return whc DarkCyan "$args"
}
function echoDarkBlue {
    <#
    .Description
    Wrapper around write-host to output text in darkblue
    #>
    return whc Darkblue "$args"
}
function echoDarkYellow {
    <#
    .Description
    Wrapper around write-host to output text in darkyellow
    #>
    return whc DarkYellow "$args"
}
function echoMagenta {
    <#
    .Description
    Wrapper around write-host to output text in Magenta
    #>
    return whc Magenta "$args"
}
set-variable WCLoaded -value $true -description "Tells other scripts whether writecolors.ps1 is already loaded" -Option AllScope
