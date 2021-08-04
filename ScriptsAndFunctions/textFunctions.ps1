# Author: Carl C.
# Date: $(Get-Date).ToString()
# Nice text functions for convenience's sake.
# OriginalLocation: ~/gitstuff/scripts-pwsh/Scripts

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
