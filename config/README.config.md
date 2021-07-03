# Pwsh Config

**NOTE**: Powershell allows for both `unix` and `windows` style filepaths.
I personally like using unix filepaths because the forward-slash key is easier to type than the backslash.

`.\config` is where I house most if not all my Powershell configuration, functions, aliases, and profiles.

## Important Files

- `./Microsoft.PowerShell_profile.ps1`: This is the main profile that **Powershell** reads when starting up.
  Be careful not to put too many things in your main profile, as it is sourced for _every_ invocation of **Powershell**.
  Even when using `pwsh -c "Some-Command"`, it will load the main profile and then exit.
  However, you can use `pwsh -noprofile` (or `pwsh -nop`) to tell pwsh to _not_ load a profile.

- `./Profile.ps1`: This is the _system_'s powershell profile while the one with "Microsoft" in the name is the _user's_ powershell profile.
  You can test which profile your current powershell session is using by referencing the `"$PROFILE"` variable.
- `.\other_functions.ps1`: This is my main function and alias script which I source from `$PROFILE`

- `.\projectVars.ps1`: This is a script that contains a lot of my project directories and files as `$variables`.
  This allows me to quickly switch between projects as long as I know the variable name.

- `.\wslFunctions.ps1`: This list of functions allows me to interact with certain wsl programs like `apt` straight from __Powershell__.  This file will eventually be located in `..\ScriptsAndFunctions\`

## Variables pointing to config files

- `$projectVarsScript` + `$otherFunctionScript`: point to my `projectVars.ps1` and `other_functions.ps1` script files respectively so that I may add extra config directly from the shell without having to open an editor!  _Cool huh?_

I can quickly write a simple function and immediately pipe it into my `ps1` file of choice by surrounding
the function with single-quotes and using the `>>` operator to append the content to the file.
I'm careful not to accidentally use the `>` operator which will _overwrite_ the whole file.
This is part of the reason why I use `git` to keep track of my changes.  If I ever mess up 
like that I just have to do a `git reset` back to a previous commit.

### TODO

I plan on making a function that does a `Write-Output` of all the different project variables I
have access to.
I could even append all important powershell profile scripts into an array variable, along with other objects like
`(Get-Process pwsh)` or whatever I want.
