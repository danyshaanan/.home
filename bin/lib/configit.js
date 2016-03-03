#!/usr/bin/env node
/* eslint brace-style:0 */
'use strict'

const p = (deps => {
  try { return deps.reduce((o, r) => (o[r] = require(r), o), {}) }
  catch(e) { throw new Error('Missing dependencies!') }
})(['os', 'fs', 'ini', 'lodash', 'chalk'])

const _ = p.lodash

function getIni(path) {
  return p.ini.parse(p.fs.readFileSync(path, 'utf-8'))
}

const expected = getIni(__dirname + '/../../gitconfig')
const actual = getIni(p.os.homedir() + '/.gitconfig')
const diff = {}

_.forIn(expected, (section, sectionName) => {
  _.forIn(section, (expectedValue, key) => {
    if (_.get(actual, [sectionName, key]) !== expectedValue) {
      _.set(diff, [sectionName, key], expectedValue)
    }
  })
})

if (_.isEmpty(diff)) {
  console.log(p.chalk.green('~/.gitconfig up to date!'))
} else {
  console.log(p.chalk.yellow('--------- Missing values in ~/.gitconfig ---------'))
  console.log(p.ini.stringify(diff, { whitespace: true }).trim())
  console.log(p.chalk.yellow('--------------------------------------------------'))
  process.exit(1)
}
