# Scripts and Functions

## Wednesday, July 28, 2021 12:43:57 AM

- Added a few directories.
  - Added `../utils/`, `../basicConfig/`, `../wrapperFuncs`, to organize files into better categories.
  - Also in `../ScriptsAndFunctions/ghrestapi` houses a module (of sorts) for working with github rest api and
    converting it to powershell objects (like hashtables)

- Added `../ScriptsAndFunctions/stdaloneScripts` to house most stand-alone scripts (as opposed to pssession functions).
  > `../utils/` will house most utility scripts and functions.

- Moved some scripts from `../config` to `../ScriptsAndFunctions` or a more fitting location.

## 07/03/2021 19:52:41

- Added `windowsDotfilesBackup` function, which simply changes directory to windows dotfiles backup folder in 
$env:OneDrive.

- Added `viewTODOsandIncomplete` function which is a simple wrapper around different grep-like programs.
If none of the other grep-like programs are installed in PATH (rg or ack), it defaults to using 
`Select-String` to search for those keywords.

