
# var

## Translation and text to speech

Install:
```bash
brew install mpg123
npm i -g normit
```

Translate:
```bash
normit en es "hello, how are you?"
=> hola cómo estás?
```

Speak:
```bash
normit en es "hello, how are you?" -t
=> hola cómo estás?
normit en en "hello, how are you?" -t
=> hello, how are you?
```

Git prepare-commit-msg hook for tranlation your commit messages:
```js
#!/usr/bin/env node

var COMMIT_EDITMSG_FILE = '.git/COMMIT_EDITMSG'
var command = 'normit en es `cat ' + COMMIT_EDITMSG_FILE + '` > ' + COMMIT_EDITMSG_FILE
require('child_process').exec(command, function (error, stdout, stderr) {})
```

Git prepare-commit-msg hook for reading your commit messages:
```js
#!/usr/bin/env node

var COMMIT_EDITMSG_FILE = '.git/COMMIT_EDITMSG'
var command = 'normit en en `cat ' + COMMIT_EDITMSG_FILE + '` -t'
require('child_process').exec(command, function (error, stdout, stderr) {})
```
