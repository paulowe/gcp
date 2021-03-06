[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/apigee_cloud-endpoints.md)
## App Engine
App Engine is a Platform as a Service. It enables users to focus on the app development and makes deployment mainteneace, and scalability easy

App Engine takes care of a lot of standard operations you would require ina typical application such as
- NoSQL Dbs,
- In memory Dbs,
- Health checks,
- Load balancing, 
- Authentication, 
- Networking, 
- Caching 

These are all handled by App engine. You only have to code your application to take advantage of the App engine service.

## gcloud commands

``` gcloud app deploy``` while youre inside your virtual environment, with all requirements specified in the app.yaml file

``` gcloud app browse``` to browse your live app

Disabling an app will
- Stop serving requests to users but
- Preserve state and finish running task queries

### Use case
App Engine will scale your application automatically in response to the amount of traffic it receives. That’s why App Engine is especially suited for applications where the workload is highly variable, like Web Apps and Mobile backends.

### Environments
1. App Engine Standard Environment
2. App Engine Flexible Environment

#### Standard Environment
- Low utilization can run at no charge
- SDKs are available for local testing before deployment. They also include simple commands for deployment
- Restrictions are enforced for your code to be run on a Sandbox.

Sandbox is a software construct that's independent of the hardware, OS or physical location of the server it runs on. 

This is one of the reasons why App Engine Standard Environment can scale and manage your application in a very fine grained way.

Sandbox constraints:
 - No writing to local files
 - All request time out at 60s
 - Limits on third party software/binaries
 
#### Runtimes
Java, Python, PHP and Go are supported

#### Flexible Environment
- Allows a wide range of choices for application language ( runtime environments)
- Lets you specify the container your app runs in and 
- App Engine will manage these compute engine VMs, health checks
- Ability to ssh in
- Choice of geographic region

Flexible environmens however have a Slower instance startup compared to the Standard Environment

## Error reporting and Debugging lab
[Jump to topic](https://github.com/paulowe/gcp/blob/main/resource-monitoring.md)

#### Deploying to app engine
1. Copy files/repo from Cloud storage or github to Cloud Shell instance
2. Run the application using Cloud Shell dev server
```
dev_appserver.py $(pwd)
gcloud app deploy app.yaml
```
You need to define your entry point in App.yaml. 
dev_appserver.py just works! You can memorize this command for testing on Cloud shell's local dev server
