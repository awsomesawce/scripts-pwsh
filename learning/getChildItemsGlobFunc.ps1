function Get-ChildItemsGlob {

<#
.SYNOPSIS
Making it easy to look for specific words in file and dir names
#>
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]
    $SearchTerm,
    [Parameter()]
    [string]
    $Description,
    [parameter()]
    [string]
    $PathStart = ".",
    [parameter()]
    [switch]
    $ReturnAnObject
)

return (
    $ReturnAnObject ? [pscustomobject]@{
        result      = gci $PathStart/*$SearchTerm*, $PathStart/**/*$SearchTerm*
        searchTerm  = $SearchTerm
        description = $Description ? $Description : "No description"
    } : (Get-ChildItem $PathStart/*$SearchTerm*, $PathStart/**/*$SearchTerm*)
)

}
