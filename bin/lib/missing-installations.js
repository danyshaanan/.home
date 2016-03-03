#!/usr/bin/env node

'use strict'

const pms = [
  {
    name: 'brew',
    list: 'brew list',
    installWith: 'brew install ',
    getRequirements: lines => {
      return lines.reduce((installations, line) => {
        line.split(' ').forEach(word => {
          if (word[0] === '-') installations[installations.length - 1] += ' ' + word
          else if (!~['brew', 'install'].indexOf(word)) installations.push(word)
        })
        return installations
      }, [])
    }
  },
  {
    name: 'brew-cask',
    list: 'brew cask list',
    installWith: 'brew cask install ',
    getRequirements: lines => {
      return lines.reduce((installations, line) => {
        let lineEnd
        line.split(' ').forEach(word => {
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
    getRequirements: lines => {
      return lines.reduce((installations, line) => {
        return installations.concat(line.split(' ').filter(word => !~['npm', 'i', '-g'].indexOf(word)))
      }, [])
    }
  },
  {
    name: 'apm',
    list: 'apm list',
    installWith: 'apm install ',
    getRequirements: lines => {
      return lines.reduce((installations, line) => {
        return installations.concat(line.split(' ').filter(word => !~['apm', 'install'].indexOf(word)))
      }, [])
    }
  }
]

// /////////////////////////////////////////////////////////////////////////////

function promiseExec(command) {
  return new Promise((resolve, reject) => {
    require('child_process').exec(command, {maxBuffer: 1024 * 1024 * 5}, (error, stdout, stderr) => {
      ;(error || stderr) ? reject(error || stderr) : resolve(stdout)
    })
  })
}

function missingReq(installed, req) {
  return installed.every(inst => req.replace(/.*\//, '').replace(/ .*/, '') !== inst.replace(/.* /, '').replace(/@.*/, ''))
}

let lines = require('fs').readFileSync(__dirname + '/../../README.md').toString().split('\n')

const i = lines.indexOf('### Main installations')
const j = lines.indexOf('### More installations')
lines = lines.slice(i, j)

let listFailure = () => {
  console.log(require('chalk').yellow('Missing installations:'))
  process.on('exit', () => process.exit(1))
  listFailure = () => {}
}

pms.forEach(function(pm) {
  pm.lines = lines.filter(line => line.indexOf(pm.installWith) === 0)
  promiseExec(pm.list)
    .then(output => output.split('\n').filter(Boolean))
    .then(installed => pm.getRequirements(pm.lines).filter(missingReq.bind(null, installed)))
    .then(missing => {
      missing.forEach(module => {
        listFailure()
        console.log(`${pm.name} install ${module}`)
      })
    })
    .catch(e => {
      throw e
    })
})
