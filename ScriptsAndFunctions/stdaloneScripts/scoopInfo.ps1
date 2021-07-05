#!/usr/bin/env -S pwsh -nop

    <#
    .Description
    Scoop info: Small script which allows multiple arguments to
    the `scoop info` function
    .PARAMETER Name
    An array of names of programs to look up using `scoop info`.
    .Notes
    TODO: Transition this function into a script file.
    #>

param([string[]]$Name)
if ($Name -and $(Get-Command scoop -ErrorAction ignore)) {
    if ($Name.Count -gt 1) {
        Write-Verbose "Count is greater than one"
        Write-Information "Getting info for $Name"
        foreach ($thing in $Name) {
            scoop info "$thing"
        }
    }
    else {
        Write-Verbose "Detected only one arg"
        scoop info "$Name"
    }
}
else {
    Write-Error -Category SyntaxError "Must have an argument to the `$Name parameter."
}
