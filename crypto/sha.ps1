function create384 {

param([string]$value)
$crypto = [System.Security.Cryptography.SHA512]::Create()
return [System.Convert]::ToBase64String($crypto.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($Value)))

}
