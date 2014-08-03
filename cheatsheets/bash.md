
## bash
```bash
#sudo last command:
sudo !!
#replace once in last commange:
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
