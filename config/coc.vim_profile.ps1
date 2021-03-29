# Title: Coc.vim Powershell Profile
# Author: Carl C.
# Description: The profile that Coc.nvim uses when using its embedded terminal
# Use this file to test out `$PROFILE related stuff

# Basic Env Variables
$env:PAGER = "less" # This is bash's `export PAGER="less"` in pwsh form. 
$env:EDITOR = (Get-Command "nvim") # This is a test because some programs can't deal with objects.
