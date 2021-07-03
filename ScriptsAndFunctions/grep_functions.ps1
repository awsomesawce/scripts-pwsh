function viewTODOsandIncomplete {

<#
.Description
This function searches for TODO and INCOMPLETE in the current directory.
#>
$s = "(TODO|INCOMPLETE)"
if ($args) {
    Write-Error "This function currently does not support args"
}
else {
    if (Get-Command -Name rg -ErrorAction Ignore) {
        rg "$s"
    }
    elseif (Get-Command -Name ack -ErrorAction Ignore) {
        Write-Error "ack not working correctly"
        continue
    }
    else {
        Select-String -Pattern "$s" -Path ./*
    }
}

}
