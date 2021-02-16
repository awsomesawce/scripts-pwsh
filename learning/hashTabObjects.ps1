$hshTwo = @{"Powershell" = (Get-Process -Name pwsh);
"Notepad" = (Get-Command notepad)}
# These commands make a hash table of processes
