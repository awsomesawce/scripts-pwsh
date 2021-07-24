$nodescr = @{
script = [scriptblock]::Create(@'
const log = console.log
const os = require('os')
const path = require('path')
const https = require('https')
log('this is a test script')
'@)
description = "Script block creation thru way of Powershell"
date = "$(get-date)"
nodeversion = $(node -p 'console.log(process.version)')
nodelocation = $(Get-Command node).Source
}
