function create-PSConfigArchive {
if (Test-Path "$scriptspwsh") {
Write-Output "Creating pwsh config archive"
Compress-archive -Path "$scriptspwsh" -DestinationPath "$env:OneDrive\snippets\pwsh\scriptspwshConfig$(Get-Date -Format FileDate).zip" -Confirm
} else {
Write-Error "Something went wrong.  Check the function"
}
}
