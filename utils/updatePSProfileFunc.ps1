#!/usr/bin/env -S pwsh -nop

function updatePSProfile {
    <#
    .Description
    A crude way of updating the powershell profile
    .NOTES
    I want to add a switch for adding to git index
    #>
    param([switch]$Git, [string]$CommitMessage, [switch]$GitPush, [switch]$OneDriveSwitch)
    $Pname = "./Microsoft.Powershell_profile.ps1"
    $scriptspwsh = "~/gitstuff/scripts-pwsh/config"
    $dfbackup = "$env:OneDrive\dotfiles_backup\windows\"
    if ($CommitMessage) {
        if ($GitPush) {
            Write-Output "Updating pwsh profile in scripts-pwsh git repo"
	    # Use these ternary operations instead of "(expression && expression)" because it
	    # does not work the same as in Bash
            (Test-Path $scriptspwsh) ? (cd $scriptspwsh) : (throw "`$scriptspwsh not exist")
            if ($PWD -eq $scriptspwsh) {
		copy-item $PROFILE $scriptspwsh && git add . && git commit -m "$CommitMessage" && git pull && git push
	    } else {
		throw "You are in the wrong directory for this operation"
	    }
        }
        else {
            "Updating pwsh profile in scripts-pwsh git repo, but not pushing."
            Test-Path $scriptspwsh && cd $scriptspwsh
            Copy-Item $PROFILE . && git add . && git commit -m "$CommitMessage"
        }
    }
    else {
        Write-Verbose "Updating pwsh profile in scripts-pwsh git repo, but no commit message"
        Test-Path $scriptspwsh && cd $scriptspwsh
        Copy-Item $PROFILE . && git add "$Pname" && git commit
    }
    if ($OneDriveSwitch) {
        Write-Verbose "Copy profile to onedrive too"
        Copy-Item $PROFILE -Destination "$dfbackup" -Confirm
    }
    else { return "You did not pick the onedrive switch" }
}
