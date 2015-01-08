
# bash

## General

```bash
#sudo last command:
sudo !!
#replace once in last command:
^foo^bar
#replace a few times in last command?
!!:gs/foo/bar
#empty file:
> file.txt
#chain:
(sleep 3 && ls &) ; (sleep 2 && ll &)
#forkbomb:
:(){:|:&};:
```

## Cron
```bash
#user cronjob as an alarm clock:
30 8 * * 1-5 echo "TODO: play audio"
```


## screen

Screen lets your create persistent terminal instances, which are not dependent on your SSH connection or on your terminal emulator.

```bash
# To open a new screen instance, use:
screen
# To open a new named screen instance, use:
screen -S myscreen
```

All screen commands start with `ctrl-a` followed by a key. For instance, to detach from a screen (while letting it run in the background) use `ctrl-a, d`.

In the same manner:
* `ctrl-a, c` - create another screen tab
* `ctrl-a, n` - move to the next screen tab
* `ctrl-a, backspace` - move to the previous screen tab

Back to the terminal:
```bash
# Reattach a detached screen:
screen -r
# If there is more than one, a list will show. Reattach with:
screen -r <id>
# Reattach the youngest screen (or open a new one if there aren't any) with:
screen -RR
```

More info at: http://www.bangmoney.org/presentations/screen.html
