#!/usr/bin/env node

'use strict'

var seperator = '|||'

function promiseExec(command) {
  return new Promise(function(resolve, reject) {
    require('child_process').exec(command, {maxBuffer: 1024 * 1024 * 5}, function(error, stdout, stderr) {
      ;(error || stderr) ? reject(error || stderr) : resolve(stdout)
    })
  })
}

function logOutputToObjArray(output) {
  return output.split('\n').map(function lineToJson(line) {
    var parts = line.split(seperator)
    return { hash: parts[0], name: parts[1], mail: parts[2], date: parts[3], mssg: parts[4] }
  })
}

function createNightersDict(data) {
  return data
		.filter(function lateCommit(commit) { return new Date(commit.date).getHours() < 6 })
		.reduce(function(acc, commit) { return (acc[commit.mail] = (acc[commit.mail] || 0) + 1, acc) }, {})
}

function createNightersArray(nightersDict) {
  return Object.keys(nightersDict).map(function(key) { return { mail: key, count: nightersDict[key] } })
}

function printNightersArray(nightersArray) {
  nightersArray
    .sort(function(a, b) { return a.count < b.count ? 1 : -1 })
    .forEach(function(nighter) { console.log(nighter.count, nighter.mail) })
}

promiseExec('git --no-pager log --pretty=format:"' + ['%H', '%aN', '%ae', '%ad', '%s'].join(seperator) + '"')
	.then(logOutputToObjArray)
	.then(createNightersDict)
	.then(createNightersArray)
	.then(printNightersArray)
	.catch(function(e) {console.log(e)})
