# REST APIs

A good microservices design is loosely coupled

- Clients should not need to know too many details of services they use (URI, Request and Response message formats)
- Services communicate via HTTPS using text based payloads
- Servces should add functionality without breaking existing clients

REST architecture supports loose coupling
- Protocol independent
  - http IS most common
  - Other possibilities include gRPC (supports streaming)

RESTful services communicate over the web using HTTPs

- URIs identify and provide access to resources (
Resource is an abstract notion of information)
- REST applications provide consistent, uniform interfaces
- Caching of immutable representations is appropriate

**Public vs Private APIs**
- JSON is the standard format for external services
- Use gRPC for private services

### Clients acccess services using HTTP requests

- VERB: GET, PUT, POST, DELETE
- URI: Uniform Resource Identifier
- Request Header: metadata about the message format (JSON, XML)
- Request body: Contains data to be sent to the server and is optinional if your are requesting for data

The HTTP Verb tells the server the action to perform on the resource

1. GET is used to retrieve data
2. POST is used to create data
3. PUT is used to create data or alter existing data (needs to be idempotent, regardless of how many requests sent to the server, the output needs to always be the same)
4. DELETE is used to remove data

HTTP response codes
200 - Success
400 - client errors
500 - server errors (503 -Server is overloaded)

### All services need URIs
- Plural nouns for sets (collections) 
- Singular nouns for individual resources
- Strive for consistent naming
- URI is case-insensitive
- Dont use verbs to identify a resource

## API design
Google provides an API design guide and API style book (find it and examine Google cloud APIs)

Functions are in the form ```service.collection.verb```

For example

- Compute Engine service endpoint : ```https://compute.googleapis.com```
- Collections : instances, instanceGroups, etc
- Verb : list, get, insert, etc
- Full GET request to see all your instances:  ```https://compute.googleapis.com/compute/v1/projects/{project}/zones/{zone}/instances```

Use **OpenAPI** to design your REST APIs

## gRPC is a lightweight protocol for fast, binary communication between services or devices
- Developed at Google and supports many languages
- gRPC can expose gRPC services using an Envoy proxy in GKE

### Tools for managing APIs
- Cloud Endpoints
- Apigee

Both services provide tools and support for
- User auth
- Monitoring
- Securing APIs
- OpenAPI and gRPC
