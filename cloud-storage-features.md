## Cloud Storage features

1. Customer-supplied encryption key (CSEK)
    - Use your own key instead of Google-managed keys

2. Object life cycle management
    - Management policies specify actions to be **performed on objects that meet certain rules**
        - Donwgrade storage class on objects older than a year to Coldline storage
        - Delete objects created beore a specific date (e.g Jan 1 2021)
        - Keep only the 3 most recent versions of an object
        - Automatically delete or archive objects

    - Object inspection occurs in **asynchronous batches** (rules may not be applied immediately) and
    - Changes can take **24 hours to apply** 

3. Object versioning
    - Objects are immutable
    - Maintain multiple versions of objects and history of modifications
    - You will be charged as though there are multiple objects.
    - Supports retrieval of objects that are deleted or overwritten ; List archived version of an object, restore to older state or delete a version

4. Directory synchronization
    - Sync a VM directory with a bucket (for backup purposes?)

5. Object change notification
    - Can be used to **notify** application when an object is **updated, added or ** to a bucket
    - Notification channel supported : Webhook
    - **Recommended method is**: **Pub/Sub Notifications** for Cloud Storage! 
        - Faster
        - Easier to set up
        - Flexible, and
        - More cost-effective   

6. Data import services

For large data import to Cloud Storage (TB, PB scale data)

   - Transfer Appliance: Hardware appliance to transfer **from 100 TB - 1 PB** ; Rack, capture and then ship your data to Google Cloud
   - Storage Transfer Service - Enables high perfomrance imports of **online data** ; **Data source:** S3, Web source or even another Cloud storage bucket
   - Offline Media Import - Third party service where physical media is sent to a provider who uploads the data

7. Strong global consistency
    - Read-after-write
    - Read-after-metadata-update
    - Read-after-delete
    - Bucket listing
    - Object listing
