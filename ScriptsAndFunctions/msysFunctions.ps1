function invokeBash {

<#
.Description
Invoke msys bash using parameters
#>
param(
    [Parameter(Mandatory = $false)]
    [string]
    $Command,
    $msysBash = (Get-Command D:\MSYS2\usr\bin\bash.exe)
)
Process {
    if ($Command) {
        Write-Verbose "Starting msys bash with $Command"
        & $msysBash -c "$Command"
    }
    else {
        Write-Verbose "Invoking msys bash normally"
        & $msysBash -l -i
    }
}
End {
    Write-Verbose "This is the end"
}

}
