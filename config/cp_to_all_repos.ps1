#!/usr/bin/env pwsh
# Copies init.vim to all config repos including
# dotfiles_backup, gitstuff/my-dotfiles

$oneDrive = "D:\Carl\OneDrive"
$destOne = "$oneDrive\dotfiles_backup\windows\nvim"
$destTwo = "$HOME\gitstuff\my-dotfiles\windows\nvim"

$copyAllPreference = "$false"

if ($copyAllPreference = "$false") {
    Write-Output "Copying init.vim to other repos."
    Copy-Item -Path ./init.vim -Destination "$destone" -Confirm
    Copy-Item -Path ./init.vim -Destination "$desttwo" -Confirm
} else {
    Write-Output "Copying all items in this directory to repos"
    # TODO
}
