# Author: Carl C.
# Date: $(Get-Date).ToString()
# Nice text functions for convenience's sake.
# OriginalLocation: ~/gitstuff/scripts-pwsh/ScriptsAndFunctions

$textFunctionsMeta = @{
    file = "textFunctions.ps1"
    location = "$PSScriptRoot"
    description = "Utility functions and programs for working with strings and text on the commandline"
}

function Format-Script {
<#
.Description
Formats the script in place and prints to stdout
.NOTES
Must be a file
#>
    param([string]$Path)
    # 
    if (test-path $Path) {
	$content = (Get-Content -Path $Path -Raw).ToString()
	return Invoke-Formatter -ScriptDefinition "$content"
    }
    # TODO: Add option for if path is a scriptblock
    else {
	throw "Path does not exist on file system"
    }
}

function Open-inVim {
	# Simple if statement
	if ($args) {vim -u "~/.vimrc" "$args"} else {vim -u "~/.vimrc"}
}
# Set an alias for this vim function

function Replace-SpacesWithUnderscores {
    <#
    .Description
    Takes a string and replaces each space between words into underscores
    #>

    param(
	[Parameter()]
	[string]
	$String
    )
    $local:space = ' '
    $local:underscore = '_'
    if ($String) {
	return $String.Replace($space, $underscore)
    }
    else {
	return Write-Error "$($PSScriptRoot) is `$PSScriptRoot"
    }
    return 0

}

$newFunc = (Get-Command Replace-SpacesWithUnderscores)
$newFunc.Description = "Replaces pesky spaces with underscores!"
#$newFunc.Source = $PSScriptRoot # Doesn't work because "Source is ReadOnly"
$newFunc.Description = "$($newFunc.Description)  From $PSScriptRoot"
