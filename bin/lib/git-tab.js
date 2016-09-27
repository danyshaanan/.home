#!/usr/bin/env node

'use strict'

const x = 'git config --get remote.`git remote | head -1`.url'

require('child_process').exec(x, (e, remote, err) => {
  if (e || err) throw new Error(e || err)
  const match = remote.match(/:[^\/]+\/(.+)\.git/)
  const repo = match && match[1]
  const x = `\x1B]0;${repo}\x07`
  console.log(x)
})
