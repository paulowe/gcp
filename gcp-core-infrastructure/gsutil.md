[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/snapshots.md)

## gsutil

```gsutil mb -l us gs://bucketname```

#### Copy file from Cloud Shell to Cloud Storage

```gsutil cp [MY_FILE] gs://[BUCKET_NAME]```

To make this environment variable permanent, you can add it to the root's .profile by running this command: 

```echo YOUR_BUCKET_NAME=$YOUR_BUCKET_NAME >> ~/.profile```
