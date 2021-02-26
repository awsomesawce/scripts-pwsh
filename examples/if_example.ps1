$hashArguments = @{
Path = "test.txt"
Destination = "test1.txt"
WhatIf = $true
}
$arrayArguments = "test.txt", "test1.txt"

if (($hashArguments).Count -lt 2) 
{ Write-Output "yesss"} 
else 
{ printf "nonono" }
