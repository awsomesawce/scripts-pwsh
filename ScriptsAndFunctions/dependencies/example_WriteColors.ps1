# Source WriteColors as script dependency.
# Had to use `return` inside the child scope functions.

. ./WriteColors.ps1

echoCyan "This is cyan"

echoYellow "This is yellow"

echoRed "This should be red"

echoCyan "$(get-Date)"

echoDarkBlue "This should be dark blue"

echoDarkCyan "this should be dark cyan"

echoDarkYellow "this should be dark yellow"

echoDarkYellow "$($MyInvocation.MyCommand) is the name of this command."

echoMagenta "This should be in magenta color"

#echoMagenta

echoMagenta "It is working!  Yay! :smiley:"
