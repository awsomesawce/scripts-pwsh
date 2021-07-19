#!/usr/bin/env bash
# gitpod test
# Shell scripting in gitpod seems super nice and efficient

basedir=/workspace/scripts-pwsh

if ! command -v pwsh > /dev/null; then
    echo "powershell unavailable"
    [ -e "$basedir/.misc_info" ] && cat "$basedir/.misc_info"
    exit 1
else
    echo "Powershell is available"
fi

if test -n "$BASH_VERSION"; then echo "You are in bash"; fi