#!/usr/bin/env -S pwsh -nop
# Standalone pyhelp script -- very simple. Emulates pydoc
# This is a complete copy of .\pyhelpstdalone.ps1 to work with python3.9
# Author: Carl C. (awsomesawce at outlook dot com)
# OriginalLocation: .\ScriptsAndFunctions\stdaloneScripts\pyhelp3.9.ps1
# URL: https://github.com/awsomesawce/scripts-pwsh/ScriptsAndFunctions/stdaloneScripts/pyhelp3.9.ps1

<#
.Description
Standalone pyhelp script.  Emulates python -m pydoc
.NOTES
I will start writing scripts and alias to them rather than
keeping a bunch of functions in memory for _every_ pwsh instance.
.PARAMETER SearchTerm
Search term to lookup.
#>


param(
    [string]
    $SearchTerm
)
begin {
# Detect if python3 is installed.
# For windows (and most linux distros) that can be changed to `python` since
#+python 2 is depreciated.
    if (Get-Command "python3.9.exe" -ErrorAction ignore) {
        Write-Output 'continuing'
    }
    else { throw 'python3.9 not found' }
}
process {
    if ($SearchTerm) {
        python3.9.exe -c "import $SearchTerm; help($SearchTerm)"
        return
    }
    else {
        Write-Output "No arg detected.  Try pydoc or python -m pydoc"
    }
}
