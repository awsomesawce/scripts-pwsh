#!/usr/bin/env -S pwsh -nop
# Require the sha.ps1 file to be sourced

param([string]$value)

. ./sha.ps1
return createHash -value $value

