
<#
.Description
Quick rest api client for github.
.EXAMPLE
ghrestapi -URI "awsomesawce/scripts-pwsh"
=> returns a json object containing information about https://github.com/awsomesawce/scripts-pwsh
.NOTES
Use it with convertfrom-json to interface with Powershell HashTables.
#>
param(
    [string]$URI
)
$baseURI = "https://api.github.com/repos"
if ($URI) {
    return (iwr -Uri "$BaseURI/$URI" -Method "Get").content
}

