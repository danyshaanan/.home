
# Amazon web services

## Adding a volume to an Amazon ec2 instance

* Go to https://console.aws.amazon.com/ec2/
* Under 'Volumes' add a new volume and attach it to an instance.
* In the instance:

```bash
lsblk # and see the new volume. Lets assume "xxx"
sudo file -s /dev/xxx # will show 'data' for unformatted volumes
sudo mkfs -t ext4 /dev/xxx
sudo mkdir /media/xxxDrive
sudo mount /dev/xxx /media/xxxDrive
sudo cp /etc/fstab /etc/fstab.orig
sudo echo "/dev/xxx /media/xxxDrive ext4 defaults 0 0" >> /etc/fstab
sudo mount -a # if this returns an error, better 'sudo cp /etc/fstab.orig /etc/fstab'
```
