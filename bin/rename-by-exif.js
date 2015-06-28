#!/usr/bin/env node

'use strict'

var child_process = require('child_process')

// Prime Promises:

function resolved() {
  return new Promise(function(r){r()})
}

function checkBrewBinExists(name, installName) {
  return new Promise(function(resolve, reject) {
    child_process.exec('which ' + name, function(error, stdout, stderr) {
      error ? reject('please install ' + installName || name) : resolve()
    })
  })
}

function extractExifData(file) {
  return new Promise(function(resolve, reject) {
    child_process.exec('identify -verbose ' + file, function(error, stdout, stderr) {
      (error || stderr) ? reject(error || stderr) : resolve(stdout)
    })
  })
}

function rename(oldName, newName) {
  return new Promise(function(resolve, reject) {
    child_process.exec('mv ' + oldName + ' ' + newName, function(error, stdout, stderr) {
      error ? reject(error) : resolve(console.log(oldName + ' -> ' + newName))
    })
  })
}

// Composite Promises:

function renameFileByExif(file, exifData) {
  var match = exifData.match(/exif\:DateTimeOriginal\:(.*)/)
  var res = match && match[1].trim()
  if (!res) {
    console.log('no exifData found for file ' + file)
  } else if (!/\d{4}:\d{2}:\d{2} \d{2}:\d{2}:\d{2}/.test(res)) {
    console.log('exifData has wrong format for file ' + file)
  } else {
    return rename(file, getNewName(file, res))
  }
}

function renameFiles(files) {
  return files.reduce(function(prev, file) {
    return prev
      .then(extractExifData.bind(null, file))
      .then(renameFileByExif.bind(null, file))
  }, resolved())
}

// Not Promises:

function shouldRename(file) {
  if            (/___/.test(file)) console.log('Skipping file: ' + file + ' (already renamed)')
  else if (!/.jpe?g$/i.test(file)) console.log('Skipping file: ' + file + ' (invalid type)')
  else return true
}

function getNewName(file, res) {
  var date = res.replace(/:/g, '-').replace(/ /g, '.')
  return file.replace(/^(.*\/)?([^\/]+\.jpe?g)$/i,'$1' + date + '___$2')
}

//////////////////////////////////////////////////

var setup = resolved()
  .then(checkBrewBinExists.bind(null, 'identify', 'imagemagick'))
  .then(checkBrewBinExists.bind(null, 'rename'))
  .then(renameFiles.bind(null, process.argv.slice(2).filter(shouldRename)))
  .catch(function(error) { console.log('Error!', error) })





//
