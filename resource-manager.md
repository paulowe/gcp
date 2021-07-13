[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/resource-manager.md)

## Resource Manager lets you hierarchically manage resources by Project -> Folder -> Organization

Policies 
- contain a set of roles and memebers; 
- are set on resources

**Resources inherit policies from parents**, therefore resource policies are a union of parent and resource. 

If a parent policy is less restrictive it ovverides the more restrictive resource policy.

## Resources hierarchy

Resources can be categorized by location
- Global resources
- Regional resources
- Zonal resources
