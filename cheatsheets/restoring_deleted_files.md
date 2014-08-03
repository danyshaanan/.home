
### Restoring deleted or formatted files, mainly from FAT.* or NTFS file systems.

```
sudo apt-get install ddrescue testdisk scalpel #Linux
#or
sudo brew install ddrescue testdisk #OSX

# copy the drive to an image with ddrescue:
sudo dd_rescue /dev/hdc hdimage

#testdisk:
sudo photorec hdimage

#scalpel (only linux)
sudo vi /etc/scalpel/scalpel.conf #set file types
mkdir output
sudo scalpel hdimage -vo output
```
