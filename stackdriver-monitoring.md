## Stackdriver Monitoring

Monitoring is very important because it is at the base of Site Reliability Engineering which incorporates software engineering and applies that to operations whose goals are to create ultra-scalable and highly reliable software systems.

**Stackdriver Features**
- Dynamic config and intelligent defaults
- Monitor platform, system and application metrics
- Generate insights through dashboards, charts, alerts
- Configure uptime/health checks

Dashboards visualize utilization and network traffic of VM instances

## Workspace is the root entity that holds monitoring and configuration information

- Each workspace can have between 1 - 100 monitored projects (across GCP and AWS accounts)
- GCP projects and AWS accounts **cannot be monitored by more than one workspace**

Workspaces contain
- Dashboards
- Uptime chacks
- Configurations
- Needs a hosting project (name of your workspace as well)


### Alerting policies can notify you of certain conditions (e.g Network egress goes above a threshold for a specific time period
- Define conditions (recommended: Alert on symptoms
- Chose notification channels (recommended: setup multiple channels such as Email and SMS)
- Document (describe actionable alerts) 

### Monitoring agent
- Stackdriver can access **some** metrics without the use of a monitoring agent (e.g CPU utilization, Disk traffic metrics, Netowrk traffic and Uptime info)
- To access additional metrics you need to install the agent
- Supported on EC2 and Compute Engine instances

### Installing the agent (Linux VM)
```
curl -sSo https://d1.google.com/cloudagents/add-monitoring-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh
```
### Custome metrics (Python example)
You can pass custom metrics from your application to Stackdriver for better insights
```
client = monitoring.Client()
descriptor = client.metric_descriptor('custom.googleapis.com/my_metric',
              
             metric_kind = monitoring.MetricKind.GAUGE,
             value_type = monitoring.ValueType.DOUBLE.
             description = 'Sample custom metric by Paul' )
descriptor.create()
```
       
