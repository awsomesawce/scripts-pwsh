#!/usr/bin/env -S pwsh -noprofile
# OriginalLocation: $OneDrive/Notable/notes/npm_append_path.ps1
# Append NPM global prefix location to PATH so the globally installed npm scripts
#+can be accessible from the command-line!
# NOTE: Not sure why npm global prefix is _not_ part of PATH _already_... it used to be.

<#
.Description
Adjusts/appends PATH so that globally installed npm packages are accessible from
the command line.
.NOTES
Copied from Notable/notes/npm_append_path.ps1
#>

if ($env:PATH.Contains('npm')) {
    Write-Host -ForegroundColor Cyan "Success! ``npm`` global prefix is already in path!"
}
else {
    Write-Host -ForegroundColor Yellow "$(npm prefix -g) is not in `$env:PATH.  Attempting to append path"
    $env:PATH = "$(npm prefix -g);$env:PATH"
    ($env:PATH.Contains('npm')) ? (Write-Host -ForegroundColor Cyan "Success!  Appended path with npm global prefix") : (Write-Error -Category InvalidOperation -Message "Unsuccessful attempt at appending PATH with npm global prefix.")
}
