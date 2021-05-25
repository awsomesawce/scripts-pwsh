# A list of variables that point to project directories
# Use `gf` in vim to goto the file at point.
# TODO: add second script for sourcing functions
# Author: Carl C (awsomesawce@outlook.com)
# Date: Mar 28, 2021

# UPDATE: Monday, May 10, 2021 7:05:44 PM
# TODO: This is getting pretty big and variables are getting redundent.

# First, set the variable to this script.
# TODO: Get this variable from $PSScriptRoot
Set-Variable -Name projectVarsScript -Value "C:\Users\Carl\gitstuff\scripts-pwsh\config\projectvars.ps1" -Description "Variable pointing to the script."
# NOTE: Ignore warnings based on method of setting pwsh variables.
# BEGIN Added Mar 29, 2021
$gitstuffC = Get-Item "$env:USERPROFILE\gitstuff"
$env:myDotfiles = Get-Item "$gitstuffC\my-dotfiles" # Exported this variable to environment
$myDotfiles = $env:myDotfiles
# END Added Mar 29, 2021
$Local:scriptspwshDir = "$gitstuffC\scripts-pwsh"
$script:configDir = "$Local:scriptspwshDir/config"

# Get the location of the git-tracket pwsh profile and put it in a variable.
# Just get the string.
Set-Variable -Name profileGitTracked -Value "$Script:configDir/Microsoft.PowerShell_profile.ps1"

# Then, set the rest of the current project variables.
set-variable -Name labscurrent -Value "~/Downloads/labs-node/labs-jan-5-2021/labs" -Description "Current labs"

# NOTE: This is a demonstration on how to create a environment variable using Set-Item.
# NOTE: Set-Variable only refers to the scope of the Powershell session, and doesn't share vars with other processes.
Set-Item -Path Env:\UserProfileD -Value (Get-Item "D:\Carl") # This is a variable that leads to my D drive user profile.

Set-Variable -Name GitDirectoryD -Value $UserProfileD\Documents\GitHub -Description "Main directory for github hosted projects"

Set-Variable -Name nodeschool -Value "D:\Carl\Documents\GitHub\node-school\" -Description "node-school directory"

Set-Variable -Name nodewebpackproj -Value "D:\Carl\Documents\GitHub\my-webpack-demo" -Description "My webpack demo git dir"

Set-Variable -Name pwshSnippetsFile -Value "D:\Carl\OneDrive\snippets\pwsh\powershell_snippets.txt" -Description "out-file for writing quick powershell snippets from the command line"
Set-Variable -Name pwshSnippetsDir -Value (Split-Path -Parent "$pwshSnippetsFile")

Set-Variable -Name NVIMINITVIM -Value C:\Users\Carl\AppData\Local\nvim\init.vim -Description "Main config file for neovim"
Set-Variable -Name DESKTOP -Value $env:OneDrive\Desktop\ -Description "Shortcut to the Desktop folder"
Set-Variable -Name randomnotes -Value $env:OneDrive\TODO\randomoutput.md -Description "A place to pipe output from pwsh"

function nodesch {set-location $nodeschool}

# UPDATE: Added EDITOR and PAGER declarations to main $PROFILE
#$env:EDITOR = "vim" # EDITOR variable to use when invoking unix-like programs.
#$env:PAGER = "less" # PAGER variable used by a ton of unix-like programs.
Write-Output "Variables have been imported from $PSScriptRoot\projectvars.ps1"
Set-Variable -Name cyghome -Value "D:\Cygwin\home\Carl" -Description "Set an env variable for this next time"

($profile -clike "*Microsoft*") ? ("Default powershell profile " + $PROFILE + " loaded") : ("Powershell profile does not contain `"Microsoft`"")
# Add variable for perlcbin installed from scoop
$perlcbin = Get-item $env:USERPROFILE\scoop\apps\perl\current\c\bin\
$binDirs = "$env:OneDrive\Desktop", "$env:USERPROFILE\bin", "D:\Carl\bin"
# Add perlbin variable on 04/08/2021 17:26:03.
$perlbin = "C:\Users\Carl\scoop\apps\perl\current\perl\bin"
function listBinDirs {
  Write-Output "This will list all the bin directories and optionally their contents."
  Write-Output "`$binDirs is an array"
  Write-Output "`$binDirs = $binDirs"
  Write-Output "`$perlcbin = $perlcbin"
  # IN-PROGRESS: Add more directories to these variables.
  Write-Output "`$perlbin = $perlbin"
}

