#!/usr/bin/env node

'use strict'

var pms = [
  {
    name: 'brew',
    list: 'brew list',
    installWith: 'brew install ',
    getRequirements: function(lines) {
      return lines.reduce(function(installations, line) {
        line.split(' ').forEach(function(word) {
          if (word[0] === '-') installations[installations.length - 1] += ' ' + word
          else if (!~['brew', 'install'].indexOf(word)) installations.push(word)
        })
        return installations
      }, [])
    }
  },
  {
    name: 'brew-cask',
    list: 'brew-cask list',
    installWith: 'brew cask install ',
    getRequirements: function(lines) {
      return lines.reduce(function(installations, line) {
        var lineEnd
        line.split(' ').forEach(function(word) {
          if (lineEnd) return
          else if (word[0] === '-') installations[installations.length - 1] += ' ' + word
          else if (word[0] === '#') lineEnd = true
          else if (!~['brew', 'cask', 'install'].indexOf(word)) installations.push(word)
        })
        return installations
      }, [])
    }
  },
  {
    name: 'npm',
    list: 'npm -g list',
    installWith: 'npm i -g ',
    getRequirements: function(lines) {
      return lines.reduce(function(installations, line) {
        return installations.concat(line.split(' ').filter(function(word) { return !~['npm', 'i', '-g'].indexOf(word) }))
      }, [])
    }
  },
  {
    name: 'apm',
    list: 'apm list',
    installWith: 'apm install ',
    getRequirements: function(lines) {
      return lines.reduce(function(installations, line) {
        return installations.concat(line.split(' ').filter(function(word) { return !~['apm', 'install'].indexOf(word) }))
      }, [])
    }
  }
]

// /////////////////////////////////////////////////////////////////////////////

function promiseExec(command) {
  return new Promise(function(resolve, reject) {
    require('child_process').exec(command, {maxBuffer: 1024 * 1024 * 5}, function(error, stdout, stderr) {
      ;(error || stderr) ? reject(error || stderr) : resolve(stdout)
    })
  })
}

function missingReq(installed, req) {
  return installed.every(function(inst) {
    return req.replace(/.*\//, '').replace(/ .*/, '') !== inst.replace(/.* /, '').replace(/@.*/, '')
  })
}

var lines = require('fs').readFileSync(__dirname + '/../../README.md').toString().split('\n')

var i = lines.indexOf('### Main installations')
var j = lines.indexOf('### More installations')
lines = lines.slice(i, j)

console.log('Missing installations:')

pms.forEach(function(pm) {
  pm.lines = lines.filter(function(line) { return line.indexOf(pm.installWith) === 0 })
  promiseExec(pm.list)
    .then(function(output) { return output.split('\n').filter(Boolean) })
    .then(function(installed) {
      return pm.getRequirements(pm.lines).filter(missingReq.bind(null, installed))
    })
    .then(function(missing) {
      console.log(pm.name + ': ' + (missing.length ? missing.join(', ') : '<NONE>'))
    })
    .catch(function(e) { console.log(e, e.stack) })
})
