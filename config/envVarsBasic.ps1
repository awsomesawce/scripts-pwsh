#!/usr/bin/pwsh -noprofile
# This is a simple bit of tests for environment variables and 
# whether they're set or not.

if (Get-Command "$env:PAGER") {
  Write-Output "PAGER already set to $env:PAGER" 
  } else {
    $env:PAGER = "less"
    echo "`$env:PAGER has been set to $env:PAGER"
  }

$env:PAGER = "less"
$env:EDITOR = "nvim"
$local:listVars = Write-Output @"
# This is a here-doc with information about currently set
# environment variables.`n
# Some interesting env vars`n
`t`$env:PAGER = $env:PAGER
`t`$env:EDITOR = $env:EDITOR
"@

if (test-path Env:\CYGBIN) {
    Write-Output "`$env:CYGBIN has already been set to $env:CYGBIN"
} else {
    # This can be written as $env:CYGBIN = "D:\Cygwin\bin"
    set-item Env:\CYGBIN -Value "D:\Cygwin\bin"
    write-output "Env:\CYGBIN has been set to $env:CYGBIN."
}

$Script:CYGBIN = "D:\Cygwin\bin"
set-alias -Name cygbash -Value "$env:CYGBIN\bash.exe" -Description "Easy access to the bash executable for Cygwin"
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
};
Write-Output "`$importantHash is " + $importantHash
# I know there is a much better way to do this by using a for loop
# or something of that nature
