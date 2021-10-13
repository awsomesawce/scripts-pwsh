# Multiply collection types amalgamated into one hashtable
#Set-StrictMode -Version 2.0

$DebugPreference = "Continue"
$VerbosePreference = "Continue"


(Test-Path "./MyDebug.psm1") ? (import-Module "./MyDebug.psm1") : (Write-Debug "Could not find ./MyDebug.psm1")
function Test-Debug {
    [CmdletBinding()]
    param()
    Write-Debug ('$DebugPreference is ' + $DebugPreference)
    Write-Host ('$DebugPreference is ' + $DebugPreference)
}

<#
.Description
List of collection objects
#>

Write-Debug "Welcome to collections.ps1"

# Linked string list
$Local:llstr = [System.Collections.Generic.LinkedList[string]]::new()

# String collection
$Script:collstr = [System.Collections.Specialized.StringCollection]::new()

# String hash set
$Script:hs = [System.Collections.Generic.HashSet[string]]::new()

$hs.Add('five')
$hs.Add('seven')

# String array
# @type [string[]]
$Script:arrstr = @('one', 'two', 'three', 'four')

foreach ($i in $arrstr) {
    $null = $llstr.Add("$i")
    $null = $collstr.Add("$i")
    $null = $hs.Add("$i")
}

$Script:message = @"
linked list is:
`t$llstr

string collection is:
`t$collstr

string array is:
`t$arrstr

string hash set is:
$hs
"@

Write-Host -Fore Cyan $message

# String collection hashtable
$Local:strs = @{
    ll = $llstr # linked list
    coll = $collstr # string collection
    arr = $arrstr # regular string array `[string[]]`
    hs = $hs
    msg = $message
}