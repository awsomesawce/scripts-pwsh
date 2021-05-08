#!/usr/bin/env pwsh
# Author: Carl C
# Date: 5/7/2021
# Description: A collection of homemade git functions for easier command-line experience.

# This example is an advanced example.
# TODO: finish this.
function Committo-Git {
    <#
    .Description
    Committo-Git: Commits to git
    .PARAMETER Msg
    The commit message.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false,
            HelpMessage = "Optional commit message")]
        [Alias("gcomm")]
        [String] $Msg
    )
    
    Process {
    }
}

# Here is an example of a very simple function:
function Get-SmallFiles {
      Param($Size)
      Get-ChildItem $HOME | Where-Object {
        $_.Length -lt $Size -and !$_.PSIsContainer
      }
    }

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
