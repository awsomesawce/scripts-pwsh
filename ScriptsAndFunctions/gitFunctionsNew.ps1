#/usr/bin/env -S pwsh -nop
# A combination of git functions and aliases
# Date: 20210718
function gitadd {
<#
.Description
Small git add function
#>

param(
    [string]
    $File
)
begin {
    if (!(Get-Command git -ErrorAction SilentlyContinue)) {
        throw "git executable not found"
    }
}
process {
    if ($File) {
        git add "$File"
    }
    else {
        git add .
    }
}

}
