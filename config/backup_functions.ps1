# Backup functions for Powershell
# Author: Carl C. (awsomesawce at outlook dot com)

# This function will back up the .emacs file to both my dotfiles
# TODO: turn this into an array
function backup_dotemacs {
if (test-path C:\Users\Carl\.emacs) {
echo "Copying ~/.emacs to backup folders"
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
