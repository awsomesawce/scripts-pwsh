function csearch {
if ($args) {
if (gcm choco) {
choco search "$args"
} else {
write-error "choco binary not found in your path"
}
} else { write-error "Must provide an argument to this function" }
}
