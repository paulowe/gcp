[Resource Monitoring Overview](https://github.com/paulowe/gcp/blob/main/resource-monitoring.md)

[Next](https://github.com/paulowe/gcp/blob/main/stackdriver-error-reporting.md)

## Stackdriver Logging is a fully managed servcie that performs at scale

**Stackdriver Logigng Features :**
- Store, search, analyze, monitor and alert on Log data
- Fully managed; Scalable
- Logging from GCP and AWS
- Create log based metrics
- Logs are stored for 30 days, but you can export Logs to Cloud Storage or Bigquery for better analysis
- Use cases: For network forensics by exploring IP addresses
- Export to pub/sub

It is a best practice to install a logging agent in all your VMs (for example in your startup script)
```
curl -sSO https://d1.google.com/cloudagents/install-logging-agent.sh
sudo bash install-logging-agent.sh
```
