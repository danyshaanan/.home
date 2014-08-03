
# Various commands
Mostly linux

##streamer
```bash
#Take a few camera shots over a second from /dev/video0:
streamer -c /dev/video0 -t 9 -r 9 -o ~/.webcam/webcam_`date +"\%Y\%m\%d_\%H\%M\%S"`-00.jpeg
#since at first the camera is not adjusted, the first pictures will be darker.
```

##sensors
```bash
echo `sensors|grep -oe '+\([0-9]*.[0-9]\).C '`
##hddtemp:
sudo hddtemp /dev/sd?
##fdupes:
fdupes -rnS . | tee fdupes.txt
fdupes -rnS . >> fdupes.txt && grep -e "[0-9]\{7,\} byte" -A 3 fdupes.txt
```

##sox
```bash
#reverse a wav:
sox -V audio.wav reveresed.wav reverse
```

##vlc
```bash
#stream in the input of /dev/video0:
vlc v4l2:///dev/video0
```

##unrar
```bash
#open password protected rar:
unrar e -pPASSWORD archive.rar
```

##rename
```bash
rename 's/-([0-9])\./-0$1\./' *.png && ll
```

##rotate screen \ reflect
```bash
xrandr -o inverted # / normal / left / right
xrandr -x # / -y
```

##Cron
```bash
#user cronjob as an alarm clock:
30 8 * * 1-5 TODO
```

##find and convert bmp files
(should be a one liner)
```bash
find . -name '*bmp'
#cd whatever
mogrify -format png *bmp && rm -f *bmp
```
