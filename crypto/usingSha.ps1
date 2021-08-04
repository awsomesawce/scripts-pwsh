#!/usr/bin/env -S pwsh -nop
# Require the sha.ps1 file to be sourced
. ./sha.ps1

param([string]$value)
return createHash -value $value

