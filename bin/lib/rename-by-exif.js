#!/usr/bin/env node

'use strict'

var exec = require('child_process').exec
var exifDataRegex = /exif\:DateTimeOriginal\:\W+(\d{4}:\d{2}:\d{2} \d{2}:\d{2}:\d{2})\W+/

// Promises:

function promiseExec(command, rejectValue) {
  return new Promise(function(resolve, reject) {
    exec(command, function(error, stdout, stderr) {
      (error || stderr) ? reject(rejectValue || error || stderr) : resolve(stdout)
    })
  })
}

function checkBrewBinExists(name, installName) {
  return promiseExec('which ' + name, 'please install ' + (installName || name))
}

function extractExifData(file) {
  return promiseExec('identify -verbose ' + file)
}

function rename(oldName, newName) {
  console.log(oldName + ' -> ' + newName)
  return promiseExec('mv ' + oldName + ' ' + newName)
}

function renameFileByExif(file, exifData) {
  var match = exifData.match(exifDataRegex)
  if (match && match[1]) {
    return rename(file, getNewName(file, match[1]))
  } else {
    console.log('no exifData found for file ' + file)
  }
}

function renameFiles(files) {
  return files.reduce(function(prev, file) {
    return prev
      .then(extractExifData.bind(null, file))
      .then(renameFileByExif.bind(null, file))
  }, Promise.resolve())
}

// Not Promises:

function shouldRename(file) {
  if            (/___/.test(file)) console.log('Skipping file: ' + file + ' (already renamed)')
  else if (!/.jpe?g$/i.test(file)) console.log('Skipping file: ' + file + ' (invalid type)')
  else return true
}

function insertBeforeBaseName(insert, path) {
  return path.replace(/^(.*\/)?([^\/]+\.jpe?g)$/i,'$1' + insert + '$2')
}

function makeDateSafeFilename(date) {
  return date.replace(/:/g, '.').replace(/ /g, '-')
}

function getNewName(file, res) {
  return insertBeforeBaseName(makeDateSafeFilename(res) + '___', file)
}

//////////////////////////////////////////////////

Promise.all([
    checkBrewBinExists('identify', 'imagemagick'),
    checkBrewBinExists('rename'),
  ])
  .then(function() {
    return process.argv.slice(2).filter(shouldRename)
  })
  .then(renameFiles)
  .catch(function(error) { console.log('Error!', error) })





//
