#!/usr/bin/env -S pwsh -nop
<#
.Description
CD to a directory, create file, and write the date into the
file!
#>
function writeIntoFile {
<#
.Description
This function is inside a module for easier keeping track
#>
[cmdletbinding()]
param(
[string]$Path
)

    if ($Path) {
	if (test-path $(split-path $Path)) {
	    set-location $(split-path $Path)
	    set-content -Value $(Get-Date) -Path $Path -Encoding 'utf8'
	if (test-path $Path) {
	    Write-Host -Fore Yellow "It worked!  File $Path is ready to be edited!"
	} else {
	    write-error "it did not work"
	}
	} else {
	    Write-Error "Path did not exist"
	}
    }
}
