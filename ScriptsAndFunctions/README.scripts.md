# ScriptsAndFunctions

This is a collection of different useful scripts I use daily.
I am working on consolidating them into categories like _Backup_, _Git_, _Text_, _FileSystem_, etc.

Important _scripts_ (as in `Get-InstalledScript`) will be separated from scripts designed to be _sourced_
into a _PSSession_.

As far as naming, I try to keep true to the **Powershell** way of _Verb-Noun_ nomenclature, although
_personalized_ scripts designed for me are sometimes named with no hyphen.

## Files

- `textFunctions.ps1`: A collection of text-based functions I'm working with.


## stdaloneScripts dir

This dir is for standalone scripts only.  No function-based pwsh scripts that are meant to be sourced instead of run
will be in this directory.  These are one-off scripts that are for one purpose alone.
Keeping a bunch of functions in memory is taxing.  From now on I will concentrate on writing
standalone scripts that are kept on the file system as opposed to taking up memory.


For example, backup scripts are now in the stdaloneScripts directory

Scripts that are designed to be sourced into the powershell session shall remain here.
