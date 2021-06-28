function pyhelp {

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
