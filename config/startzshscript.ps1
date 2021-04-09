# The function below starts the MSYS2 version of Zsh in place from the host terminal.
# Useful for opening MSYS's zsh _inside_ a modern terminal like Windows Terminal.
# You need to adjust zshrc in order for it to work with msys pathnames instead of cygwin pathnames.
function start-MSYS-zsh {
$function:zshx = "D:\MSYS2\usr\bin\zsh.exe"
if (Test-Path $function:zshx) {
invoke-expression "$function:zshx -l -i"
echo "starting msys zsh"
} else {
echo "cannot find msys zsh"
}
}
