# Backup functions for Powershell
# Author: Carl C. (awsomesawce at outlook dot com)

### CHANGELOG ###
# 10/12/2021: Reopened for editing in VSCode.
# This function will back up the .emacs file to both my dotfiles
# TODO: turn this into an array
function backup_dotemacs {
    if (test-path C:\Users\Carl\.emacs) {
	Write-Output "Copying ~/.emacs to backup folders"
	Copy-Item C:\Users\Carl\.emacs -Destination "$($myDotfilesGit.toString())\windows" -Confirm
	Copy-Item ~/.emacs -Destination "$oneDrive\dotfiles_backup\windows" -Confirm
    } else {
	write-error "~/.emacs is not there"
    }
}
# This function successfully copies all files from the nvim config directory to my
# backup directories.  If the path is not there or the current location is not
# inside the nvim config dir then it will write an error saying to go to the location.
# Can be cleaner
function backup-nvimconfig {
    if ((test-path "$env:LOCALAPPDATA\nvim") -and ((Get-Location).ToString() -eq "$env:LOCALAPPDATA\nvim")) {
	write-verbose "Copying nvim files to `$DOTFILESGIT repo and onedrive dotfiles_backup directory"
	copy-item .\* "C:\Users\Carl\gitstuff\my-dotfiles\windows\nvim\" -Confirm
	copy-item .\* -Destination "$env:OneDrive\dotfiles_backup\windows\nvim\" -Confirm
    } else {
	Write-Error "Either the nvim directory is not there or you are not in the correct location.
	Go to the nvim config directory and try again."
    }
}

function Backup-NotableNotes {
    <#
    .Description
    cds to notes parent, 7z's entire .\notes\ folder.
    .Notes
    Uses 7z because it offers better compression level than zip and tar.xz.
    It is even better than zstd.
#>
    param(
    [Parameter(Mandatory = $false)]
    [switch]$Use7Z,
    [Parameter(Mandatory = $false)]
    [switch]$UseTarGZ
    )
    Process {
	$NotesDir = "$env:OneDrive/Notable/notes"
	$NameOfFile = "NotableNotes-$(Get-Date -Format FileDate).tar.gz"

	if ($UseTarGZ) {
	    if (Get-Command tar.ps1 -erroraction ignore) {
		if (Test-Path $NotesDir) {set-location (Split-Path -Parent $NotesDir)}
		tar.ps1 -acvf $NameOfFile "$NotesDir/*"
	    } else {
		throw "Tar.ps1 is not there."
	    }
	} elseif ($Use7Z) {
	   if (Get-Command 7z -ErrorAction Ignore) {
	       cd (Split-Path -parent $NotesDir)
	       7z a $NameOfFile ".\notes\*"
	   } else {
	       Write-Error -Category NotInstalled "Not installed"
	   }
	} else {
	    throw "Need to pick a switch"
	}
    }
}
function Backup-NotableTar {
    <#
    .Description
    This is a tar.
    #>
if ((Get-Command tar.ps1 -ErrorAction Ignore) -and (Test-Path $notesdir)) {
    Write-Output "Has tar and notable notes", "executing tar backup"
    Set-Location "$env:OneDrive/Notable"
    tar.ps1 -acvf "Notable-$(Get-Date -Format FileDate).tar.xz" notes/*
}
else {
    Write-Error "Something went wrong.  Check the function"
}

}
