
# Graphics

## imagemagick
```bash
#Take a screenshot:
import -display :0.0 -window root ~/imagemagic_screen_`date +"%Y%m%d_%H%M%S"`.png
#change filetype / rename to sequance: (good for ffmpeg)
convert *.png eggscan-%03d.jpg
#average image:
convert -average *png average.png
#clean sketches:
mogrify -resize 10% -level 0%,80%,1 -rotate 180 -negate -alpha Copy -negate wawawawa.png
#combine images:
convert c1x*.jpg +append l1.jpg  #horizontally
convert c2x*.jpg +append l2.jpg	#horizontally
convert l*.jpg   -append e.jpg	#vertically
#create animated gif:
convert -delay 33 -loop 0 source_*.jpg result.gif #keep source files numbers consecutive
```

### Find and convert bmp files
```bash
mdfind *.bmp
#cd whatever
mogrify -format png *.bmp && rm -f *.bmp
```


## ffmpeg
```bash
#convert avi to mpg:
ffmpeg -i video.avi -sameq video.mpg
#concatenate two or move videos to one:
cat vid1.mpg vid2.mpg | ffmpeg -i - -sameq result.mpg
#create a vid from a sequence of images:
ffmpeg -r 24 -b 3600 -i %04d.jpg test3600.mp4
#convert an mp3 for ios:
ffmpeg -i file.mp3 file.m4a && mv file.m4a file.m4r
#cut a part of a video:
ffmpeg -ss 00:02:49 -t 00:00:18 -i input.mp4 -qscale 0 output.mp4
#create webm out of mp4:
ffmpeg -i input.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis output.webm
#convert wav to mp3:
ffmpeg -i output.wav -sameq output.mp3

#rotate cw:
ffmpeg -i input.mp4 -vf "transpose=1" output.mp4 #2 for ccw
#flip vertically:
ffmpeg -i input.mp4 -vf vflip output.mp4 # hflip for horizontally
```


## Cut and convert video to gif
Convert video segment to gif.
requires ffmpeg and imagemagick.

```bash
# cut video:
ffmpeg -ss 783 -t 18 -i source.mp4 -sameq cut.mp4

# convert segment video to frames
ffmpeg -i cut.mp4 frame%04d.gif

# create animated gif
convert -delay 1 -loop 0 frame*.gif anim.gif
# or with reverse
convert frame*.gif -set delay 1 -reverse frame*.gif -set delay 1 -loop 0 anim_with_reverse.gif

# remove 66 from bottom and top
convert anim_with_reverse.gif -shave 0x66 anim_with_reverse_cropped.gif
# or crop height to 410 starting at 66
convert anim_with_reverse.gif -crop x410+0+66 +repage anim_with_reverse_cropped.gif
```
