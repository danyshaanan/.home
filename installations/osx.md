
# OSX

### Switch the Finder icon in the Dock:

Icon by [Esxxi](http://esxxi.me/)

```bash
cp ~/.home/installations/assets/finder.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png
ls -l /private/var/folders/*/*/*/com.apple.dock.iconcache
rm /private/var/folders/*/*/*/com.apple.dock.iconcache
killall Dock
```
