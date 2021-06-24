## Cloud Shell

You can use the Cloud Shell to manage projects and resources via command line without having to install the Cloud SDK and other tools on your computer.

Cloud Shell provides the following
- Temporary Compute Engine VM
- Command line access to the instance via a browser
- 5GB of persistent disk storage ($HOME dir)
- Pre installed Cloud SDK and other tools
- gcloud: for working with the Compute Engine and many Google Cloud Services
- gsutil: for working with Cloud Storage
- kubectl: for working with Google Kubernetes Engine and Kubernetes
- bq: for working with BigQuery
- Language support for Java, Python, Node.js
- Web preview functionality
- Built in authorization for access to resources and instances

After 1 hour of inactivity Cloud Shell instances are recycled. Only the /home directory persists. Any changes made to the system config, including environment variables are lost betweeen sessions

## Easily manage your Cloud Shell environment variables

In the cloud shell cli, you can do the following 

```
mkdir project1Env

touch project1Env/config

echo REGION=northamerica-northeast1-a >> project1Env/config

PROJECTID=$DEVSHELL_PROJECT_ID >> project1Env/config

source project1Env/config

```

If this file is in the /home dir, then it will persist and whenever you return to your Cloud Shell you can quickly set up your environment

To avoid always activating your environment using the ```source``` command,

Create a persistent state in Cloud Shell by editing the *.profile* config file and add 

```source project1Env/config``` at the end of the file. This will automatically activate your environment whenever Cloud Shell is reset and restarted

## In summary

The Console:

- Provides a fast way to perform tasks.
- Presents options to you, instead of requiring you to know them.
- Performs behind-the-scenes validation before submitting the commands.

Cloud Shell provides:

- Detailed control
- A complete range of options and features
- A path to automation through scripting
