# FileInfo: "Update functions and scripts"
# OriginalLocation: scriptspwsh\ScriptsAndFunctions\updatePSProfileFunc.ps1

function updatePSProfile {
<#
.Description
A crude way of updating the powershell profile
#>
param([string]$CommitMessage, [switch]$GitPush, [switch]$OneDriveSwitch)
$scriptspwsh = "~/gitstuff/scripts-pwsh/config"
$dfbackup = "$env:OneDrive\dotfiles_backup\windows\"
if ($CommitMessage) {
if ($Push) {
Write-Output "Updating pwsh profile in scripts-pwsh git repo"
Test-Path $scriptspwsh && cd $scriptspwsh
cp $PROFILE . && git add . && git commit -m "$CommitMessage" && git pull && git push
} else {
"Updating pwsh profile in scripts-pwsh git repo, but not pushing."
Test-Path $scriptspwsh && cd $scriptspwsh
copy-item $PROFILE . && git add . && git commit -m "$CommitMessage"
}
} else {
Write-Verbose "Updating pwsh profile in scripts-pwsh git repo, but no commit message"
Test-Path $scriptspwsh && cd $scriptspwsh
Copy-Item $PROFILE . && git add . && git commit
}
if ($OneDriveSwitch) {
Write-Verbose "Copy profile to onedrive too"
Copy-Item $PROFILE -Destination "$dfbackup" -Confirm
} else {"You did not pick the onedrive switch"}
}
