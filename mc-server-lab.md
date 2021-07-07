[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/images.md)

# Advanced Compute Engine Configuration and Server Management Techniques

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

Create a virtual terminal screen to start the application server.

To avoid your application server being tied to the life of your SSH session (that is, if you close your SSH terminal, the server is also terminated) you can use ```screen```, an application that allows you to create a virtual terminal that can be "detached," becoming a background process, or "reattached," becoming a foreground process. When a virtual terminal is detached to the background, it will run whether you are logged in or not.

```
sudo apt-get install -y screen
```

To **start your application server in a screen virtual terminal**, run the following command: (Use the -S flag to name your terminal mcs)

```
sudo screen -S mcs java -Xmx1024M -Xms1024M -jar server.jar nogui
```

**To detatch** and keep server running -> **CTRL+A ; CTRL+D**

**To reattach** ``` sudo screen -r mcs```

[your-instance-external-ip] to test connectivity

## Scheduling Backups

Backing up your application data is a common activity. 

Configure the system to back up a single persistent disk to Cloud Storage.

1. Create Cloud storage bucket
``` gsutil mb -l us gs://[globally-unique-bucket-name]```

2. Create a backup script

```
#!/bin/bash
screen -r mcs -X stuff '/save-all\n/save-off\n'
/usr/bin/gsutil cp -R {Path-to-root-backup-folder} gs://${YOUR_BUCKET_NAME}/$(date "+%Y%m%d-%H%M%S")-backup
screen -r mcs -X stuff '/save-on\n'
```
Save script

```sudo chmod 755 /home/minecraft/backup.sh``` chmod 755 gives Execute permissions to the shell script 

Automate backups with cronjob


```
sudo crontab -e
0 */4 * * * /home/minecraft/backup.sh
``` 
This command opens a new crontable and instructs cron to run the shell script every 4 hours.

This creates about 300 backups a month in Cloud Storage, so you will want to regularly delete them to avoid charges. Cloud Storage offers the Object Lifecycle Management feature to set a Time to Live (TTL) for objects, archive older versions of objects, or "downgrade" storage classes of objects to help manage costs

# Automate server maintenance
Edit instance custom metadata to include

[startup-script-url](https://storage.googleapis.com/cloud-training/archinfra/mcserver/startup.sh)

[shutdown-script-url](https://storage.googleapis.com/cloud-training/archinfra/mcserver/shutdown.sh)

**Summary of lab :**  you created a customized virtual machine instance by installing base software (a headless JRE) and application software (a Minecraft game server). You customized the VM by attaching and preparing a high-speed SSD data disk, and you reserved a static external IP so the address would remain consistent. Then you verified availability of the gaming server online. You set up a backup system to back up the server's data to a Cloud Storage bucket, and you tested the backup system. Then you automated backups using cron. Finally, you set up maintenance scripts using metadata for graceful startup and shutdown of the server.
