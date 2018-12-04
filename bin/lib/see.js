#!/usr/bin/env node
'use strict'

const fs = require('fs')
const tree = p => ({ path: p, children: fs.lstatSync(p).isDirectory() && fs.readdirSync(p).map(c => tree(`${p}/${c}`)) })
const html = `${fs.readFileSync(`${__dirname}/see.htm`)}`.replace('tree', JSON.stringify(tree(process.cwd())))
const path = `${process.env.TMPDIR}viewer.${Date.now()}.htm`

fs.writeFileSync(path, html)
require('child_process').exec(`open ${path}`)
