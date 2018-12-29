#!/usr/bin/env node
'use strict'

const exec = command => require('child_process').execSync(command).toString()
const log = text => console.log(`${new Date()}: ${text}`)
const parsePing = output => ({
    loss: +output.match(/\b([0-9\.]+)% packet loss/)[1] / 100,
    averagePing: +output.match(/([0-9\.]+)\/\b([0-9\.]+)\/([0-9\.]+)\/([0-9\.]+)\b/).slice(1)[1]
})

const states = [
    { name: 'off', condition: ping => !ping },
    // { name: 'dead', condition: ping => ping.loss > .5 },
    // { name: 'flaky', condition: ping => ping.loss },
    { name: 'bad', condition: ping => ping.loss || ping.averagePing > 500 },
    // { name: 'slow', condition: ping => ping.averagePing > 1000 },
    { name: 'ok', condition: ping => ping.averagePing > 250 },
    { name: 'good', condition: () => true }
]

let current, ping

const check = _ => {
    try {
        ping = parsePing(exec(`ping -qc 10 8.8.8.8`))
    } catch(e) {
        ping = false
    }
    const state = states.find(s => s.condition(ping)).name
    if (current !== state) exec(`say connection is ${current = state}`)
    log(current)
    setTimeout(check, 5 * 60 * 1000)
}

check()

