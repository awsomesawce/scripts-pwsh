#!/usr/bin/env pwsh
# Building a _massive_ hashtable containing a bunch of info about my system.

<#
.Description
Build a _massive_ informative hashtable by parsing info about the filesystem.
This script basically returns a hashtable consisting of all the queries I want
and puts it into a `[hashtable]` type.
.SYNOPSIS
funwithhashtables [-ReturnObject]
.PARAMETER ReturnObject
With this switch, returns the hashtable into the parent scope.
This parameter is necessary for the script to function.
.EXAMPLE
$ht = .\funwithhashtables.ps1 -ReturnObject
.EXAMPLE
.\funwithhashtables -ReturnObject | set-variable -Name newvarobj -Description "New hashtable" -Option None
.INPUTS
None
.OUTPUTS
Returns a [hashtable] object.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [switch]
    $ReturnObject,
    [Parameter(Mandatory = $false)]
    [switch]
    $GetAll
)
if ($ReturnObject -and $GetAll) {
$commandlocations = @{
lists = @{
piplist = pip list
chocolist = choco list --local-only
}
__description__ = "hashtable consisting of a bunch of info"
}

# After the hashtable is loaded, you can use these methods to add to it on the
#+command-line.
$commandlocations.lists.scooplist = scoop export
$commandlocations.lists.pycommands = get-command py*
$commandlocations.lists.npmglobal = Get-ChildItem $(npm -g bin)
$commandlocations.lists.yarnglobal = get-childitem $(yarn global bin)
$commandlocations.npmgloballocation = npm -g bin

return [hashtable]$commandlocations # The `[hashtable]` type declaration is unnecessary
} else {
    return write-error "Not implemented"
}
return Write-Verbose "Script finished"
