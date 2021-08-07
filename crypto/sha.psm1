#!/usr/bin/env -S pwsh -noprofile
# Fun with cryptography

function create512 {
<#
.Description
Simply outputs the sha512 hash of the provided string
#>
    param([string]$value)
    $crypto = [System.Security.Cryptography.SHA512]::Create()
    return [System.Convert]::ToBase64String($crypto.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($Value)))

}
function createHash {
<#
.Description
Outputs both the base64 encoded string and the sha512/base64 string
#>

    param([string]$value)
    $crypto = [System.Security.Cryptography.SHA512]::Create()
    if ($value) {
	Write-Output "Changing $value to sha hash"
	$bytes = [system.text.encoding]::UTF8.GetBytes($value)
	$chash = $crypto.ComputeHash($bytes)
	$chashtob64 = [convert]::ToBase64String($chash)

	return @"
Unshaed base64 = $([convert]::ToBase64String($bytes))
Shaed = $chashtob64
"@
    }
    else {
    Write-Error "You did not enter a value"
    }

}
