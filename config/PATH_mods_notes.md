# PATH_mods notes

 TODO: How to get rid of a PATH entry before loading wsl:
 TLDR: I ended up installing nodejs to WSL using the default way.
 Here's the situation:
 I'm trying to reinstall nodejs on my Ubuntu WSL distro because nvm was giving me issues.
 I decided to use [n](https://www.npmjs.com/package/n) instead.
 I'm using the [n-install](curl -L https://git.io/n-install) script for installing `n` in an easy way and _without_ having
+ Nodejs installed on your system.
 The problem is that the script fails if you have nodejs on your path,
 and Ubuntu was importing my Windows PATH which had npm and nodejs in them.
 So in order to fully isolate my Windows nodejs installation, I have to remove the PATH entry on 
+ Ubuntu.
 Basically I have to write a function that automatically adjusts the PATH before invoking wsl.
 I'm going to try and do this from inside wslFunctions.ps1 instead of here.
