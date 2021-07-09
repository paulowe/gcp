[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/cloud-sql.md)

## Cloud Storage operations to remember

**Create and use buckets**

- Use console o/ gsutil
- Consider storage class (flexible after bucket creation)
- Location (recall this cannot be changed after bucket creation)

**Set access control lists to restrict access**

- Get the default access list that has been assigned to your object and save output in a txt file. (recall ACLs provide fine grained control over objects in your bucket)
```gsutil acl get gs://$BUCKET_NAME_1/setup.html  > acl.txt```

- Set ACL of object to be private
``` gsutil acl set private gs://$BUCKET_NAME/setup.html```

(you can verify by getting the acl assigned to your object again and checking the new acl text file)

- Set ACL of object to be **publicly readable** to AllUsers entity (all users on the internet regardless of whether they are authenticated or have a google account)
``` gsutil acl ch -u AllUsers:R gs://$BUCKET_NAME/setup.html```

(you can verify by getting the acl assigned to your object again and checking the new acl text file)

Recall that an ACL may have one or more entries and each entry contains two pieces of information - Scope (who); Permissions (Read, Write,...)

**Use your own encryption keys**

Using your own keys is known as **CSEK - Customer Supplied Encryption Keys**

We can generate an **AES-256 base 64 key** with the following steps.

**About the Advanced Encryption Standard (AES) :** 
Advanced Encryption Standard is built from three block ciphers: AES-128, AES-192, and [AES-256](https://www.cyclonis.com/what-is-aes-256-encryption/). Each of these encrypts and decrypts data in chunks of 128 bits by using cryptographic keys of 128-, 192- or 256-bits
- Symmetric block cipher; 
- Used by American government to encrypt sensitive data ; 
- Used by Individuals and corporaions to lock away classified, valuable information

A. Create a key

```python3 -c 'import base64; import os; print(base64.encodebytes(os.urandom(32)))'```

B. Save the key generated between ```b'``` and ```\n'```

C. Modify .boto file

  - ls hidden files :   ```ls -al```
  - If no boto file exists - ```gsutil config -n``` will generate one
  - If it exists, lets edit it to uncomment; paste our encryption key where ```# encryption_key=``` is in the doc ;


**Implement version controls**

**Use directory synchronization**

**Share a bucket across projects using IAM**
