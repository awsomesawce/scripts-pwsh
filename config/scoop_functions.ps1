function sinfo {

<#
.Description
Scoop info hack for dealing with multiple args
#>
param(
    [string[]] # This is a string array because of the two extra brackets.
    $ProgName
)
Begin {
    if (!(Get-Command scoop -ErrorAction Ignore)) {
        throw "Scoop not installed"
    }
}
Process {
    if ($ProgName) {
        if ($ProgName.Count -ge 2) {
            foreach ($name in $ProgName) {
                scoop info "$name"
            }
        }
        else {
            scoop info "$ProgName"
        }
    } else {
	Write-Error "Need arg"
    }
}

}
