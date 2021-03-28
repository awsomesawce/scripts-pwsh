# Pwsh Config
**NOTE**: Powershell allows for both `unix` and `windows` style filepaths.
  This is why the backtick is *Powershell's* escape character, while "/" is _Linux's_ escape character.

`.\config` is where I house most if not all my Powershell configuration, functions, aliases, and profiles.

## Important Files

- `./Microsoft.PowerShell_profile.ps1`: This is the main profile that **Powershell** reads when starting up.
  Be careful not to put too many things in your main profile, as it is sourced for _every_ invocation of **Powershell**.
  Even when using `pwsh -c "Some-Command"`, it will load the main profile and then exit.
  However, you can use `pwsh -noprofile` (or `pwsh -nop`) to tell pwsh to _not_ load a profile.

- `./Profile.ps1`: This is the _system_'s powershell profile while the one with "Microsoft*" in the name is the _user's_ powershell profile.
  You can test which profile your current powershell session is using by referencing the `"$PROFILE"` variable.
- `.\other_functions.ps1`: This is my main function and alias script which I source from `$PROFILE`
