# Scripts and Functions

07/03/2021 19:52:41

- Added `windowsDotfilesBackup` function, which simply changes directory to windows dotfiles backup folder in 
$env:OneDrive.

- Added `viewTODOsandIncomplete` function which is a simple wrapper around different grep-like programs.
If none of the other grep-like programs are installed in PATH (rg or ack), it defaults to using 
`Select-String` to search for those keywords.

