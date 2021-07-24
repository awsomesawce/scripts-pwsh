function ghrestapi {

param(
    [Parameter(Mandatory = $true)]
    [string]$repo,
    [Parameter(Mandatory = $false)]
    [string]$user
)
$basedir = "https://api.github.com/repos"
if (($repo) -and ($user)) {
    return Invoke-RestMethod -Uri "$basedir/$user/$repo" -Method "Get"
}
elseif (($repo) -and (!($user))) {
    return Invoke-RestMethod -Uri "$basedir/awsomesawce/$repo" -Method "Get"
}
else {
    return Write-Error "Not implemented"
}

}
