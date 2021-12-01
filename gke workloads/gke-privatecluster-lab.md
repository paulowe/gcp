## Private clusters
You might use private clusters to provide services such as internal APIs that are meant only to be accessed by resources inside your network. For example, the resources might be private tools that only your company uses. Or they might be backend services accessed by your frontend services, and perhaps only those frontend services are accessed directly by external customers or users. In such cases, private clusters are a good way to reduce the surface area of attack for your application.

```
gcloud container clusters describe private-cluster --region us-central1-a
``` 

To view all sorts of details about you cluster configuration

```
student_00_11716934f65a@cloudshell:~ (qwiklabs-gcp-01-d10564b9fc4c)$ gcloud container clusters describe private-cluster --region us-central1-a
addonsConfig:
  dnsCacheConfig: {}
  gcePersistentDiskCsiDriverConfig:    enabled: true
  horizontalPodAutoscaling: {}
  httpLoadBalancing: {}
  kubernetesDashboard:
    disabled: true
  networkPolicyConfig:
    disabled: true
authenticatorGroupsConfig: {}
autoscaling:
  autoscalingProfile: BALANCED
clusterIpv4Cidr: 10.32.0.0/14
createTime: '2021-12-01T17:28:37+00:00'
currentMasterVersion: 1.21.5-gke.1302
currentNodeCount: 3
currentNodeVersion: 1.21.5-gke.1302
databaseEncryption:
  state: DECRYPTED
...
ipAllocationPolicy:
  clusterIpv4Cidr: 10.32.0.0/14
  clusterIpv4CidrBlock: 10.32.0.0/14
  clusterSecondaryRangeName: gke-private-cluster-pods-9450c97d
  servicesIpv4Cidr: 10.36.0.0/20
  servicesIpv4CidrBlock: 10.36.0.0/20
  servicesSecondaryRangeName: gke-private-cluster-services-9450c97d
  useIpAliases: true
labelFingerprint: a9dc16a7
legacyAbac: {}
location: us-central1-a
locations:
- us-central1-a
loggingConfig:
  componentConfig:
    enableComponents:
    - SYSTEM_COMPONENTS
    - WORKLOADS
loggingService: logging.googleapis.com/kubernetes
maintenancePolicy:
  resourceVersion: e3b0c442
masterAuth:
  clusterCaCertificate: ...
masterAuthorizedNetworksConfig: {}
monitoringConfig:
  componentConfig:
    enableComponents:
    - SYSTEM_COMPONENTS
monitoringService: monitoring.googleapis.com/kubernetes
name: private-cluster
network: default
networkConfig:
  datapathProvider: LEGACY_DATAPATH
  defaultSnatStatus: {}
  network: projects/qwiklabs-gcp-01-d10564b9fc4c/global/networks/default
  subnetwork: projects/qwiklabs-gcp-01-d10564b9fc4c/regions/us-central1/subnetworks/default
nodeConfig:
  diskSizeGb: 100
  diskType: pd-standard
  imageType: COS_CONTAINERD
  machineType: e2-medium
  metadata:
    disable-legacy-endpoints: 'true'
 ...
  shieldedInstanceConfig:
    enableIntegrityMonitoring: true
nodePoolDefaults:
  nodeConfigDefaults: {}
nodePools:
- autoscaling: {}
  config:
    diskSizeGb: 100
    diskType: pd-standard
    imageType: COS_CONTAINERD
    machineType: e2-medium
    metadata:
      disable-legacy-endpoints: 'true'
    oauthScopes:
    - https://www.googleapis.com/auth/devstorage.read_only
    - https://www.googleapis.com/auth/logging.write
    - https://www.googleapis.com/auth/monitoring
    - https://www.googleapis.com/auth/servicecontrol
    - https://www.googleapis.com/auth/service.management.readonly
    - https://www.googleapis.com/auth/trace.append
    serviceAccount: default
    shieldedInstanceConfig:
      enableIntegrityMonitoring: true
  initialNodeCount: 3
  ...
  locations:
  - us-central1-a
 ...
  maxPodsConstraint:
    maxPodsPerNode: '110'
  name: default-pool
  networkConfig:
    podIpv4CidrBlock: 10.32.0.0/14
    podRange: gke-private-cluster-pods-9450c97d
  podIpv4CidrSize: 24
  selfLink: https://container.googleapis.com/v1/projects/qwiklabs-gcp-01-d10564b9fc4c/zones/us-central1-a/clusters/private-cluster/nodePools/default-pool
  status: PROVISIONING
 ...
privateClusterConfig:
  enablePrivateNodes: true
  masterIpv4CidrBlock: 172.16.0.0/28
  peeringName: gke-n9e8dc0f6d3dc0605751-9887-2309-peer
  privateEndpoint: 172.16.0.2
  publicEndpoint: 34.69.146.9
releaseChannel:
  channel: REGULAR
selfLink: https://container.googleapis.com/v1/projects/qwiklabs-gcp-01-d10564b9fc4c/zones/us-central1-a/clusters/private-cluster
servicesIpv4Cidr: 10.36.0.0/20
shieldedNodes:
  enabled: true
status: PROVISIONING
subnetwork: default
zone: us-central1-a
```

# Network policy (for inter-pod networking restriction)
In this task, you create a cluster network policy to restrict communication between the Pods. A zero-trust zone is important to prevent lateral attacks within the cluster when an intruder compromises one of the Pods.
