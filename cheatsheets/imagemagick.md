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
