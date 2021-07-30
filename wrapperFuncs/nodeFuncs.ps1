function get-nodecmd {

<#
.Description
Acts like a pydoc of sorts
#>
param(
    [parameter(Mandatory = $false)]
    [string]
    $Name
)
if (!(Get-Command node -ErrorAction Ignore)) { throw "Node not installed on path, aborting function" }
if ($Name) {
    node -p "$Name.toLocaleString()"
}
else { Write-Error "Need argument to this function.  Use Get-Help $($MyInvocation.MyCommand.Name) to get help" }

}
