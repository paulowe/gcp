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
