#!/usr/bin/env -S pwsh -nop
<#
.SYNOPSIS
duks using uribuilder and uri
.PARAMETER Query
Query string to search duckduckgo.com with.
.NOTES
When setting the query, duckduckgo.com requires a string prefix of `q= `
.OUTPUTS
[System.String]
#>
[CmdletBinding()]
param(
[string]$Query
)

$Local:UriBuilder = [System.UriBuilder]::new("https", "duckduckgo.com")
$Local:UriBuilder.query = "q=$Query"

Write-Information -MessageData @{message="Returning uribuilder object"} -Tags @("return")

$searchUri = $Local:UriBuilder.toString()

Start-Process $searchUri
