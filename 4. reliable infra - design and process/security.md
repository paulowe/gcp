# Security is a shared responsibility

Principle of least privilege applies to **machines, people and proccesses**. Roles should be assigned to all these entities

Separation of duties
- No one person can change or delete data without bein detected
- No one person can steal sensitive data
- No one person is in charge of designing, implementing and reporting on sensitive systems

Use multiple projects to separate duties

## Audit Logs regularly
- All services write to logs
  - Admin logs
  - Data access logs
  - VPC Flow logs
  - Firewall logs
  - System logs
 
 ## Google cloud meets many third party and government compliance standards worldwide
 - But this does not mean that your applications are also certified or runs with these standards
 - Focus on building your applications running on top of Google cloud 
 
 ## Security command center provides access to organizational and project security configuration
 - Provides a set of actionable recommendations

## Securing people:
- To grant people access to your projects, **add them as members** and assign them one or more roles
- Members are identified by their login
- Add members to groups for easier management
- Roles a re simply a list of permissions
- Use the console to easily see what permissions are granted to roles

## Use organizational policies and folder to simplify securing environments and managing resources
- Grant roles to Groups rather than individuals
- Groups can be more granular than job roles
- Use multiple groups for better control

Roles
- Prefer predefined roles over custom roles
- Grant roles at the smallest scope needed (least privilege)
- Limit use of "Owner" and "editor" roles
- Consider hierarchy inheritance when assigning roles

## Identity-Aware Proxy simplifies auhorization to Google cloud applications and VMs
- Works with apps deployed BEHIND THE http(s) load balancer in on App Engine environments, Compute Engine and GKE
- 
