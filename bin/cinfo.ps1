<#
.SYNOPSIS
Get info on multiple choco packages
.NOTES
## Changelog

- Turned into straight-up script as opposed to a sourcable function.
#>
param(
    [Parameter()]
    [string[]]
    $PackageName
)

[version]$VERSION = [version]::new("0.1.0.0")
return $PackageName.ForEach({
    choco info $_
})
