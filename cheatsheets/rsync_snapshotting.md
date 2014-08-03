
# rsync snapshotting
Using --link-dest, one can use rsync to create snapshots of a directory.
The 'current' directory and the date stamped directory will always be synced to the source,
(and hard linked between them), but older date stamped directories will keep the copied of files which were changed.


Backup and create a hard-link-based snapshot: (remove the --dry-run)
```
time rsync -Phavy --delete-after src/ trgt/current/ --dry-run
T=`date +"%y%m%d_%H%M%S"`
time rsync -Phavy --delete-after src/ trgt/$T/ --link-dest=../current --dry-run
```

create a hard-link copy of a full directory with rsync:
```
rsync -Phavy dir1/ dir2/ --link-dest=../dir1/
#same with pax:
pax -rwl dir1 /tmp/ && mv /tmp/dir1 dir2 #as long as . and /tmp are on the same fs!
```
