#!/usr/bin/env node
'use strict'

const scriptTemplate = `
repeat with _app in {"Firefox", "iTerm", "Finder"}
    try
        tell application _app
            repeat with x from 1 to (count windows)
                set the bounds of window x to {0, 0, WIDTH, HEIGHT}
            end repeat
        end tell
    end try
end repeat

tell application "Finder"
    get the name of every process whose visible is true
end tell
`

const getValue = l => +l.match(/= "?(-?\d+)"?;/)[1]
const exec = command => require('child_process').execSync(command).toString()
const runscript = script => exec(`osascript -e '${script}'`)
const screenAtts = [`DisplayID`, `OriginX`, `OriginY`, `Height`, `Width`]

const screens = exec(`defaults read /Library/Preferences/com.apple.windowserver.plist`)
    .split(`\n`).filter(l => /^.*=.*;$/.test(l)).reduce((o, l) => {
        if (l.includes(screenAtts[0])) o.unshift({})
        screenAtts.map(a => l.includes(` ` + a) && (o[0][a] = getValue(l)))
        return o
    }, [])

console.log(screens)
const { Width, Height } = screens.find(x => x.OriginX === 0 && x.OriginY === 0)
console.log(runscript(scriptTemplate.replace('WIDTH', Width).replace('HEIGHT', Height)))
