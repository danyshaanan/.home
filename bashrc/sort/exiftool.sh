#alias range="exiftool -createdate  * | grep -o '\d\d\d\d:\d\d:\d\d' | sort | sed -e 1b -e '$!d'"
alias range="exiftool -createdate  * | grep -o '\d\d\d\d:\d\d:\d\d' | sort | uniq -c"

alias exi="exiftool -createdate"
alias ide="identify -format %[EXIF:DateTimeOriginal]"
