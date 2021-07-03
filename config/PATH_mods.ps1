# Name: PATH_mods.ps1
# Description: This is a small file implementing certain aliases that act as
# a redirect to the proper command.
# This is especially useful when the same command is installed in multiple locations and you want to use
# a specific version.
# For instance, I have the program `which.exe` installed in 3 places: "D:\Cygwin\bin\which.exe", "D:\MSYS2\usr\bin\which.exe",
# and "$env:USERPROFILE\bin\which.exe".
# I want to use the `which` command located in "$env:USERPROFILE\bin\which.exe" because it is a 
# _Windows_ port of the famous `which` command, which means it will print _Windows_
# paths by default.

# NOTES: Why do this?
# I originally had installed `which` by way of `scoop install which` and this worked out fine, 
# but the version that `scoop` has in their database is part of gnuwin which is an aging project.
# There is a way to get the same results by using a Powershell function, but I want to be able to 
# use this `which` command no matter what shell I'm using, whether it be cmd.exe or Powershell.

set-alias -Name which -Value C:\Users\Carl\bin\which.exe -Description "Use the Windows version of which.  I uninstalled the Scoop version and unzipped the ezwinports version of which.exe into ~/bin"

$Script:msysbin = "D:\MSYS2\usr\bin"
set-alias -Name msysbashalias -Value "$msysbin\bash.exe"

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
