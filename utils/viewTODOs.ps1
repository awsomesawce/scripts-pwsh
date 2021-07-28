
<#
.Name
viewTodosandIncomplete
.Description
This function searches for TODO and INCOMPLETE in the current directory.
.NOTES
Does not support arguments and fails if it detects any.
#>
$s = "(TODO|INCOMPLETE)"
if ($args) {
    return Write-Error "This function currently does not support args"
    
}
else {
    if (Get-Command -Name rg -ErrorAction Ignore) {
        return rg "$s"
    }
    elseif (Get-Command -Name ack -ErrorAction Ignore) {
        Write-Error "ack not working correctly"
        return Select-string -pattern "$s" -Path ./*
    }
    else {
        return Select-String -Pattern "$s" -Path ./*
    }
}
return
