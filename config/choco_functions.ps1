#!/usr/bin/env -S pwsh -nop

function chocosearch {
    if ($args) {
        if (Get-Command -Name choco -CommandType Application -ErrorAction Ignore) {
            choco search "$args"
        } else {
            write-error "choco binary not found in your path"
        }
    } else { write-error "Must provide an argument to this function" }
}
function scoopinfo {

    $Function:usage = "Usage: sinfo `"program_to_lookup`""
    if ($args) {
        if (Get-Command scoop -ErrorAction Ignore) {
        scoop info "$args"
        } else {
            Write-Error "Scoop executable not found in PATH"
            Write-Error -Message "$usage"
            return
        }
    } else {
        "Usage: need argument"
    }
}

function chocoinfo {
    <#
    .Description
    Chocolatey info function
    #>
    [cmdletbinding()]
    Param(
    [Parameter(Mandatory = $false)]
    [string]
    $Pattern,
    [switch]
    $PageOutput
    )

    $Pager = (Get-Command less -ErrorAction Ignore) ? ("less") : ("more.com")

    if ($Pattern) {
	($PageOutput) ? `
	(choco info $Pattern | & $pager) : `
	(choco info $Pattern)
    } else {
	Write-Error "Need a pattern to get info for"
    }
}


function iterate-cinfo {
<#
.Description
Set $pkgarr to an array of patterns you want to look up with choco info
.NOTES
Designed to be used with choco_functions.ps1
.TODO
Create option for picking filepath for Tee-Object
#>

if ($pkgarr) {
    foreach ($pkg in $pkgarr) {
        cinfo -Pattern $pkg | Tee-Object -FilePath "cinfo_test.txt" -Append -Verbose
    }
}
else { throw "Need `$pkgarr set with values to look up in cinfo" }

}
