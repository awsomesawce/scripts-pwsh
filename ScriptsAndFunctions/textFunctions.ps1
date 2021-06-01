# Author: Carl C.
# Date: $(Get-Date).ToString()
# Nice text functions for convenience's sake.
# OriginalLocation: ~/gitstuff/scripts-pwsh/Scripts

function Format-Script {

param([string]$Path)
if ($Path) {
    $content = (Get-Content -Path $Path -Raw).ToString()
    Invoke-Formatter -ScriptDefinition "$content" | Out-Host -Paging
}
else {
    throw "Need to enter path of script file to format."
}
}

function OpenIn-Vim {
    param([string]$File)
    if (Get-Command vim -ErrorAction Ignore) {
	# Simple if statement
	if ($File) {vim -u "~/.vimrc" "$File"} else {vim -u "~/.vimrc"}
    } else {
	Write-error "Vim executable not found in `"`$env:PATH`""
    }
}
# This is just to set the length to be longer than a specific number.
