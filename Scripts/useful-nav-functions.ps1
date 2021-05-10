# This func goes to the parent dir of the argument
function goto-parentdir {
if ($args) {
set-location (Split-Path -Parent "$args")
} else {
Write-Error "This function needs arguments"
}
}
