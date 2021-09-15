#!/usr/bin/env pwsh

$projects = @{
    oneDrive = @{
        utilFuncs = (Get-Item "D:\Carl\OneDrive\snippets\pwsh\utilFuncs\")
    }
    git = @{
        scriptsPwsh = (Get-item "$env:USERPROFILE/gitstuff/scripts-pwsh")
    }
}
