# A list of variables that point to project directories
# Use `gf` in vim to goto the file at point.
# TODO: add second script for sourcing functions
# Author: Carl C (awsomesawce@outlook.com)

set-variable -Name labscurrent -Value "~/Downloads/labs-node/labs-jan-5-2021/labs" -Description "Current labs"

Set-Variable -Name nodeschool -Value "D:\Carl\Documents\GitHub\node-school\" -Description "node-school directory"

Set-Variable -Name nodewebpackproj -Value "D:\Carl\Documents\GitHub\my-webpack-demo" -Description "My webpack demo git dir"

Set-Variable -Name pwshsnippets -Value "D:\Carl\OneDrive\snippets\pwsh\powershell_snippets.txt" -Description "out-file for writing quick powershell snippets from the command line"

Set-Variable -Name NVIMINITVIM -Value C:\Users\Carl\AppData\Local\nvim\init.vim -Description "Main config file for neovim"
Set-Variable -Name DESKTOP -Value D:\Carl\OneDrive\Desktop\ -Description "Shortcut to the Desktop folder"
Set-Variable -Name randomoutput -Value D:\Carl\OneDrive\TODO\randomoutput.md -Description "A place to pipe output from pwsh"
Set-Variable -Name GitDirectoryD -Value D:\Carl\Documents\GitHub -Description "Main directory for github hosted projects"

function nodesch {set-location GitDirectoryD\node-school}

$env:EDITOR = "nvim" # EDITOR variable to use when invoking unix-like programs.
$env:PAGER = "less" # PAGER variable used by a ton of unix-like programs.
Write-Output "Variables have been imported from $PSScriptRoot\projectvars.ps1"
Set-Variable -Name cyghome -Value "D:\Cygwin\home\Carl" -Description "Set an env variable for this next time"
