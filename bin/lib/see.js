#!/usr/bin/env node
'use strict'

const fs = require('fs')
const cp = require('child_process')

const dir = process.cwd()
const filter = f => ['png', 'jpg', 'jpeg', 'gif'].includes(f.split('.').pop().toLowerCase())
const img = f => `<a href=${dir}/${f}><img src=${dir}/${f} height=200/></a>`
const get = (p, t) => fs.writeFileSync(p, t) + cp.exec(`open ${p}`)

cp.exec('echo $TMPDIR', (e, r) => {
  get(`${r.trim()}${Date.now()}.htm`, fs.readdirSync(dir).filter(filter).map(img).join(`\n`))
})
