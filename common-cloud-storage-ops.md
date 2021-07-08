## Cloud Storage operations to remember

Create and use buckets

- Use console o/ gsutil
- Consider storage class (flexible after bucket creation)
- Location (recall this cannot be changed after bucket creation)

Set access control lists to restrict access

- Get the default access list that has been assigned to your object and save output in a txt file. (recall ACLs provide fine grained control over objects in your bucket)
```gsutil acl get gs://$BUCKET_NAME_1/setup.html  > acl.txt```

- Set ACL of object to be private
``` gsutil acl set private gs://$BUCKET_NAME/setup.html```
(you can verify by getting the acl assigned to your object again and checking the new acl text file)



Use your own encryption keys

Implement version controls

Use directory synchronization

Share a bucket across projects using IAM
