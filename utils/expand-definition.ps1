
<#
.Description
Expands the definition of the function
#>
param(
    [Parameter(Mandatory = $false)]
    [string]$FunctionName,
    [Parameter(Mandatory = $false)]
    [switch]$PageOutput
)

# $function:getfunc is now a scriptblock.
$function:getfunc = [scriptblock]::Create("
if (Get-Command $FunctionName -CommandType Function -erroraction ignore) {
    Get-Command $FunctionName -CommandType Function | Select-Object -ExpandProperty Definition
} else {
    Write-Error `"$FunctionName is not a function`"
}")

$Alias:pager = (Get-Command $env:PAGER -ErrorAction Ignore) ? ("$env:PAGER") : ("less")

function Beginit {
    if ("$PWD" -eq $MyInvocation.PSScriptRoot) {
        Write-Output "You are in the same root directory"
    } else {
        Write-Host -ForegroundColor Cyan "The directory you are in is $PWD"
    }
}
Beginit

    if ($PageOutput) {
        if (Get-Command $FunctionName -CommandType "Function" -ErrorAction Ignore) {
            Write-Output "`$pager is $Alias:pager"
            getfunc | pager
        }
        else {
            Write-Error -Category "NotImplemented"
        }
    }
    else {
        getfunc | pager
    }
function endit {
    Write-Output @"
    You're script is ended"
"@

}

endit
