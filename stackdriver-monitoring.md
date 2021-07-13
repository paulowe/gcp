[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/stackdriver-logging.md)

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
### Metrics Explorer
The Metrics Explorer allows you to examine resources and metrics without having to create a chart on a dashboard

**CPU Usage Metric**

Metric: compute.googleapis.com/instance/cpu/usage_time

Description: Delta vCPU usage for all vCPUs, in vCPU-seconds. To compute the per-vCPU utilization fraction, divide this value by (end-start)*N, where end and start define this value's time interval and N is `compute.googleapis.com/instance/cpu/reserved_cores` at the end of the interval. This value is reported by the hypervisor for the VM and can differ from `agent.googleapis.com/cpu/usage_time`, which is reported from inside the VM.

Resource type: gce_instance

**CPU Utilization Metric**

Metric: compute.googleapis.com/instance/cpu/utilization

Description: Fractional utilization of allocated CPU on this instance. Values are typically numbers between 0.0 and 1.0 (but some machine types allow bursting above 1.0). Charts display the values as a percentage between 0% and 100% (or more). This metric is reported by the hypervisor for the VM and can differ from `agent.googleapis.com/cpu/utilization`, which is reported from inside the VM.

Resource type: gce_instance
