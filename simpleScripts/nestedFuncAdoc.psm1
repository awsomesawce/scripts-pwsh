function adoctor1 {
<#
.DESCRIPTION
Uses nested functions to hopefully simplify the process
#>
param([string]$File)
function base {
param([string]$f)
return (get-Item $f).Name
}
return wsl asciidoctor -o - $(base $File)
}
