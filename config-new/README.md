# New Windows Config for Powershell

I have gotten a new computer and am adjusting back to normal Powershell slowly.

## Files

- `./CONSTANTS.ps1`

A hashtable filled with constant variables, although they're not really _constant_ per-se,
I'll have to change the name.
There are checks in place so that if I'm using Powershell inside VSCode, it will fail.

> A true CONSTANTS file/hashtable would be inside a `DATA` object using the `DATA` keyword.

### TODO for CONSTANTS.ps1

- [ ] Redefine it as a `.psd1` file or a `.json` file.
Probably `.psd1` since executable code is still allowed in that file type.

- `./Microsoft.Powershell_profile.ps1`

My main Powershell profile.  Contains basic functions like setting `$env:Path`, `$env:PAGER`, etc.
Initializes `conda` env and imports modules like [_posh-git_][2].

- `./CopyProfileToConfigNew`

**IN PROGRESS**
Copies my `$PROFILE.CurrentUserCurrentHost` from the default location (`$env:USERPROFILE/Documents/Powershell` on Windows) into this directory.
Again, there are checks in place so I don't accidentally overwrite or copy the wrong file.

> Depends on `./CONSTANTS.ps1`.

- `./MySetup.psm1`
Defines a few personalized functions for making my job working with Powershell easier.

- `./BeginModule.psm1`
Same goes for this file.  Very personalized.

- `./aliases.ps1`, `./aliases.ps1.md`
A few experimental scripts for defining aliases and other junk.

## Warning

Since most of this source code is experimental in nature, I don't recommend anyone adopting this profile as their own just yet.

[2]: https://github.com/dahlbyk/posh-git
