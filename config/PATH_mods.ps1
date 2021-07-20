# Name: PATH_mods.ps1
# Description: This is a small file implementing certain aliases that act as
# a redirect to the proper command.
# This is especially useful when the same command is installed in multiple locations and you want to use
# a specific version.

set-alias -Name which -Value C:\Users\Carl\bin\which.exe -Description "Use the Windows version of which.  I uninstalled the Scoop version and unzipped the ezwinports version of which.exe into ~/bin"

if (Get-Item "D:\MSYS2\usr\bin" -ErrorAction SilentlyContinue) {
$msysbin = "D:\MSYS2\usr\bin"} else {Write-Error -Category ObjectNotFound -Message "Cannot find MSYS2 install dir, not setting `$msysbin"}
set-alias -Name msysbashalias -Value "$msysbin\bash.exe"

# Check for npm global prefix to be on $env:PATH:

function checkNPMPath {
<#
    .Description
    Adjusts/appends PATH so that globally installed npm packages are accessible from
    the command line.
    .NOTES
    Copied from Notable/notes/npm_append_path.ps1
    Also in ../ScriptsAndFunctions/npm_append_path.ps1
#>

    if ($env:PATH.Contains('npm')) {
        Write-Host -ForegroundColor Cyan "Success! ``npm`` global prefix is already in path!"
    }
    else {
        Write-Host -ForegroundColor Yellow "$(npm prefix -g) is not in `$env:PATH.  Attempting to append path"
        $env:PATH = "$(npm prefix -g);$env:PATH"
        ($env:PATH.Contains('npm')) ? (Write-Host -ForegroundColor Cyan "Success!  Appended path with npm global prefix") : (Write-Error -Category InvalidOperation -Message "Unsuccessful attempt at appending PATH with npm global prefix.")
    }
}
checkNPMPath

# TODO: How to get rid of a PATH entry before loading wsl:
# TLDR: I ended up installing nodejs to WSL using the default way.
# Here's the situation:
# I'm trying to reinstall nodejs on my Ubuntu WSL distro because nvm was giving me issues.
# I decided to use [n](https://www.npmjs.com/package/n) instead.
# I'm using the [n-install](curl -L https://git.io/n-install) script for installing `n` in an easy way and _without having
#+ Nodejs installed on your system.
# The problem is that the script fails if you have nodejs on your path,
# and Ubuntu was importing my Windows PATH which had npm and nodejs in them.
# So in order to fully isolate my Windows nodejs installation, I have to remove the PATH entry on 
#+ Ubuntu.
# Basically I have to write a function that automatically adjusts the PATH before invoking wsl.
# I'm going to try and do this from inside wslFunctions.ps1 instead of here.
