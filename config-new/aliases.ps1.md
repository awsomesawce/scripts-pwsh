# aliases.ps1

> Date: 7/1/2022 5:54:05 PM

FAQ/Notes for `scripts-pwsh/config-new/aliases.ps1`

## Questions

Begin questions...

### Whats up with all the hashtables?

Instead of writing out an entire commandline for one command (especially for `New/Set-Alias`, I chose to use _splatting_.

> See `Get-Help about_splatting` in Powershell for more info.

This allows me to just create a hashtable/pscustomobject and load it up with all the parameter names and values, and use the same object for possibly multiple calls to cmdlets and functions.

The advantage of this is that I can use and reuse the same parameter hashtable over and over and just reassign one or two values as the script goes on.  
This beats writing out the entire list of parameters every time I want to call a function.

### Why is the testing code not in a separate file/module?

Haven't gotten around to it yet.

