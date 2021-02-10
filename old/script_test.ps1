# This script enters the date into a file and then some input, and then it opens the file in question with Code
# You can use the echo/Write-Output function, or the Add-Content function to add text to a file.
date >> script_created.txt
Write-Output "Welcom to my script!" >> script_created.txt
Add-Content -Path ".\script_created.txt" -Value 'This content is from a powershell cmdlet/module'
code.cmd script_created.txt
