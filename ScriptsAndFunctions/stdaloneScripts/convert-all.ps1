
<#
.Description
Attempt to convert a markdown file using convertfrom-markdown
.PARAMETER Path
The path of the file being converted
.PARAMETER Browser
Choose whether to open the file in the browser after conversion
#>
param(
    [Parameter(Mandatory = $true)]
    [string[]]
    $Path,
    [switch]
    $Browser
)
$dest = "$((Get-Item $Path).basename).html"
if ($Path) {
    ConvertFrom-Markdown -Path $(Get-Item $Path).Name | select -exp Html | Out-File $dest -Encoding utf8 -NoClobber
}
if ($Browser) {
    Invoke-Item $dest
}
else {
    return "Done"
}

