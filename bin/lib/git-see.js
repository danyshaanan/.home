#!/usr/bin/env node

'use strict'

const path = require('path')
const cp = require('child_process')

const open = url => cp.spawn(require('os').type() === 'Darwin' ? 'open' : 'xdg-open', [url])
const parseTargetUrl = o => `https://${o.site}/${o.user}/${o.repo}/${o.blobOrTree}/${o.branch}/${o.pathInRepo}`
const promiseExec = line => new Promise((resolve, reject) => {
  cp.exec(line, (e, out, err) => (e || err) ? reject(e || err) : resolve(out.trim()))
})

const filePath = process.argv[2]
const commands = ['git config --get remote.`git remote -v | grep github | tail -1 | awk \'{print $1;}\'`.url', 'git rev-parse --show-toplevel', 'git rev-parse --abbrev-ref HEAD']

Promise.all(commands.map(promiseExec))
  .then(results => {
    const remote = results[0].match(/(github\.com)[:\/]([^\/]+)\/(.+?)(\.git)?$/)
    const url = parseTargetUrl({
      site: remote[1],
      user: remote[2],
      repo: remote[3],
      blobOrTree: require('fs').lstatSync(filePath || '.').isFile() ? 'blob' : 'tree',
      branch: results[2],
      pathInRepo: path.relative(results[1], path.join(process.cwd(), filePath || '.'))
    })
    console.log(url)
    open(url)
  })
  .catch(e => console.log(e.message, e.stack))
