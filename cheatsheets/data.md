
# Data

## rename
```bash
rename 's/-([0-9])\./-0$1\./' *.png && ll
```

## unrar
```bash
#open password protected rar:
unrar e -pPASSWORD archive.rar
```

## rsync snapshotting
Using --link-dest, one can use rsync to create snapshots of a directory.
The 'current' directory and the date stamped directory will always be synced to the source,
(and hard linked between them), but older date stamped directories will keep the copied of files which were changed.


Backup and create a hard-link-based snapshot: (remove the --dry-run)
```bash
time rsync -Phavy --delete-after src/ trgt/current/ --dry-run
T=`date +"%y%m%d_%H%M%S"`
time rsync -Phavy --delete-after src/ trgt/$T/ --link-dest=../current --dry-run
```

create a hard-link copy of a full directory with rsync:
```bash
rsync -Phavy dir1/ dir2/ --link-dest=../dir1/
#same with pax:
pax -rwl dir1 /tmp/ && mv /tmp/dir1 dir2 #as long as . and /tmp are on the same fs!
```


## Restoring deleted or formatted files
Mainly from FAT.* or NTFS file systems.

```
brew install ddrescue testdisk #OSX

# copy the drive to an image with ddrescue:
sudo dd_rescue /dev/hdc hdimage

#testdisk:
sudo photorec hdimage

#scalpel (only linux)
sudo vi /etc/scalpel/scalpel.conf #set file types
mkdir output
sudo scalpel hdimage -vo output
```

## Encryption

### Encrypted .dmg container
```bash
hdiutil create -size 10m -volname tenMegs -encryption AES-128 -fs "Journaled HFS+" -stdinpass 10m.dmg # Enter key
hdiutil attach 10m.dmg -mountpoint target -stdinpass #target need not exist
hdiutil detach target
```

### EncFS
```bash
brew install encfs
encfs `pwd`/.encrypted `pwd`/decrypted # directories need not exist, follow instructions
umount decrypted
```

### TrueCrypt
```bash
brew cask install truecrypt
truecrypt -t -c # follow instructions
truecrypt -t -k='' --protect-hidden=no 1g.tc dir
truecrypt -t -d dir
```

if a truecrypt volume creation fails, try to create one without a filesystem, and format it:
```bash
truecrypt --filesystem=none /path/to/file.tc
mkfs.ext3 /dev/mapper/truecryptx
```

### Encrypt/decrypt stuff with your RSA key pair

First, create a "pem" public key from your regular public key with:
```bash
openssl rsa -in ~/.ssh/id_rsa -pubout > ~/.ssh/id_rsa.pub.pem
```

Once you have that, encrypt with:
```bash
echo "secret123" | openssl rsautl -encrypt -pubin -inkey ~/.ssh/id_rsa.pub.pem > cypher.enc
```
...and decrypt with:
```bash
cat cypher.enc | openssl rsautl -decrypt -inkey ~/.ssh/id_rsa
```


## convert mdb to mysql with mdbtools

A slight veriation of these commands can be used to convert mdb files to mysql.
Tested on OSX, should work the same on Linux

```bash
#just for looks:
mdb-tables db_file.mdb
#get mdb schema:
mdb-schema db_file.mdb > db_file.temp.schema
#for each table:
mdb-export db_file.mdb table1 > db_file.temp.table1.csv
#create sql schema from db_file.temp.schema:
vi db_file.schema.sql
#create database with encoding:
mysql
```

```sql
CREATE DATABASE db_file DEFAULT CHARACTER SET utf8;
use db_file;
exit
```
```bash
#apply schema:
mysql db_file < db_file.schema.sql
#load data from csv files:
mysql
```
```mysql
LOAD DATA LOCAL INFILE 'db_file.temp.table1.csv' INTO TABLE db_file.table1 FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 LINES (list,of,table,names,as,defined,by,you,in,db_filedotschemadotsql);
exit
```
```
#backup:
mysqldump db_file > db_file.temp.sql
tar cvfz db_file.sql.tar.bz2 db_file.temp.sql
#clean files:
rm -f db_file.mdb db_file.temp.*
```
