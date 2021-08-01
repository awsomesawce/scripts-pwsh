# More npm related functions

function add-npmpath
<#
.Description
If in an npm project folder, will instanciate the npmbin variable.
#>

if (Test-Path .\node_modules\.bin) {
    $global:npmbin = ".\node_modules\.bin".Replace('\', '/')
    Write-Output "Found npmbin at $global:npmbin.  added `$npmbin var to session"
}
elseif (Test-Path "./node_modules") {
    Write-Output "Found node_modules folder, but .bin folder seems to be missing"
}
elseif (Test-Path "./package.json") {
    $ans = Read-Host "node_modules folder not found, but found package.json
Would you like to parse the file into a variable? y or n "
    if ($ans -eq 'y') {
        Write-Output "parsing json into `$pkgjson"
        $global:pkgjson = Get-Content "./package.json" | ConvertFrom-Json -AsHashtable
    }
    else {
        Write-Output "Thank you for using this script!"
    }
}
else {
    Write-Error "did not find any files relating to an npm package."
}

}
