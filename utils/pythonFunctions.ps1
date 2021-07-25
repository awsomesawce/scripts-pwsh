#!/usr/bin/env -S powershell.exe -noprofile
# NOTE: Check .\stdaloneScripts\pyhelpstdalone.ps1 for the standalone-script version of pyhelp

function pyhelp {
<#
.Description
Open help articles directly from the Powershell terminal
.Notes
TODO: Write an equivalent bash script for this.
#>
param(
    [string]
    $HelpTerm
)
Process {
    if ($HelpTerm) {
        Write-Output "Opening $HelpTerm help article"
        py -c "help($HelpTerm)"
    }
    else {
        Write-Error "Need to provide `$HelpTerm"
    }
}

}
function pyhelp_two {

param(
    [string]
    $s
)
begin {
    if (Get-Command python3 -ErrorAction ignore) {
        Write-Output 'continuing'
    }
    else { throw 'python3 not found' }
}
process {
    if ($s) {
        python -c "import $s; help($s)"
        return
    }
    else {
        Write-Output "No arg detected.  Try pydoc or python -m pydoc"
    }
}

}

function getpythonlocations {
    <#
    .Description
    Return locations of all commands on path that start with "py"
    .PARAMETER strict
    Looks for only commands that start with "python", "pip", and "idle"
    .PARAMETER more
    Gets all commands that have the ".py" file extension"
    .NOTES
    There are ways to zero in on the specific commands
    #>
    param([switch]$strict, [switch]$more)
    if ($strict) {
	return Get-Command -All python*, pip*, idle*
    } elseif (!($strict) -and ($more)) {
	return Get-Command -All *.py # Gets all commands that have the ".py" file extension
    } else {
	return Get-Command -All py*
    }
}

