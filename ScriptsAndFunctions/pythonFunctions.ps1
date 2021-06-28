function pyhelp {
<#
.Description
Open help articles directly from the Powershell terminal
.Notes
TODO: Write an equivalent bash script for this.
#>
param(
    [string]
    $HelpTerm
)
Process {
    if ($HelpTerm) {
        Write-Output "Opening $HelpTerm help article"
        py -c "help($HelpTerm)"
    }
    else {
        Write-Error "Need to provide `$HelpTerm"
    }
}

}
