# scripts-pwsh

This git repo contains my personal collection of **Powershell** shell scripts.

It also includes `.bat` files which are similar.

## Directories

- `.\old`: old stuff
- `.\config`: config files for `pwsh`, **Windows Terminal**, and other config related to **Powershell**.
- `.\pwsh_help`: random powershell help files (ignored by git).
- `.\tests`: test folder for testing output (ignored by git).
- `.\bin`: Small startup scripts are located here, including a pwsh -noprofile startup script.
- `.\learning`: Scripts that are strictly for my learning purposes.
- `.\docs`: New documentation will be located in the wiki portion of the repo.  URL [here]("https://github.com/awsomesawce/scripts-pwsh/wiki")
- `.\ScriptsAndFunctions`: Useful scripts for maintenance and convenience.  This is the default location of future scripts.

The `gotosleep.bat` file had been created and linked to a custom task using `taskscheduler` on windows.  
INFO: **DO NOT MOVE**

## Other Files

- [Powershell snippets](D:/Carl/OneDrive/snippets/pwsh/powershell_snippets.txt): location for all snippet related things that are not necessarily
  important enough to be version-controlled.
- [TODO.md](./TODO.md): todo items relative to powershell programming.
- `.\Scripts\create-psconfigarchive.ps1`: Contains a function that uses the `Compress-Archive` cmdlet to create a zip file containing the contents of the `.\config` dir.  There are no args needed, and it automatically dates the new file.

## List of Directories to copy new config scripts to

- `~/gitstuff/scripts-pwsh`
- `D:/Carl/OneDrive/dotfiles_backup/windows`
- `D:\Carl\Documents\Powershell`

For more information, you can head over to the [wiki](https://github.com/awsomesawce/scripts-pwsh/wiki).
