# Experiment to make copying my pwsh profile file to git tracked directory
# a breeze!
# Carl C.

if (Test-Path .\Microsoft_PowershellProfile.ps1) {
    Write-Output "The profile has been found!"
} else {
    Write-Output "File hasn't been found in current directory."
}
