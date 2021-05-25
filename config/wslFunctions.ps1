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
function wslUserLogin {
    # Check and make sure wsl is installed.
    if (Get-Command wsl -ErrorAction ignore) {
	wsl -u carlc 
    } else {
	Write-Error "wsl executable not found in Path."
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
