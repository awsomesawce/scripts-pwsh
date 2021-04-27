#!/usr/bin/pwsh
# This nice little function allows you to check whether an application is
# installed in the ~/scoop/apps/ subdirectory and then prints out the script
# to the console!  Cool, huh?

function Change-this-dir {
    <#
        .Description
        Change-this-dir: Go to some other directory and get a message printed out!"
        .PARAMETER Path
        The name of the dir you want to change to.
        #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true,
            HelpMessage = "Enter what directory you would like to change to")]
        [Alias("chtodir", "testfuncyes")]
        [string] $Path
    )
    
    begin {
        Write-Output "Going to $Path"
        if ("$Path" -like "..") {
            Write-Output "Looks like you are going backwards!"
        }
    }
    
    process {
       Set-Location $Path && Write-Output "That seemed to work!" || Write-Error "That place doesnt exist"
    }
    
    end {
        Write-Information "This is the end code block"
    }
}

function get-scoop-script {
    if ($args) {
        if (test-path -Path "~/scoop/apps/$args") {
            Write-Output "Found ~/scoop/apps/$args"
            Write-Output "Getting file contents of $(get-command -CommandType ExternalScript "$args.ps1")"
            get-content -Raw $(Get-Command -CommandType ExternalScript "$args.ps1").Source
        }
        else {
            write-error "Application not located in scoop directory"
            Write-Error "$MyInvocation.MyCommand.Definition"
        }
    }
    else {
        Write-Error "You did not write an argument"
        Write-Error "Usage: get-scoop-script `"name-of-script`""
    }
}

function get-scoop-shim {
    if ($args) {
        if (test-path -Path "~/scoop/shims/$args.ps1") {
            Write-Information "Getting script source for `"$args`""
            Get-Content -Encoding UTF-8 $(Get-Command -Name "$args.ps1" -CommandType ExternalScript).Source
        }
        else {
            Write-Error -Message "Script name of $args.ps1 not found in ~/scoop/shims subdirectory"
        }
        else {
            write-error "You need to write an argument to this function"
            Write-Output "Usage: get-scoop-shim `"name-of-shim`""
        }
    }
}
