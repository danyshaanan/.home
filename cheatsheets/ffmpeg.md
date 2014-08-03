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
ffmpeg -ss 60 -t 5 -i source.mp4 -sameq source_60_to_65.mp4
#convert wav to mp3:
ffmpeg -i output.wav -sameq output.mp3

#rotate cw:
ffmpeg -i input.mp4 -vf "transpose=1" output.mp4 #2 for ccw
#flip vertically:
ffmpeg -i input.mp4 -vf vflip output.mp4 # hflip for horizontally
```
