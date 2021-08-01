<#
.Description
script that will source the writecolors dependency into the current session
.NOTES
The Writecolors.ps1 file will be packaged into a module filled with
nice utility functions for the average script-worker.
I intend for it to be similar to chalk for nodejs.
#>
$scrps = "C:\Users\Carl\gitstuff\scripts-pwsh"
$writecolors = "$scrps\ScriptsAndFunctions\dependencies\WriteColors.ps1"
if (Test-Path $writecolors) {
    . $writecolors && echoYellow "Writecolors loaded"
    set-variable WCLoaded -Value $true -Description "Tells external scripts whether or not writecolors.ps1 is loaded" -Option AllScope
}
else {
    Write-Host -ForegroundColor DarkMagenta "Writecolors cannot be found"
}
