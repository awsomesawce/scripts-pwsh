##### Other PS Functions #####
# Please add functions to this file instead of the main powershell profile.
# Author: Carl C. (awsomesawce@github.com)
# Updated: Monday, May 24, 2021 6:30:53 AM
# Note: Added `param()` to multiple functions.


## Aliases for common Cmdlets
# These aliases aren't defined by default, but they are quite useful.
#
Set-Alias cfjs -Value ConvertFrom-Json -Description "Convertfrom json in 4 letters"
Set-Alias c2json -Value Convertto-Json -Description "Different from ConvertFrom-Json by 2 letters"
Set-Alias add -Value Add-Content -Description "An alias for Add-Content that just makes sense."
Set-Alias -Name "sob" -Value "Select-Object" -Description "A shorter select"
Set-Alias ghlp -Value Get-Help -Description "A short get-help"
Set-Alias -Name "hlp" -Value "Help" -Description "An even shorter help.  One less letter."
#
# TODO: Create a function for viewing Get-Help output in a pager.
# UPDATE: Function isn't needed.  Powershell 7 detects the
# $env:PAGER variable which was set in the profile.  If it has `less` as the PAGER,
# then using `Help` will then use `less` as it's pager program.
# This will allow you to go up or down when viewing the documentation.
#
# Aliases for common external commands and programs, like Git
# INFO: In powershell, Aliases can generally have no arguments.  If you want to add arguments to an alias
# you need to write a function first.
#
Set-Alias -Name g -Value git -Description "Git in one letter"
Function GitStatusFunc { git status }
set-alias -Name gitst -Value GitStatusFunc -Description "Gets git status in one command."
Set-Alias -Name l -Value Get-ChildItem -Description "List items in directory in one letter"
Set-Alias -Name np -Value notepad.exe -Description "A simple way to open notepad"
Function Open-Node-Docs { Start-Process https://nodejs.org/dist/latest-v14.x/docs/api/ }
Set-Alias -Name nodedocs -Value Open-Node-Docs -Description "Open NodeJS docs in a browser"

## Other useful functions

# Next up is editor functions!
# Neovim config shortcut # remember to use backslashes.
$nvimInitFile = "$env:LOCALAPPDATA\nvim\init.vim"
function gotonvimconfig { set-location $localAppData\nvim }
function nvimconfig {
    if (Get-Command nvim -ErrorAction Ignore) {
	nvim $nvimInitFile
    } else {
	Write-Error -category NotInstalled "You must have nvim installed on your system."
    }
}


# TODO: test this function for starting a powershell process as Admin.
# EXPERIMENTAL: Function below is experimental.
#function Start-PSAdmin {Start-Process pwsh -Verb RunAs}
# C
function Start-wtAdminn {
    if (Get-Command wt -erroraction ignore) {
	Start-Process wt -Verb RunAs
    } else {
	Write-Error -Category NotInstalled "Windows Terminal is not installed on your system"
    }
}

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
function duks { Start-Process https://duckduckgo.com/?q=$args }
# The above implements what Ive been trying to do for a long time
# Search from the command line!
function kaku { wsl -u carlc kak "$args" }
function gitpushsync { git add . && git commit -m "$args" && git pull && git push }
function gitpp { git pull && git push }

# The following block is copied from barebones_Functions.ps1
# barebones_Functions.ps1
# Author: Carl C (awsomesawce@outlook.com)
# These are functions that are very helpful but don't require a lot of setup.
# This is normally sourced by `barebones_pwsh_profile.ps1` and not by itself.
#
# psWhich is a function that mimicks the output of the `which` unix command.
function psWhich { Get-Command $args | Select-Object -ExpandProperty Source }
# duks allows the user to search from the command line.
function duks { Start-Process https://duckduckgo.com/?q=$args }
# gotoexelocation is a nice command that allows you to chdir right to the directory where 
# the executable is located.  Pretty neat, huh?
function gotoexelocation {
  Set-Location (Split-Path -Parent (get-command $args | Select-Object -ExpandProperty Source))
}
Set-Alias -Name ExeLocation -Value gotoexelocation -Description "Shorter gotoexelocation"
function gotoNotesDir { set-location $env:OneDrive\Notable\notes }
Set-Alias -Name ndir -Value gotoNotesDir -Description "Created alias to short command, function has longer name"
<#
# The following command is EXPERIMENTAL
#
#>
function getcommandinfo {
  # This is a test to see how splatting works.
  # The $selProps var contains properties that the command should show.
  $Local:selProps = @("name", "commandtype", "source")
  Get-Command -Name @args | Select-Object -Property $Local:selProps
  Write-Information "This is a test"
}
# End-of-block from barebones_Functions.ps1


# Let the user know that this file was sourced
Write-Output "other_functions file has been loaded from here: $otherFunctionsScript"
# This function allows for searching apt-cache database from powershell
# TODO: separate the wsl-specific functions into its own file.
#       Modules are easier to maintain.
#### Source WSL-Functions Script
$scrps = "~/gitstuff/scripts-pwsh"
$wslFuncs = "$scrps\config\wslFunctions.ps1"

if (Test-Path $wslFuncs) {
    Write-Verbose "Sourcing wslFunctions.ps1 script"
    . $wslFuncs
} else {
    Write-Error "$wslFuncs file not found"
}

# TODO: reorganize variables

# BEGIN File-System functions {{{

# Some nice functions for listing items and sorting them
function list-bigfiles {
    param([int]$Len)
    # if user enters length, show files greater than that length.
    if ($Len) {
	get-childitem | where-object -Property length -gt $Len | sort-object -property Length -Decending
    } else {
	get-childitem | where-object -Property length -gt 10000 | sort-object -property Length -Decending
    }
}
set-alias lsbig list-bigfiles -description "Shorter way to list big files"
function list-hugefiles {
  get-childitem | where-object -Property length -gt 100000 | Sort-Object -Property Length -Descending | write-output
}
Set-Alias lshuge -Value list-hugefiles -Description "Shorter way to list huge files"

# END File System Functions }}}

# TODO: fix the following two functions
#set-alias -Name hjson -Value "$PWD\hjson.cmd" -Description "Set hjson alias so that it references the npm binary instead of the scoop binary, which itself i believe is based on Python"
#set-alias -Name hjson-js -Value "$PWD\hjson.cmd" -Description "Alias for npms hjson which makes it more clear which binary it links to"
set-alias cygfind -Value "D:\Cygwin\bin\find.exe" -Description "Use a better find than the windows version, Cygwin version."
# Committo-Git already in different file.
# This function goes to the parent directory of the named file.
# Useful for going to the directory of a variable pointing to a file.
# Try `cdto-filelocation $PROFILE`
function Set-filelocation {
    param([string]$Path)
  if (Test-Path $Path) {
    set-location (Split-Path -parent "$Path")
  }
  else {
    write-Error "That particular file name has not been found."
  }
}

# This function is the same as the one above, but shorter and with no else statement.
# It also uses `$args` as opposed to the `$Path` positional parameter.
function cdfile { 
    # Added if statement for handling args
    if ($args) {
        Set-Location (Split-path -Parent $args) 
    } else {
        Write-Error "Need an arg to this function."
    }
}
# cdfile function allows cding to the parent directory of the named file
# The above function works just like chtsh function in bash.
function pschtsh {
    param([string]$SearchTerm)
    if ($SearchTerm) {
      Invoke-webrequest -Uri "https://cht.sh/$SearchTerm" | select-object -expandProperty content
    } else {
      Write-Error "Need search term"
    }
}
# To invoke, type "pschtsh term_to_lookup"
# Pipe to a file using `Out-File`

# The function below starts the MSYS2 version of Zsh in place from the host terminal.
# Useful for opening MSYS's zsh _inside_ a modern terminal like Windows Terminal.
# You need to adjust zshrc in order for it to work with msys pathnames instead of cygwin pathnames.
function start-MSYS-zsh {
  $script:zshx = "D:\MSYS2\usr\bin\zsh.exe"
  if (Test-Path "$script:zshx") {
    Write-Output "starting msys zsh"
    invoke-expression "$script:zshx -l -i"
  }
  else {
    Write-Error "cannot find msys zsh"
  }
}

# Here is the replacement for msys-bash function
function start-msys-bash {
  # if the variable is set, start bash
  # if not, don't start and write an error.
  if ($msysbin) {
    write-output "`$msysbin set, starting bash"
    invoke-expression "$msysbin\bash.exe -l -i"
  }
  else {
    write-error "`$msysbin not set or cannot find $msysbin\bash.exe"
    write-error "Make sure the proper values are set"
  }
}

# Wsl-functions moved to .\wslFunctions.ps1

# This function starts windows terminal in Admin mode
function start-wtAdmin {
  if (Get-Command wt -errorAction Ignore) {
    Start-Process wt -Verb runAs
  }
  else {
    write-error "Windows Terminal executable not found"
  }
}
function gotofile {
  # This function allows cding to the location of a file
  # TODO: Add help message
  param([string]$File)
  if ($File) {
    Set-Location $(split-path -Parent "$File")
  }
  else {
    Write-Output "Usage: gotofile FILE"
  }
}

set-alias -Name nvim-qt -Value nvim-qt.ps1 -Description "Always point to nvim-qt.ps1, so the console is not hung up"
# Source choco_functions script
# TODO: Put this function inside the actual $PROFILE rather than source from here.

# better-chtsh: a better cheatsheet script
# Use this instead of cheatsheet for better functionality like error-handling aka argument handling
# TODO: more testing required
function better-chtsh {
    <#
    .Description
    better-chtsh: a better cheatsheet script
    .Notes
    Adding a `$Page parameter soon.
    #>
    param([string]$SearchTerm, [switch]$UseCurl)
    if (($SearchTerm) -and ($UseCurl)) {
	curl "https://cht.sh/$SearchTerm"
    } elseif ($SearchTerm) {
	Invoke-RestMethod -Method Get -Uri "https://cht.sh/$SearchTerm"
    } else {
	write-error "This function requires an argument to look up a term on cht.sh"
    }
}

Set-Alias -Name chtsh -Value better-chtsh -Description "Using a new function for chtsh"
function pschtshPage {
    if ($args) {
        Invoke-WebRequest -Uri "https://cht.sh/$args" | Select-Object -ExpandProperty Content | less -r
    } else {
        write-error "Usage: command needs an argument to function"
        return
    }
}
# The above pschtshPage function is the same as the previous chtsh command, but it will
# page the output thru less instead.

function groffunc {
    if ((Get-Command groff -ErrorAction ignore) -and ($args)) {
        groff -man -T utf8 "$args"
    } else {
        Write-Error "Either groff is not available or you typed no args.
        Type in the path of the manpage you want to convert"
    }
}
set-alias p6d -Value "C:\Users\Carl\scoop\apps\rakudo-star\current\share\perl6\site\bin\p6doc.bat" -Description "perl6 documentation tool"
set-alias tar -Value tar.ps1 -Description "Makes sure to reference the updated tar program"

# This function sorts files by write time.
function Sort-ByWriteTime {
(Get-Childitem | sort -Property LastWriteTime)
}
