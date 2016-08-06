#!/usr/bin/env node

'use strict'

const [ROWS, COLUMNS] = [process.stdout.rows, process.stdout.columns >> 1]
const N = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [-1, 1], [1, -1], [-1, -1]]

const mda = (f, d, ...D) => d ? [...Array(d)].map(_ => mda(f, ...D)) : f()

const alive = (num, state) => num === 3 || num === 2 && state
const get = (g, r, c) => g[(r + ROWS) % ROWS][(c + COLUMNS) % COLUMNS]
const count = (g, r, c) => N.filter(n => get(g, r + n[0], c + n[1])).length
const next = (g, r, c) => alive(count(g, r, c), g[r][c])
const iterate = g => g.map((l, r) => l.map((v, c) => next(g, r, c)))

const str = v => v ? '\u001b[47m  \u001b[49m' : '  '
const print = g => console.log(g.map(l => l.map(str).join('')).join('\n'))

let grid = mda(_ => Math.random() < 0.5, ROWS, COLUMNS)
setInterval(_ => print(grid = iterate(grid)), 100)
