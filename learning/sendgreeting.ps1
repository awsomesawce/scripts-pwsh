#!/usr/bin/env -S pwsh -noprofile
# This function serves as an example on how to write advanced functions.

function Send-Greeting {
  <#
    .Description
    Send-Greeting: Gets a greeting if name is supplied.
    .PARAMETER Name
    The name of the person you want to greet!
    #>
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $true,
      HelpMessage = "Enter your name to get a greeting!")]
    [Alias("greeting", "sendgreet")]
    [string] $Name
  )

  Process {
    Write-Output ("Hello " + $Name + "!")
  }
}
