#!/usr/bin/env node

'use strict'

const exec = require('child_process').exec
const validDateRegex = /\d{4}:\d{2}:\d{2} \d{2}:\d{2}:\d{2}/

// Promises:

function promiseExec(command, rejectValue, resolveValue) {
  return new Promise((resolve, reject) => {
    exec(command, (error, stdout, stderr) => {
      (error || stderr) ? reject(rejectValue || error || stderr) : resolve(resolveValue || stdout)
    })
  })
}

function checkBrewBinExists(name, installName) {
  return promiseExec(`which ${name}`, `please install ${installName || name}`)
}

function extractExifData(file) {
  return promiseExec(`identify -format %[EXIF:DateTimeOriginal] "${file}"`)
}

function rename(oldName, newName) {
  return promiseExec(`mv "${oldName}" "${newName}"`, null, newName)
}

function renameFileByDate(file, date) {
  if (validDateRegex.test(date)) {
    return rename(file, getNewName(file, date))
  } else {
    console.log(`file's date not valid (${file})`)
  }
}

function renameFiles(files) {
  let done = 0
  const start = Date.now()
  const outputStatus = (oldName, newName) => {
    done++
    newName && console.log([
      `${done}/${files.length}`,
      parseTime((Date.now() - start) / 1000 / done * (files.length - done)),
      `${oldName} -> ${newName}`
    ].join(' | '))
  }
  return files.reduce(
    (prev, file) => prev
      .then(extractExifData.bind(null, file))
      .then(renameFileByDate.bind(null, file))
      .then(outputStatus.bind(null, file)),
    Promise.resolve())
}

// Not Promises:

function parseTime(s) {
  return [60, 60, Infinity].map(max => {
    const t = Math.floor(s % max)
    s /= 60
    return t < 10 ? `0${t}` : t
  }).reverse().join(':')
}

function shouldRename(file) {
  if (/___/.test(file)) console.log(`Skipping file: ${file} (already renamed)`)
  else if (!/.jpe?g$/i.test(file)) console.log(`Skipping file: ${file} (invalid type)`)
  else return true
}

function insertBeforeBaseName(insert, path) {
  return path.replace(/^(.*\/)?([^\/]+\.jpe?g)$/i, `$1${insert}$2`)
}

function makeDateSafeFilename(date) {
  return date.replace(/:/g, '.').replace(/ /g, '-')
}

function getNewName(file, res) {
  return insertBeforeBaseName(`${makeDateSafeFilename(res)}___`, file)
}

Promise.all([
  checkBrewBinExists('identify', 'imagemagick'),
  checkBrewBinExists('rename')
])
  .then(() => process.argv.slice(2).filter(shouldRename))
  .then(renameFiles)
  .catch(error => { console.log('Error!', error) })
