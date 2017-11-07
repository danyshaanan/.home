
### Fixing old txt/html files with bad hebrew encoding

```bash
file -I x.txt

brew install moreutils

iconv -f hebrew -t UTF-8 x.txt
iconv -f hebrew -t UTF-8 x.txt | sponge x.txt

for i in `command ls`; do iconv -f hebrew -t UTF-8 $i | sponge $i; done
```
