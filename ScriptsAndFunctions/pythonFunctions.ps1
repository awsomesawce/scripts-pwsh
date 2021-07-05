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
