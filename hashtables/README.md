# Fun with Powershell Hashtables

These things are just great.  It's everything you could want from a scripting shell.
Combines all the best parts of **Perl**, **Javascript**, **DotNet**, **Python**, etc.
I see so many nods to the languages that came before, and I notice where they got their inspiration
for a lot of the functionalities in **Powershell**.

Anyway, open `./funwithhashtables.ps1` to see what I'm talking about.

In most unix-like shells you cannot have a deeply nested hashtable structure like you can in **Powershell**.
This file basically gets a whole bunch of information from PATH and the filesystem (where commands are located) and
stuffs them all into a nice, neat hashtable.

Speaking of hashtable structure, I could even build my own class that has similar functionalities as a
hashtable.  I can even inherit from the `[hashtable]` class.

There are different ways of doing everything, which is amazing.

You can write a script in the recommended fashion (using the `param()` method to build your own tab-completing parameters), or
you can go _full-unix_ and use basically the same script-writing style as unix shells.

Take a look at Luke Sampson's [psutils](https://github.com/lukesampson/psutils) for a demonstration on how
to _not_ use **Powershell's** _Verb-Noun_ naming conventions.  He is an inspiration for all
of us **Powershell** programmers.

## Implications of Nested Hashtables

The implications are many.  By using `Get-Command` and `Get-ChildItem`, you can let the system figure out where things are
and concentrate on real problems.  You can even map the output of something like:

```powershell
Get-Process *pwsh*, *powershell*
```

to a variable and/or hashtable like so:

```pwsh
# This hashtable queries the system for process info on pwsh, powershell.exe
#+and chrome.  Chrome is not on our PATH so `Get-Command` won't work,
#+but we can still get the executable from `Get-Process`
$ht = @{
pwshProcesses = Get-Process *pwsh*, *powershell*
pwshLocations = Split-Path $(foreach ($i in @("pwsh", "powershell.exe")) {
(get-command $i).Source})
chrome = @{
desc = "Chrome.exe process info"
procs = Get-Process chrome -ErrorAction SilentlyContinue
locations = $null # chrome.exe is not on PATH
procCommandLine = (Get-Process chrome).CommandLine
}
description = "Hashtable consisting of pwsh, powershell, and chrome processes and dirnames of the command."
}
```
