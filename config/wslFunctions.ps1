# WSL-related Functions
# Loaded from other_functions.ps1
# Author: Carl C.
# Date: Monday, May 24, 2021 11:41:39 AM

function aptcshow { 
    <#
    .DESCRIPTION
    A way to search the apt-cache database without being in the ubuntu shell.
    .Parameter Term
    The search term.
    .Notes
    Powershell functions are cool.
    #>
    param([string]$Term)
    if ($Term) {
	wsl apt-cache show "$Term"
    } else {
	Write-Host -ForegroundColor red "Need search term"
    }
}
function aptcsearch {
    param([string]$Term)
    if ($Term) {
	wsl -u carlc apt-cache search $Term 
    } else {
	Write-Error "Need search term"
    }
}
#
# TODO: Invoke a function that removes Nodejs' PATH entry before logging into UBUNTU.
#

function Change-WSLPATH {
    <#
    .Description
    Changes PATH specifically before logging into UBUNTU's shell
    .NOTES
    INPROGRESS: Add options for removing certain parts of PATH.
    #>

    if ($env:PATH.Contains('npm')) {
	$pathconf = $env:PATH.Replace('C:\Program Files\nodejs\;', '')
	$pathconfnew = $pathconf.Replace('D:\Carl\AppData\npm;', '')
    }
}

function wslUserLogin {
    <#
    .Description
    Log into wsl with optional args
    .NOTES
    Adding PATH changer to get rid of NODEJS entry before logging in.
    #>
    # Check and make sure wsl is installed.
    Begin {
	Change-WSLPATH
    }
    Process {
	if (Get-Command wsl -ErrorAction ignore) {
	    wsl -u carlc 
	} else {
	    Write-Error "wsl executable not found in Path."
	}
    }
    End {
	Write-Output "Done"
    }
}
set-alias wslu -Value wslUserLogin -Description "Shorter access to wsl -u carlc"

# Super-neat Manpager in traditional Verb-Noun format.
function Get-UbuntuManpage {

    Param([string]$SearchTerm)
    Begin {
	if (Get-Command wsl -ErrorAction Ignore) {
	    Write-Host -ForegroundColor Green -Object "WSL is installed."
	}
	else {
	    throw "WSL is not installed"
	}
    }
    Process {
	if ($SearchTerm) {
	    Write-Verbose "Looking up `$SearchTerm $SearchTerm"
	    wsl -u carlc man "$SearchTerm"
	}
	else {
	    Write-Error -Category InvalidArgument "Need search term to look up manpage"
	}
    }
    End {
	Write-Host -ForegroundColor Magenta "Operation succeeded"
    }

}

# Create alias because Get-UbuntuManpage is just too long
set-alias -Name uman -Value Get-UbuntuManpage -Description "Shorter manpaging for easier typing"

function aptitudeshow {
    <#
    .Description
    Use aptitude show from powershell
    #>
    param([string]$Term, [switch]$Page)
    if (Get-Command wsl -erroraction ignore) {
	if (($Term) -and ($Page)) {
	    "Showing $Term on 'aptitude' with $env:Pager"
	    wsl -u carlc aptitude show $Term | less -r
	} elseif ($Term) {
	    wsl -u carlc aptitude show $Term | less -r
	} else {
	    Write-Error "Need search term"
	}
    } else {
	Write-Error "Wsl command not found" -Category NotInstalled
    }
}

