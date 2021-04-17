# This file will start msys's version of bash
# OriginalLocation: "$env:USERPROFILE\bin"
$Script:msysbin="D:\MSYS2\usr\bin"
# TODO: add this env to msys2's bashrc or bash_profile
#$Script:ENV='export PATH=$HOME/bin:$HOME/scoop/shims:$PATH'
if (test-path "$Script:msysbin") {
    write-host "`$Script:msysbin is set"
    write-host "invoking msys bash with -l and -i options"
    invoke-expression "$Script:msysbin/bash -l -i"
} else {
    write-error "`$Script:msysbin is not set or is not there"
    write-error "Not starting msys bash"
}

