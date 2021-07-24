
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

# $getfunc is now a scriptblock.
$getfunc = [scriptblock]::Create("
if (Get-Command $FunctionName -CommandType Function -erroraction ignore) {
    Get-Command $FunctionName -CommandType Function | Select-Object -ExpandProperty Definition
} else {
    Write-Error `"$FunctionName is not a function`"
}")

$pager = (Get-Command $env:PAGER -ErrorAction Ignore) ? ("$env:PAGER") : ("less")

function Beginit {
    if ("$PWD" -eq $MyInvocation.PSScriptRoot) {
        Write-Output "You are in the same root directory"
    } else {
        Write-Host -ForegroundColor Cyan "The directory you are in is $PWD"
    }
}

    if ($PageOutput) {
        if (Get-Command $FunctionName -CommandType "Function" -ErrorAction Ignore) {
            Write-Output "`$pager is $pager"
            & $getfunc
        }
        else {
            Write-Error -Category "NotImplemented"
        }
    }
    else {
        #& $getfunc | & $pager
    }
function endit {
    Write-Output @"
    You're script is ended"
"@

}

Beginit
endit
