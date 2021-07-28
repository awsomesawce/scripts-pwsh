# Author: Carl C.
# Date: $(Get-Date).ToString()
# Nice text functions for convenience's sake.
# OriginalLocation: ~/gitstuff/scripts-pwsh/Scripts

function Format-Script {

param([string]$Path)
if ($Path) {
    $content = (Get-Content -Path $Path -Raw).ToString()
    return Invoke-Formatter -ScriptDefinition "$content"
}
else {
    throw "Need to enter path of script file to format."
}
}

function Open-inVim {
	# Simple if statement
	if ($args) {vim -u "~/.vimrc" "$args"} else {vim -u "~/.vimrc"}
}
# Set an alias for this vim function
