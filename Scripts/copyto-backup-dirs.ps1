#!/usr/bin/env pwsh
# Copy named file to backup directories
# TODO: finish this script.
# OriginalLocation: $env:OneDrive\dotfiles_backup\windows

$dirs = @("~/gitstuff/my-dotfiles", "$env:OneDrive\dotfiles_backup")

$dirsHash = @{
    dir1 = "~/gitstuff/my-dotfiles"
    dir2 = "$env:OneDrive\dotfiles_backup"
}

function cpMethodOne {
    <#
    .Description
    Copy a file to each directory
    .PARAMETER Files
    file(s) to copy
    .PARAMETER gitrepo
    Boolean whether or not to copy to the my-dotfiles git repo
    .PARAMETER onedrive_bkup
    Switch for whether or not to copy to onedrive's dotfiles_backup folder.
    #>
    [CmdletBinding()]

    Param(

    [Parameter(Mandatory=$true, Position=0,
    HelpMessage="File(s) to copy to backup dirs")]
    [SupportsWildcards()]
    [System.String[]]
    ${Files},

    [Switch]
    ${gitrepo},

    [Switch]
    ${onedrive_bkup}
    )

    Process {
        if ($gitrepo) {
            write-output "`$gitrepo selected"
        }
        if (${onedrive_bkup}) {
            Write-Output "`$onedrive_bkup selected"
        }
        if ($Files) {
            Write-Output "`$Files are $Files"
        }
    }

    End {
        echo "This is the end script block."
    }
}
