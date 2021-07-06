## Mount Persistent disk to VM file system

Create the disk's root directory. -p means create minecraft directory and any other parent directories if necessary

```
sudo mkdir -p /home/minecraft
```

Format the disk

```
sudo mkfs.ext4 -F -E lazy_itable_init=0,\
lazy_journal_init=0,discard \
/dev/disk/by-id/google-minecraft-disk

```

Mount the disk

```
sudo mount -o discard,defaults /dev/disk/by-id/google-minecraft-disk /home/minecraft
```
