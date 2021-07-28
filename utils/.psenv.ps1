#!/usr/bin/env -S pwsh -noprofile
# PSenv file for Nodejs projects

# Functions relating to npm dev workflow

function Page-Readme {
<#
.Syntax
Page-Readme [npm-package-name]
.Description
Opens readme of any npm-installed package in node_modules folder, as long
as it is "README.md"
.NOTES
Works like a pydoc for local nodejs projects
Can be rewritten as a `foreach` loop.
#>
param([string[]]$dir)
$x = if (test-path "./node_modules/$dir/README.md") {$(Get-Item "./node_modules/$dir/README.md").FullName}
    else {Write-Error "Could not find README.md"}

if ($dir) {
    if (Test-Path $x) {
        if (Get-Command bat -ErrorAction ignore) {
	    # If bat pager is found use that, else use less.
	    bat "$x"
	} elseif (Get-Command less -ErrorAction ignore) {
	    less "$x"
	} else {
	    Write-Host -ForegroundColor Yellow "Compatible pager program not found on PATH.  Using Powershell pager."
	    Get-Content "$x" | out-host -Paging
	}
    }
    else {
        Write-Error "$x not found"
    }
}
else {
    Write-Error "Page-Readme needs an argument for it to page readmes.  Try again :)"
}
}
$pkgjson = if (Get-ChildItem .psenv.ps1 -ErrorAction SilentlyContinue) {
	    Get-Content package.json | convertfrom-json -AsHashtable
}
Write-Host -ForegroundColor "Cyan" "package.json info available in the variable `$pkgjson"
Write-Output "Loaded psenv.ps1 file from $($MyInvocation)"
