#!/usr/bin/env node

'use strict'

var exec = require('child_process').exec
var validDateRegex = /\d{4}:\d{2}:\d{2} \d{2}:\d{2}:\d{2}/

// Promises:

function promiseExec(command, rejectValue, resolveValue) {
  return new Promise(function(resolve, reject) {
    exec(command, function(error, stdout, stderr) {
      (error || stderr) ? reject(rejectValue || error || stderr) : resolve(resolveValue || stdout)
    })
  })
}

function checkBrewBinExists(name, installName) {
  return promiseExec('which ' + name, 'please install ' + (installName || name))
}

function extractExifData(file) {
  return promiseExec('identify -format %[EXIF:DateTimeOriginal] "' + file + '"')
}

function rename(oldName, newName) {
  return promiseExec('mv "' + oldName + '" "' + newName + '"', null, newName)
}

function renameFileByDate(file, date) {
  if (validDateRegex.test(date)) {
    return rename(file, getNewName(file, date))
  } else {
    console.log('file\'s date not valid (' + file + ')')
  }
}



function renameFiles(files) {
  var done = 0
  var start = Date.now()
  var outputStatus = function(oldName, newName) {
    // done++
    if (!newName) return
    // var averageTime = (Date.now() - start) / 1000 / done
    // var timeLeft = averageTime * (files.length - done)
    // console.log(done + '/' + files.length + ' | ' + Math.ceil(timeLeft) + 's | ' + oldName + ' -> ' + newName)
    console.log(oldName + ' -> ' + newName)
  }
  return files.reduce(function(prev, file) {
    return prev
      .then(extractExifData.bind(null, file))
      .then(renameFileByDate.bind(null, file))
      .then(outputStatus.bind(null, file))
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
