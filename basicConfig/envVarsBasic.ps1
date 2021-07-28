#!/usr/bin/pwsh -noprofile
# This is a simple bit of tests for environment variables and 
# whether they're set or not.

if (Get-Command "$env:PAGER" -ErrorAction Ignore) {
  Write-Output "PAGER already set to $env:PAGER" 
  } else {
    $env:PAGER = "less"
    echo "`$env:PAGER has been set to $env:PAGER"
  }

#$env:PAGER = "less"
$env:EDITOR = "vim"
$local:listVars = Write-Output @"
# This is a here-doc with information about currently set
# environment variables.`n
# Some interesting env vars`n
`t`$env:PAGER = $env:PAGER
`t`$env:EDITOR = $env:EDITOR
`t`$env:USERPROFILE = $env:USERPROFILE
`t`$env:APPDATA = $env:APPDATA
"@
Write-Output $local:listVars

$listVarHash = @{
    title="List of important variables"
    description="This is an _escaped_ list of variables that are important to a standard Powershell configuration."
    comment="If a variable is empty or not set, the respective hash entry will be empty as well."
    PAGER="`$env:PAGER = $env:PAGER"
    EDITOR = "`$env:EDITOR = $env:EDITOR"
    # TODO: add more vars
  }


# Testing cygwin locations and env vars
if (test-path Env:\CYGBIN) {
    Write-Output "`$env:CYGBIN has already been set to $env:CYGBIN"
} else {
    # This can be written as $env:CYGBIN = "D:\Cygwin\bin"
    set-item Env:\CYGBIN -Value "D:\Cygwin\bin"
    write-output "Env:\CYGBIN has been set to $env:CYGBIN."
}

$Script:CYGBIN = "D:\Cygwin\bin"
set-alias -Name cygbash -Value "$env:CYGBIN\bash.exe" -Description "Easy access to the bash executable for Cygwin"

# Testing location to MSYS2 environment.
# Requires Powershell 6.2

function testMSYS {
    if (Test-Path "D:\MSYS2\usr\bin") {
	$msysLoc = "D:\MSYS2\usr\bin"
	$msysLocBase = "D:\MSYS2"
	$x = @"
	`$msysLoc = `"$msysLoc`"
	`$msysLocBase = `"$msysLocBase`"
"@ # End of here-document must have no whitespace at the end.
	Write-Output $x
    }
}
    

# Diffing new script and orig script.
$newEnvScript = (Get-Item -Path $scriptspwsh\envVarsBasic.ps1)
$origEnvScript = (Get-Item $oneDrive\snippets\pwsh\envVarsBasic.ps1)
$importantFiles = "$origEnvScript","$newEnvScript","$scriptspwsh"
$importantHash = @{
title = "Important Files"
oldScript = $origEnvScript
newScript = $newEnvScript
newDir = (Split-Path -Parent $newEnvScript)
diffThem = (Compare-Object -ReferenceObject $newEnvScript -DifferenceObject $origEnvScript)
hashStatus = "Experimental"
}
Write-Output "`$importantHash is " + $importantHash
# I know there is a much better way to do this by using a for loop
# or something of that nature
