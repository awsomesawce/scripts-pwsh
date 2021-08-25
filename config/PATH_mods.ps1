# Name: PATH_mods.ps1
# Description: This is a small file implementing certain aliases that act as
# a redirect to the proper command.
# This is especially useful when the same command is installed in multiple locations and you want to use
# a specific version.

### XDG_CONFIG_HOME ###
# The environment variable below sets XDG_CONFIG_HOME, which then tells nvim to look for it's
# init file in that directory instead of AppData/local/nvim
# That is bad, we have no configuration in ~/.config.
# If you want to start nvim without having any config, set the $env:XDG_CONFIG_HOME variable.
#$env:XDG_CONFIG_HOME="C:\Users\Carl\.config"

set-alias -Name which -Value C:\Users\Carl\bin\which.exe -Description "Use the Windows version of which.  I uninstalled the Scoop version and unzipped the ezwinports version of which.exe into ~/bin"
# TODO: Get rid of `which.exe` and just alias psWhich to which

if (Get-Item "D:\MSYS2\usr\bin" -ErrorAction SilentlyContinue) {
$msysbin = "D:\MSYS2\usr\bin"
} else {
    Write-Error -Category ObjectNotFound -Message "Cannot find MSYS2 install dir, not setting `$msysbin"}
set-alias -Name msysbashalias -Value "$msysbin\bash.exe"

# Check for npm global prefix to be on $env:PATH:

function checkNPMPath {
<#
    .Description
    Adjusts PATH so that $env:APPDATA\npm is first in line.
    .NOTES
    Copied from Notable/notes/npm_append_path.ps1
    Also in ../ScriptsAndFunctions/npm_append_path.ps1
    TODO: Make cross platform code
#>

    if ($env:Path.Split(';')[0].contains('npm')) {
        Write-Host -ForegroundColor Cyan "Success! ``npm`` global prefix is first in path!"
    }
    else {
        Write-Host -ForegroundColor Yellow "$env:APPDATA\npm is not first in `$env:PATH.  Attempting to append path"
        $env:PATH = "$env:APPDATA\npm;$env:PATH"
        ($env:Path.Split(';')[0].contains('npm')) ? (Write-Host -ForegroundColor Cyan "Success!  Appended path with npm global prefix") : (Write-Error -Category InvalidOperation -Message "Unsuccessful attempt at appending PATH with npm global prefix.")
    }
}
checkNPMPath

