function csearch {
    if ($args) {
        if (Get-Command -Name choco -CommandType Application -ErrorAction Ignore) {
            choco search "$args"
        } else {
            write-error "choco binary not found in your path"
        }
    } else { write-error "Must provide an argument to this function" }
}
function sinfo {
    $Function:usage = "Usage: sinfo `"program_to_lookup`""
    if ($args) {
        if (Get-Command scoop -ErrorAction Ignore) {
        scoop info "$args"
        } else {
            Write-Error "Scoop executable not found in PATH"
            Write-Error -Message "$usage"
            return
        }
    } else {
        "Usage: need argument"
    }
}
