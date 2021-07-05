<#PSScriptInfo
.AUTHOR Carl Capodice

.Description
Backs up the msys2 scripts that are inside "~/bin"
.NOTES
Todo: fix up the variable namings.
#>

[cmdletbinding()]
param(
[Parameter(Mandatory = $false)]
[string]$Dest
)
Try {

    $files = @((Get-ChildItem ~/bin/msys*), (Get-Childitem ~/bin/pwsh*))
    $dests = @((Get-Item "$env:myDotfiles\msys2").FullName, (Get-Item $dotfileDirs[0]).FullName)
Catch {
    Throw $_
}

foreach ($file in $files) {
    echo "Copying $file to $dests dir"
}
if ($Dest) {
    $params = @{
	Path            = "~/bin/msys*"
	DestinationPath = "$($dests[1])\msys2\$Dest"
	Confirm         = $true
	Verbose         = $true
    }
    Compress-Archive @params
}
else {
    $paramsTwo = @{
	Path            = "~/bin/msys*"
	DestinationPath = "$($dests[1])\msys2\msys2bin.zip"
	Confirm         = $true
	Verbose         = $true
    }
    Compress-Archive @paramsTwo
}


