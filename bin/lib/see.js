#!/usr/bin/env node
'use strict'

const { exec } = require('child_process')
const { lstatSync, readdirSync, writeFileSync } = require('fs')

const tree = p => ({ path: p, children: lstatSync(p).isDirectory() && readdirSync(p).map(c => tree(`${p}/${c}`)) })
const get = (p, t) => writeFileSync(p, t) + exec(`open ${p}`)

const html = `
<body style='font-family: monospace; margin-bottom: 1000px;'>
<div id=list></div><hr/>
<div id=grid></div><hr/>
</body>

<script>
'use strict'
const tree = ${JSON.stringify(tree(process.cwd()))}

const isDir = node => node.children
const isImage = node => !isDir(node) && /\.(jpe?g|png|gif)$/i.test(node.path)
const dir = node => '<a onClick=set("PATH")>PATH</a><br/>'.replace(/PATH/g, node.path)
const img = node => '<a href=PATH><img src="PATH" height=200/></a>'.replace(/PATH/g, node.path)

const dictionary = {}
const list = document.getElementById('list')
const set = path => document.getElementById('grid').innerHTML = dictionary[path]

const add = node => {
  dictionary[node.path] = node.children.filter(isImage).map(img).join(' ')
  if (dictionary[node.path]) list.innerHTML += dir(node)
  node.children.filter(isDir).forEach(add)
}

add(tree)
document.querySelector('a').click()

</script>
`

exec('echo $TMPDIR', (e, r) => get(`${r.trim()}viewer.${Date.now()}.htm`, html))



// console.log(JSON.stringify(tree(dir), 0, 2))
// console.log(tree(dir))
