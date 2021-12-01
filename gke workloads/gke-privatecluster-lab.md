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
defaultMaxPodsConstraint:
  maxPodsPerNode: '110'
endpoint: 34.69.146.9
id: 9450c97d53fb4f4e897ddc40c9fcfa1a723ed3112a414a988e62f4cfe5fcc176
initialClusterVersion: 1.21.5-gke.1302
instanceGroupUrls:
- https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-01-d10564b9fc4c/zones/us-central1-a/instanceGroupManagers/gke-private-cluster-default-pool-3260b645-grp
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
  clusterCaCertificate: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUVMVENDQXBXZ0F3SUJBZ0lSQU1QUU1xZ3JsaWl1RUV3NWYzZWZMK3N3RFFZSktvWklodmNOQVFFTEJRQXcKTHpFdE1Dc0dBMVVFQXhNa01XWTBOREptWm1JdE1UVXdZUzAwTXpFd0xXRmpNMlV0TVRaaU5qZGpPV0poTW1KaQpNQ0FYRFRJeE1USXdNVEUyTWpnME1Gb1lEekl3TlRFeE1USTBNVGN5T0RRd1dqQXZNUzB3S3dZRFZRUURFeVF4ClpqUTBNbVptWWkweE5UQmhMVFF6TVRBdFlXTXpaUzB4Tm1JMk4yTTVZbUV5WW1Jd2dnR2lNQTBHQ1NxR1NJYjMKRFFFQkFRVUFBNElCandBd2dnR0tBb0lCZ1FDcDhNdEdPZkxDS3dYRG50YkZ4SlQrcDRLT05HZWVoZndWcXNUdAp4VXMzVU11ZzlNclp0dndYclhWWFEzTk9pVTdIclgyMHIzWTFKOXpCYndKRVVzOUVjUGhERFNXZDY3WjJUVXlxCkhYbnlsUzQzdzAvdzFZck5LZmpRaEVDWFh5OGZCVDBoRlFqRHJMdlNsNnNNOEtPZW9PWlkyL20rZzN1N3g1NXIKbkw3bWJpT0phQ3ZxYTc0TUF4N3F0anBKdTJCZE5oOWZ3YnFDQ3ZVWUtiOWQ0VVVCVXFnb3hUekFxcEdGNmpQLwptZGwwVEYwYm5iNitCS1lVRHZKeXdvMHhpdGNpNkxFVWF6bjNLNE5YNEE0Z2pZLzFDb09GWUg1VHh4QkNJYjM0CmFPMUkwWlVCZElpb013T2UyRFNlTUd0dGtZNm52SlhjeVIrOTExbXZTK1FoMmU0ZVNQTitFcUo1cUFDVDdTV3MKQ2ZaU1pOcHBZeXhpR2l0OCtVODJReDQ2ZEdrYlZXTTA5MlpHMFR1elJSRGdZMC9oSXhxRzJPb3NScXpJbUt6MQpUTDdPeHRxbmVRUUVrQ0FNZVRCb1ZobWpuc2x3L3J6NU1Hb2o4Sm9HbGZ0akNOb1VULzFORmRRREpQK0Mrd3BCCnUzVDh2bUQ5V005M3o2NHlpaWtnbkdwUThGa0NBd0VBQWFOQ01FQXdEZ1lEVlIwUEFRSC9CQVFEQWdJRU1BOEcKQTFVZEV3RUIvd1FGTUFNQkFmOHdIUVlEVlIwT0JCWUVGQVNmdnNBRGt0VHlDODdpTHhDdzJpclp4WFFOTUEwRwpDU3FHU0liM0RRRUJDd1VBQTRJQmdRQjA4UzBwYnpGbHloaTZJRk9PWjRRd1lDMVJnZHlXS0VmdEozMm9vYmZaCmNTMXBHcXdhUE5hUGZtZENlbVlESEtUVHhMTi84UVI3WlRGamRFLytLUlJpNEhLWktQc0ZBaHdMZHpVSHUrUWcKWHVSa2p2SG42ZzJpZHpOR0Q3ci9JdHVVVHFVNGpkWHRJY2J1V1JPMGw0UVBJaGN6Q3RHWEM0dHZRSHM3Mk92dgpuc0kxdGV2clB1QUtJb2hJSEpMUk0xczE3d2J1Q1NjZk1wekhvbXFVenF5R3BaMVFDeHZKWUt5czUrTm1NbUp1Cm45YlYyQ3BxdHRvTDRmUWw0WkVTWEZmWjNDWFlHMDBOS3NqaFNzQmhNaFI0ckkvWkJsdjM2RDUyZ29XRDBGNTEKNHh1b3BtSmpvdmg2WUY1bEFZVERxaTNjMktReEZmaE4rcEdFeHhIS0taZW9Zdm9HSjI0bzJGQlEzVmdNM0g4UQo2aHdmbEFqYjhsY2xIRUFaWUV3dXFEOEdISTFoOWlpS0ZyMnQ5OXRGMzcySUZCUGphaVNuNTY5QkMwM0haVzJaCmx3bEl2RW9wZGV3c0JOZEU2cTk0YTc4enVsUVJPdG5Md2tNYzVZYU9yVUY1emc1d1UwSEtuMXV5QVlPVXN0NFoKcyt1ZUNDK2NldmRwcnUvMS9CMVM4RDA9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
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
  instanceGroupUrls:
  - https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-01-d10564b9fc4c/zones/us-central1-a/instanceGroupManagers/gke-private-cluster-default-pool-3260b645-grp
  locations:
  - us-central1-a
  management:
    autoRepair: true
    autoUpgrade: true
  maxPodsConstraint:
    maxPodsPerNode: '110'
  name: default-pool
  networkConfig:
    podIpv4CidrBlock: 10.32.0.0/14
    podRange: gke-private-cluster-pods-9450c97d
  podIpv4CidrSize: 24
  selfLink: https://container.googleapis.com/v1/projects/qwiklabs-gcp-01-d10564b9fc4c/zones/us-central1-a/clusters/private-cluster/nodePools/default-pool
  status: PROVISIONING
  upgradeSettings:
    maxSurge: 1
  version: 1.21.5-gke.1302
notificationConfig:
  pubsub: {}
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