# Common Spelling mistakes
set-alias -Name dotent -Value dotnet -Description "Start dotnet on spelling error"
set-alias -Name get-hlep -Value get-help -Description "Spelling error correction"
$snippets = "$env:OneDrive\snippets"

# Mon May  3 20:21:31 EDT 2021 Remove cygwininstaller variables

$barebonesDir = "D:\Carl\OneDrive\snippets\pwsh\barebones\"
$barebonesFunctionScript = Get-Item "D:\Carl\OneDrive\snippets\pwsh\barebones\barebones_Functions.ps1"

# TODO: Put this function in a _misc_functions.ps1 file or something.

function open-abs-guide {
$local:abslocation = "C:\Users\Carl\Downloads\info\abs-guide\"
if (test-path "$abslocation") {
invoke-item "$abslocation/index.html"
} else {
echo "the location of abs-guide is not found"
}
return "Opening abs guide"
}
# The above function is personal to my computer so I put it in projectVars.ps1 instead of other_functions.ps1
set-alias absguide -Value open-abs-guide -Description "Advanced bash scripting guide"
$msysZshExe = "D:\MSYS2\usr\bin\zsh.exe"
set-variable documents -Value "D:\Carl\Documents" -Description "Documents folder that explorer points to.  Powershell folder is also in this folder"
$dotfileDirs = (Get-Item D:\Carl\OneDrive\dotfiles_backup\), (Get-Item C:\Users\Carl\gitstuff\my-dotfiles\)
$zshlovers = get-item D:\Carl\OneDrive\snippets\bash\zsh-only\zsh-lovers-manpage.html
$curSnipFile = Get-Item D:\Carl\OneDrive\snippets\pwsh\powershell_learning_new.ps1
$editorconfigtemplate = "C:\Users\Carl\gitstuff\my-dotfiles\templates\template.editorconfig"
# Don't use `Get-Item` for ddownloads.
$env:ddownloads = "D:\Carl\Downloads\"
$ddownloads = $env:ddownloads

# List of current document directories for writings:
$newestDocumentDirs = @{
    Name = "List of New Document Dirs"
    NameOfHashTable = "`$newestDocumentDirs"
    NotableNotes="$env:OneDrive\Notable\notes"
    MDBook= Get-Item ~/gitstuff/mdbook_test
    bashSnippets = Get-item "$env:OneDrive\snippets\bash"
    pwshSnippets = "$pwshSnippetsDir"
    OneDriveDocuments = "$env:OneDrive\Documents"
    DESKTOP = "$env:OneDrive\Desktop"
    CurrentSnippetFile = "$curSnipFile"
    Downloads = @{
        CDownloads = Get-Item "~/Downloads"
        DDownloads = "$ddownloads"
    }
    UsefulVars = @("`$documents", "`$zshlovers", "`$editorconfigtemplate", "`$dotfileDirs")
}
# functions are allowed in this file as long as they relate to project variables.
# NOTE: It might be better to offload certain functions as a script file. 
# NOTE: Functions are sourced and are executed from memory while the PSSession is active.
# NOTE: Powershell Scripts, however, are executed from the filesystem.
function ListDocumentDirs {
    if ($args) {
        write-error "This function does not need args.
        Try again."
    } else {
        Write-Output "List of new Document Dirs:"
        Write-Output $newestDocumentDirs
    }
}
# TODO: Shorten this script and make it so it is not so big.
# IMPORTANT: this is the preferred way of naming project variables.  Be specific.
$windowsDotfilesBackup = "$($dotfileDirs[0])windows"
# TODO: backupDirs and dotfileDirs are very similar, might just remove one.
$backupDirs = @{
# This is a list of backup directories relating to shell config
    tarfiles="D:\Carl\OneDrive\tarfiles\configstuff"
    dotfiles_backup="$env:OneDrive\dotfiles_backup"
    windows_dotfiles_backup="$windowsDotfilesBackup"

}
# This is the simplest function for listing powershell notes in my Notable
#+ directory.
function listPowershellNotes {
    Get-Childitem "$env:OneDrive\Notable\notes\Powershell*"
}
