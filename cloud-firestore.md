[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/cloud-bigtable.md)

# Cloud Firestore (NoSQL, Document database)

- Live sync and offline support
- For Mobile, web and iot apps
- Flexible schema
- **Scale down to 0**
- **Scale up to TBs**
- Powerful query engine
- ACID transactions supported


## Cloud Firestore is next gen Cloud Datastore

It is backwardly compatible with Cloud Datastore. It can operate in 2 modes

### Datastore mode (recommended for: new server projects)

Removes some older limitations

- Compatible with Datastore apps
- Strong consistency 
- **No entity group limits**. Transactions are no longer limited to 25 entity groups and writes to an entity group are no longer limited to 1 Write/s

### Native mode (recommended for: new mobile and web apps)

Native mode introduces new features such as:

- Strongly consistent storage layer
- **New Collection and document data model** (Only in native mode)
- **Real-time updates** (Only in native mode)
- **Supports Mobile and web clinet libraries** (Only in native mode)

<img src="https://github.com/paulowe/gcp/blob/main/captures/firestore.PNG" />
