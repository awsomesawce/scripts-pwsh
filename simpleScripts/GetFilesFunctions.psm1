#!/usr/bin/env -S pwsh -noprofile
function Get-JSFiles {
<#
.DESCRIPTION
Simple function to get all js files in a dir
.NOTES
Uses `-filter` param when specifying a dir to look in, otherwise just
uses a glob string array for filepath
#>
param([string]$dir)
    if ($dir) {
        Get-ChildItem "$dir" -Filter "*.*js"
    }
    else {
        Get-ChildItem "*.js", "*.mjs", "*.cjs"
    }
}
