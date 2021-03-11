$myHashtable = @{
Name = 'Carl'
Language = 'Powershell'
State = 'Florida'
}
$myObject = [pscustomobject]$myHashtable
$myObject | ConvertTo-Json -Depth 1 | Set-Content -Path "output.json"
# And then you can transfer the json file back to a psobject
$myObject = Get-Content -Path output.json | ConvertFrom-Json
# This is great!
