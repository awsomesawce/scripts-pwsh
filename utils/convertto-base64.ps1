
<#PSScriptInfo

.VERSION 0.1.0

.GUID 2e04186b-9517-446d-b548-8ebdbd322f0c

.AUTHOR Carl C.

.COMPANYNAME

.COPYRIGHT

.TAGS encoding, converters

.LICENSEURI 

.PROJECTURI 

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<#
.Description
Attempt to convert a string to base64
.PARAMETER myStr
String to encode to bytes and convert to base64
.NOTES
As opposed to other base64 tools, the string
must be converted into utf8-encoded bytes first
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]
    $myStr
)
if ($myStr) {
    $myBytes = [system.text.encoding]::UTF8.GetBytes($myStr)
    $myEncoded = [convert]::ToBase64String($myBytes)
    return Write-Output $myEncoded
}
else {
    return Write-Error "Nope"
}
