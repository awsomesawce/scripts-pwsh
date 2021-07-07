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
    if ($args) {
        if (Get-Command scoop -ErrorAction Ignore) {
        scoop info "$args"
        } else {
            Write-Error "Scoop executable not found in PATH"
        }
    } else {
        "Usage: need argument"
    }
}

function chocoinfo {
    <#
    .Description
    Chocolatey info function
    .NOTES
    This is a purely experimental function.
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


#function iterate-clist {
#<#
#.Description
#Set $pkgarr to an array of patterns you want to look up with choco info
#.NOTES
#Designed to be used with choco_functions.ps1
#.TODO
#Create option for picking filepath for Tee-Object
##>
#param([string[]]$pkgarr)
#if ($pkgarr) {
#    foreach ($pkg in $pkgarr) {
#        clist $pkg | Tee-Object -FilePath "~/dumps/txtfiles/cinfo_test.txt" -Append -Verbose
#    }
#}
#else { throw "Need `$pkgarr set with values to look up in cinfo" }
#
#}

function cinfo {
<#
.Description
cinfo takes an array of pkg names and shows info about them
.NOTES
If it only detects one arg, it will act accordingly.
#>
param([string[]]$Pkg)
begin {
    if (Get-Command -Name choco -CommandType Application -ErrorAction Ignore) {
        Write-Output "Looking up $Pkg"
    }
    else {
        throw "choco not found!"
    }
}
process {
    if ($Pkg) {
        if ($Pkg.Count -gt 1) {
            Write-Output "More than one pkg"
            foreach ($p in $Pkg) {
                choco info $p
            }
        }
        else {
            Write-Output "Just one package"
            choco info $Pkg
        }
    }
    else {
        Write-Error "need package names"
        throw
    }
}

}
