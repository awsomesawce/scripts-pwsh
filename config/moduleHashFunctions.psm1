function getPSPath {
<#
.Description
Expect output in the form of a hashtable.
.NOTES
Only works if _one_ method is typed in.
#>
[CmdletBinding()]
param(
[Parameter(ValueFromPipeline = $true, Mandatory = $false)]
[string]$File,
[Parameter(Mandatory = $false)]
[string[]]$Methods
)
if ((Get-Item $File).Exists -and (Get-Item $File).Extension -eq ".json") {
return (get-content $File | convertfrom-json -AsHashtable).$Methods
}
else {
write-error "It did not work"
}
}
