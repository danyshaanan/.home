
# http://apple.stackexchange.com/questions/106589/write-in-ntfs-using-mavericks
brew update
brew install osxfuse
brew install ntfs-3g
sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.orig
sudo ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs
brew info osxfuse
#run the two command lines outputed by last command, starting with "sudo /bin/cp" and "sudo chmod"

