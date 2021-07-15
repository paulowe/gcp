# Managed Instance Groups

- Deploy identical instances based on instance template
- Instance group can be resized
- Manager ensures all instances are RUNNING
- Typically used with auoscaler
- Can be single zone or regional (recommended for HA)
- Instance groups for **Stateless serving** (webfrontend; batch processing such as image processing from a queue) or
- **Stateful serving** (such as databases)
