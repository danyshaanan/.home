# Enable writing to ntfs on OSX


Adapted from [here](http://apple.stackexchange.com/questions/106589/write-in-ntfs-using-mavericks).
```bash
brew update
brew install osxfuse
brew install ntfs-3g
sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.orig
sudo ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs
brew info osxfuse
```
The last command will output two lines, starting with `sudo /bin/cp` and `sudo chmod`. Run those.
