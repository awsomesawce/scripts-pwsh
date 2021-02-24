$hashArguments = @{
Path = "test.txt"
Destination = "test1.txt"
WhatIf = $true
}

if (($hashArguments).Count -lt 2) 
{ Write-Output "yesss"} 
else 
{ echo "nonono" }
$arrayArgs = "test.txt", "test1.txt"
