#!/usr/bin/env pwsh
<#PSScriptInfo

.VERSION 0.0.1

.GUID 2adff9a1-03fb-4c77-934a-7ef8410162ee

.AUTHOR Carl Capodice

.COMPANYNAME Carl C

.COPYRIGHT Carl Capodice

.TAGS personal projects filesystem info

.LICENSEURI

.PROJECTURI https://github.com/awsomesawce/scripts-pwsh

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<# 

.DESCRIPTION 
 Hashtable containing information about projects stored on this computer. 

#> 
Param()

$projects = @{
    oneDrive = @{
        utilFuncs = (Get-Item "D:\Carl\OneDrive\snippets\pwsh\utilFuncs\")
    }
    git = @{
        scriptsPwsh = (Get-item "$env:USERPROFILE/gitstuff/scripts-pwsh")
    }
}
