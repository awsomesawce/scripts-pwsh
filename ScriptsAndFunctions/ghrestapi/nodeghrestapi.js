const http = require('http')
const https = require('https')
const path = require('path')
const url = require('url')
const os = require('os')
const log = console.log
log(`hello and welcome to my node script`)
const myHome = os.homedir()
log(`myHome = ${myHome}`)
let myReq = req('http://api.github.com/user')


