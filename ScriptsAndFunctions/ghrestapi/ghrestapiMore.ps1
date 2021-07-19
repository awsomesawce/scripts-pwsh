<#
.Description
Amazing new version of ghrestapi.ps1
#>

param(
    [parameter(Mandatory = $false, HelpMessage = "Convert from json")]
    [switch]$ConvertJSON,
    [string]$User,
    [string]$Repo
)
$baseUri = "https://api.github.com/repos"
if ($ConvertJSON) {
    return (iwr "$baseUri/$User/$Repo").Content | ConvertFrom-Json -AsHashtable -Verbose
}
elseif ($User -and $Repo) {
    return (iwr "$baseUri/$User/$Repo").Content
}
elseif (!($User)) {
    return (iwr "$baseUri/awsomesawce/$Repo").Content
}
else {
    return Write-Error -Category NotImplemented -Message "Not implemented"
}


