
# Various commands

##unrar
```bash
#open password protected rar:
unrar e -pPASSWORD archive.rar
```

##rename
```bash
rename 's/-([0-9])\./-0$1\./' *.png && ll
```

##Cron
```bash
#user cronjob as an alarm clock:
30 8 * * 1-5 echo "TODO: play audio"
```

##find and convert bmp files
(should be a one liner)
```bash
mdfind *.bmp
#cd whatever
mogrify -format png *.bmp && rm -f *.bmp
```
