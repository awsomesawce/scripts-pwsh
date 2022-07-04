$Script:scriptsPwsh = Get-Item (split-path -Parent $PSScriptRoot)
$Script:IsVSCode = ($host.Name -eq "Visual Studio Code Host") -or $PROFILE.Contains("VSCode")
$Script:ProfileObj = if (-not (test-path $PROFILE.CurrentUserCurrentHost)) {
    # If `$PROFILE` is not found, you probably don't use Powershell that often, and
    # you won't need this script anyway.
    throw "CurrentUserCurrentHost ``$PROFILE`` file not found.`nUse ``New-Item $PROFILE -ItemType File`` to create profile"
} else {
    get-item $PROFILE
}
$Script:ProfileGit = Get-Item $Script:scriptsPwsh/config-new/Microsoft.Powershell_profile.ps1

$Script:CONSTANTS = @{
    # If using powershell within VSCode, `$PROFILE` and $PROFILE.CurrentUserCurrentHost is a different value than normal.
    ProfileObj = $Script:IsVSCode ? $false : ""
    scriptsPwsh = $Script:scriptsPwsh
    ProfileGit = $Script:ProfileGit
    CurrentDir = $CurrentDir
}
