
# find

```bash
# All in current dir:
find .

# All that match *.bmp:
find / -name *.bmp
# ...insensitive:
find / -iname *.bMp
# ...by max depth:
find / -name *.json -maxdepth 2
# ...hidden:
find . -type f -name '.*'
# ...1M or bigger:
find . -size +1M

# By permissions:
find . \! -perm 644 -type f
find . \! -perm 644 -type f -exec chmod 644 {} \;
find . \! -perm 755 -type d
find . \! -perm 755 -type d -exec chmod 755 {} \;
```
