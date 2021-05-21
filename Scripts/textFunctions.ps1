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
