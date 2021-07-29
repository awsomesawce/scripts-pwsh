function Repo-View {
<#
.Description
Wrapper around `gh repo view [--web]` for Powershell
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [switch]
    $Web,
    [Parameter(Mandatory = $false)]
    [string]
    $Repo,
    [Parameter(Mandatory = $false)]
    [string]
    $User
)

if (!(Get-Command gh -ErrorAction Ignore)) {
    throw "Need github-cli `"gh`" to be installed"
}

$function:basicView = [scriptblock]::Create('gh repo view')
if ($Web -and $User -and $Repo) {
    & $function:basicView "$User/$Repo" --web
}
elseif (!($Web) -and $User -and $Repo) {
    & $function:basicView "$User/$Repo"
}
elseif (!($Web) -and (!($User))) {
    & $function:basicView "$Repo"
}
elseif (($Web) -and (!($User))) {
    & $function:basicView "$Repo"
}
else {
    return Write-Error -Category NotImplemented -Message "Not implemented"
}
Write-Verbose "Done!"

}
