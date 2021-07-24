<#
.Description
Simple version of expand-definition
.NOTES
Can (should?) be implemented as a function
#>

$x = (Get-Command -Name $args -CommandType Function).Definition
return $x

