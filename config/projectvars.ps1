# A list of variables that point to project directories
# NOT WORKING!  Use ./newProjVars.ps1 for now
# Author: Carl C (awsomesawce@outlook.com)
# Date: 8/29/2021

# NOTE: Use `gf` in vim to goto the file at point.

$global:projectvarsloaded = $true

# First, set the variable to this script.
# TODO: Get this variable from $PSScriptRoot
#Get-Item -Path $(join-path -Path $PSScriptRoot -ChildPath "./projectvars.ps1" | Set-Variable -Name "projectVarsScript" -Description "Testing piping to set-variable"

# NOTE: Ignore warnings based on method of setting pwsh variables.
# BEGIN Added Mar 29, 2021
$gitstuffC = Get-Item "$env:USERPROFILE\gitstuff"
$env:myDotfiles = Get-Item "$gitstuffC\my-dotfiles" # Exported this variable to environment
# END Added Mar 29, 2021
$Local:scriptspwshDir = "$gitstuffC\scripts-pwsh"
$script:configDir = "$Local:scriptspwshDir/config"

# Get the location of the git-tracked pwsh profile and put it in a variable.
# Just get the string.
Set-Variable -Name profileGitTracked -Value "$Script:configDir/Microsoft.PowerShell_profile.ps1"
# Then, set the rest of the current project variables.

# NOTE: This is a demonstration on how to create a environment variable using Set-Item.
$env:UserProfileD = (Get-Item "D:\Carl").FullName # String representation due to `.FullName` method
$UserProfileD = $env:UserProfileD
$ddocuments = (Get-Item "$UserProfileD/Documents").FullName

# TODO: Consolidate some important project vars into arrays or hash tables!  
#+ Great idea!

Set-Variable -Name GitDirectoryD -Value $UserProfileD\Documents\GitHub -Description "Main directory for github hosted projects"
Set-Variable -Name nodeschool -Value "D:\Carl\Documents\GitHub\node-school\" -Description "node-school directory"
# TODO: fix labscurrent variable
Set-Variable -Name NVIMINITVIM -Value C:\Users\Carl\AppData\Local\nvim\init.vim -Description "Main config file for neovim"
Set-Variable -Name DESKTOP -Value $env:OneDrive\Desktop\ -Description "Shortcut to the Desktop folder"

# This is a redo of the nodesch function that was previously here.
function Goto-NodeSchool {
    param([switch]$Labs)
    if (!($Labs)) {
	# This function only works in Powershell Core (ternary operators)
	(Test-Path $nodeschool) ? (Set-Location -Path $nodeschool) : (Write-Error -Category ResourceUnavailable -Message "$nodeschool not found")
    } else {
	return Write-Error -Category NotImplemented -Message "This part of the script will set location to where school labs are on the filesystem."
    }
}

# UPDATE: Added EDITOR and PAGER declarations to main $PROFILE
Set-Variable -Name cyghome -Value "D:\Cygwin\home\Carl" -Description "Set an env variable for this next time"

($profile -clike "*Microsoft*") ? ("Default powershell profile " + $PROFILE + " loaded") : ("Powershell profile does not contain `"Microsoft`"")
# Add variable for perlcbin installed from scoop
$perlcbin = Get-item $env:USERPROFILE\scoop\apps\perl\current\c\bin\
# Add variable that represents the most common bin dirs
$binDirs = @("$env:OneDrive\Desktop\bin", "$env:USERPROFILE\bin", "D:\Carl\bin")
# Add perlbin variable on 04/08/2021 17:26:03.
$perlbin = "C:\Users\Carl\scoop\apps\perl\current\perl\bin"

# Common Spelling mistakes
set-alias -Name dotent -Value dotnet -Description "Start dotnet on spelling error"
set-alias -Name get-hlep -Value get-help -Description "Spelling error correction"

$snippets = "$env:OneDrive\snippets"

# Set barebones profile variables for easy navigation.
$barebonesDir = "D:\Carl\OneDrive\snippets\pwsh\barebones\"
$barebonesFunctionScript = Get-Item "D:\Carl\OneDrive\snippets\pwsh\barebones\barebones_Functions.psm1" # notice psm1

# TODO: Put this function in a _misc_functions.ps1 file or something. :DONE:

# dotfileDirs now outputs the full name of the items in question.
$dotfileDirs = @((Get-Item D:\Carl\OneDrive\dotfiles_backup\).FullName, (Get-Item C:\Users\Carl\gitstuff\my-dotfiles\).FullName) # TODO: Hope that works.
$zshlovers = (get-item D:\Carl\OneDrive\snippets\bash\zsh-only\zsh-lovers-manpage.html).FullName
$curSnipFile = Get-Item D:\Carl\OneDrive\snippets\pwsh\powershell_learning_new.ps1
$editorconfigtemplate = "C:\Users\Carl\gitstuff\my-dotfiles\templates\template.editorconfig"
# Don't use `Get-Item` for ddownloads.


# functions are allowed in this file as long as they relate to project variables.

# This is the simplest function for listing powershell notes in my Notable
#+ directory.
function listPowershellNotes {
    if (Test-Path "$env:OneDrive\Notable\notes") {
	Get-Childitem "$env:OneDrive\Notable\notes\Powershell*"
    }
    if (Test-Path "$env:UserProfile\gitstuff\scripts-pwsh-wiki") {
	Get-ChildItem "$env:UserProfile\gitstuff\scripts-pwsh-wiki"
    }
    return $pwshNotes = @((Get-Childitem "$env:OneDrive\Notable\notes\Powershell*"), (gci "$env:UserProfile\gitstuff\scripts-pwsh-wiki"))
}

# TODO: Correct variable name from rememberfile to todo or todofile.
$nodedocs = "C:\Users\Carl\dumps\nodedocs\latest-fermium\api" # TODO: move nodedocs somewhere else (D:)
$templates = "C:\Users\Carl\gitstuff\my-dotfiles\templates\"
$pipxPath = "C:\Users\Carl\.local\bin\"

# Ubuntu home directory path
$UbuntuHome = "\\wsl$\Ubuntu-20.04\home\carlc"

function gotoPythonSnips {
<#
    .Description
    Simply goes to python snippets directory
#>
    $s = "$snippets/python"
    if (Test-Path $s) {
	cd $s
    }
    else {
	Write-Error "$s not found"
    }
}
# Set alias for sublime text, because it is not in path.
set-alias subl -Value "D:\Program Files\Sublime Text\subl.exe" -Description "Sublime text executable" -Option None
#$pytoolsdir = 'C:\Program Files\Python38\Tools' # Old Python tools dir

set-alias cptobackupdirs "C:\Users\Carl\gitstuff\scripts-pwsh\utils\cptobackupdirs.ps1"

# Moved ddocuments to beginning of script.
$documents = "$env:USERPROFILE/Documents"
$nodeclipkg = "D:\Carl\Documents\GitHub\node_cli_package"

$msbuild = "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\"
$dotnetDir = "C:\Program Files\dotnet\"

$pyscripts = "C:\Users\Carl\gitstuff\my-python-scripts" # Important
$hugodoc = "C:\Users\Carl\dumps\hugodoc" # Important
$basesnips = "D:\Carl\OneDrive\snippets\javascript"
$hugoposts = "C:\Users\Carl\gitstuff\husite\content\posts\"
$ddownloads = "D:\Carl\Downloads"
