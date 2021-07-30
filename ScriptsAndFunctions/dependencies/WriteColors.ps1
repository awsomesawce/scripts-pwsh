# WriteColors.ps1
# Contains functions that wrap around Write-Host to get colorized output
#
# :alternatives: Using nodejs's ansi-colors or chalk to colorize output.
# :NOTE: Write-Host is much easier to use as a dependency for pwsh scripts than nodejs chalk would be

function whc {
    <#
    .Description
    Base wrapper function around Write-Host.
    .EXAMPLE
    whc -color Yellow -msg "hello there"
    #>
    param([string]$color, [string]$msg)
    if ($color) {
	return Write-Host -ForegroundColor $color "$msg"
    }
}

function echoCyan {
    <#
    .Description
    Wrapper around write-host to output text in cyan
    #>
    return whc -color Cyan -msg "$args"
}

function echoYellow {
    <#
    .Description
    Wrapper around write-host to output text in Yellow
    #>
    return whc -color Yellow -msg "$args"
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
