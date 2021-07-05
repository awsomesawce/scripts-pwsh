#!/usr/bin/env -S pwsh -nop
# Standalone pyhelp script -- very simple.

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
    if (Get-Command python3 -ErrorAction ignore) {
        Write-Output 'continuing'
    }
    else { throw 'python3 not found' }
}
process {
    if ($SearchTerm) {
        python -c "import $SearchTerm; help($SearchTerm)"
        return
    }
    else {
        Write-Output "No arg detected.  Try pydoc or python -m pydoc"
    }
}
