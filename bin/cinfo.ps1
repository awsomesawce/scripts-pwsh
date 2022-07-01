function Get-ChocoInfo {
<#
.SYNOPSIS
Get info on multiple choco packages
#>

[version]$VERSION = [version]::new("0.1.0.0")

return (
($args.count -gt 1) ? ($args | foreach { choco info $_ }) : (choco info $args)
)
}
