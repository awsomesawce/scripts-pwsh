#!/usr/bin/env -S pwsh -nop
# Get psenv file from gist

$gisturl = "https://gist.githubusercontent.com/awsomesawce/f37c910c245ed409fa6da84edf716dd9/raw/e8adc7e69ab23f98afc016a95fad83f10636b737/psenv.ps1"

[System.Net.ServicePointManager]::SecurityProtocol = 'Tls12'
#$newfile = Invoke-RestMethod -Method Get -Uri $gisturl # Can use (Invoke-WebRequest $gisturl).Content instead
$newfile = (Invoke-WebRequest -Method "Get" -Uri "$gisturl").Content
$newfile >> .psenv.ps1
