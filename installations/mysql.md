# MySQL
On OSX


### Install mysql
```bash
brew install mysql
mysql.server start
mysql -uroot
```

### Create database
```
CREATE DATABASE dbname;
exit
```

### Dump something inside
```bash
mysql -uroot dbname < dbname.mysql
```
