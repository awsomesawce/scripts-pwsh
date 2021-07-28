$utilList = @{
list = @((Get-childitem .).BaseName)
dotsourcable = @(".\pythonFunctions.ps1", ".\ghcli_wrapper.ps1", "..\ScriptsAndFunctions\npm-functions.ps1")
dirname = $(get-item .)
}
return $utilList
