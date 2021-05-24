#!/usr/bin/env pwsh
# Author: Carl C
# Date: 5/7/2021
# Description: A collection of homemade git functions for easier command-line experience.

# This example is an advanced example.
# TODO: INPROGRESS
function Committo-Git {
    <#
    .Syntax
    Committo-Git ["message"]
    .Description
    Committo-Git: Commits to git with an optional message from command line.
    .PARAMETER Msg
    The commit message.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false,
            HelpMessage = "Optional commit message")]
        [Alias("gcomm")]
        [String]$Msg
    )
    Begin {
        if (Get-Command git -ErrorAction ignore) {
            Write-Verbose "git executable found"
            $gitprog = $true
        } else {
            Write-Error "git executable not found"
        }
    }
    
    Process {
        if ($gitprog) {
            git commit -m "$Msg"
        } else {
            Write-Error "Git executable has not been found"
        }
    }
}

# Here is an example of a very simple function:
# BEGIN Unnecessary Functions: {{{
function Get-SmallFiles {
      Param($Size)
      Get-ChildItem $HOME | Where-Object {
        $_.Length -lt $Size -and !$_.PSIsContainer
      }
    }
# END Unnecessary functions }}}


function Committo-GitSimple {
    # Parameter declarations
    param ([string]$msg)
    if (Get-Command git -CommandType Application -ErrorAction Ignore) {
        if (!($msg)) {
            git commit
        } else {
            git commit -m "$msg"
        }
    } else {
        Write-Error "Git executable not found."
        return
    }
}
