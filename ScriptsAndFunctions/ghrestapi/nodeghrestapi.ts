import http

const req = require('http').request
const path = require('path')
const url = require('url')
const os = require('os')
const log = console.log
log(`hello and welcome to my node script`)
let myHome = os.homedir()
log(`myHome = ${myHome}`)
log(`${myUrl.href}`)
log(req(`http://api.github.com/user`))
