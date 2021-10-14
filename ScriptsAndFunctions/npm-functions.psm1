#!/usr/bin/env -S pwsh -nop
# Functions relating to npm for Powershell
# OriginalLocation: ~/gitstuff/scripts-pwsh/ScriptsAndFunctions/npm-functions.psm1
# Related files: ../utils/npm_append_path.ps1

function whichPager {
    <#
    .Description
    Find which pager is installed on the system.
    #>
    param([string]$AltPager)
    if ($AltPager) {
	$PAGER = $AltPager
    } else {
	if ($env:PAGER) {
	    $PAGER = $env:PAGER
	} elseif (get-command "less" -ErrorAction ignore) {
	    $PAGER = "less"
	} else {
	    if ($OS -eq "Windows_NT") {
		$PAGER = "more"
	    }
	}
    }
    return $PAGER.ToString()
}

$PAGER = whichPager -AltPager "bat"

function rdme {
<#
.Description
Open readme of any npm-installed package in node_modules folder.
.NOTES
No notes.
#>
param([string[]]$dir)
$x = "./node_modules/$dir/README.md"
if ($dir) {
    if (Test-Path $x) {
        bat $x
    }
    else {
        Write-Output "$x not found"
    }
}
else {
    Write-Output "No arg"
}

}

function ninfo {
    <#
    .Synopsis
    Show info about multiple npm packages at once
    #>
param([string[]]$arr)
if ($arr) {
    foreach ($p in $arr) {
        npm info $p
    }
}
else {
    return Write-Error "need args"
}
}

function checkNPMPath {
<#
    .Description
    Adjusts PATH so that $env:APPDATA\npm is first in line.
    .NOTES
    Copied from Notable/notes/npm_append_path.ps1
    Also in ../ScriptsAndFunctions/npm_append_path.ps1
    TODO: Make cross platform code
#>

    if ($env:Path.Split(';')[0].contains('npm')) {
        Write-Host -ForegroundColor Cyan "Success! ``npm`` global prefix is first in path!"
    }
    else {
        Write-Host -ForegroundColor Yellow "$env:APPDATA\npm is not first in `$env:PATH.  Attempting to append path"
        $env:PATH = "$env:APPDATA\npm;$env:PATH"
        ($env:Path.Split(';')[0].contains('npm')) ? (Write-Host -ForegroundColor Cyan "Success!  Appended path with npm global prefix") : (Write-Error -Category InvalidOperation -Message "Unsuccessful attempt at appending PATH with npm global prefix.")
    }
}
