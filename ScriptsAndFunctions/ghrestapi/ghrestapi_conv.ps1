
<#
.Description
Quick rest api client for github.
.EXAMPLE
ghrestapi -User:"awsomesawce" -Repo:"scripts-pwsh"
=> returns a json object containing information about https://github.com/awsomesawce/scripts-pwsh
.NOTES
Use it with convertfrom-json to interface with Powershell HashTables.
#>
param(
    [parameter(Mandatory=$false)]
    [string]$User,
    [string]$Repo,
    [switch]$ConvertFromJson
)
$baseURI = "https://api.github.com/repos"
function convfromjson {
    if ($ConvertFromJson) {
	return (Invoke-WebRequest -Uri "$BaseURI/$User/$Repo" -Method "Get").Content | convertfrom-json -AsHashTable
    }
}
if (($User) -and ($Repo)) {
    if ($ConvertFromJson) {
        convfromjson "$BaseURI/$User/$Repo"
    } else {
        return (Invoke-WebRequest -Uri "$BaseURI/$User/$Repo" -Method "Get").content
    }
} elseif (($Repo) -and (!($User))) {
    return (Invoke-WebRequest -Uri "$BaseURI/awsomesawce/$Repo" -Method "Get").content
} else {
    return Write-Error -Category NotImplemented -Message "Not Implemented"
}
