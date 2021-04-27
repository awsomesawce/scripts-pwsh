#!/usr/bin/pwsh
# This nice little function allows you to check whether an application is
# installed in the ~/scoop/apps/ subdirectory and then prints out the script
# to the console!  Cool, huh?

function get-scoop-script {
if ($args) {
if (test-path -Path "~/scoop/apps/$args") {
get-content -Raw $(Get-Command -CommandType ExternalScript "$args.ps1").Source
} else {
write-error "Application not located in scoop directory"
}
} else {
    Write-Error "You did not write an argument"
    Write-Error "Usage: get-scoop-script `"name-of-script`""
}
}

function get-scoop-shim {
    if ($args) {
        if (test-path -Path "~/scoop/shims/$args.ps1") {
            Write-Information "Getting script source for `"$args`""
            Get-Content -Encoding UTF-8 $(Get-Command -Name "$args.ps1" -CommandType ExternalScript).Source
        } else {
            Write-Error -Message "Script name of $args.ps1 not found in ~/scoop/shims subdirectory"
        }
        else {
            write-error "You need to write an argument to this function"
            Write-Output "Usage: get-scoop-shim `"name-of-shim`""
        }
    }
}
