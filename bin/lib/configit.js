#!/usr/bin/env node
'use strict'

const p = (deps => {
  try {
    return deps.reduce((o, r) => {
      o[r] = require(r)
      return o
    }, {})
  } catch (e) {
    throw new Error('Missing dependencies!')
  }
})(['os', 'fs', 'ini', 'chalk'])

function getIni(path) {
  return p.ini.parse(p.fs.readFileSync(path, 'utf-8'))
}

const expected = getIni(`${__dirname}/../../gitconfig`)
const actual = getIni(`${p.os.homedir()}/.gitconfig`)
const diff = {}
Object.keys(expected).forEach(sectionName => {
  const section = expected[sectionName]
  Object.keys(section).forEach(key => {
    const expectedValue = section[key]
    if (actual[sectionName] && actual[sectionName][key] !== expectedValue) {
      diff[sectionName] = diff[sectionName] || {}
      diff[sectionName][key] = expectedValue
    }
  })
})

if (Object.keys(diff).length === 0) {
  console.log(p.chalk.green('~/.gitconfig up to date!'))
} else {
  console.log(p.chalk.yellow('--------- Missing values in ~/.gitconfig ---------'))
  console.log(p.ini.stringify(diff, { whitespace: true }).trim())
  console.log(p.chalk.yellow('--------------------------------------------------'))
  process.exit(1)
}
