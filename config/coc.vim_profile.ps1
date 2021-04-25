# Title: Coc.vim Powershell Profile
# Author: Carl C.
# Description: The profile that Coc.nvim uses when using its embedded terminal
# Use this file to test out `$PROFILE related stuff

# Basic Env Variables
$env:PAGER = "less" # This is bash's `export PAGER="less"` in pwsh form. 
$env:EDITOR = (Get-Command "nvim") # This is a test because some programs can't deal with objects.
set-variable -Name oneDrive -Value "$env:OneDrive" -Description "Easier access to the `$OneDrive variable" -Option AllScope
function myGitStatus {
if (test-path $(get-command -CommandType Application git).Source) {
echo "Getting git status"
git status
} else {
write-error "Git executable not found in path"
}
}
set-alias -Name gitst -Value myGitStatus -Description "Quick git status command"
set-alias -Name g -Value git -Description "Super short git command"
