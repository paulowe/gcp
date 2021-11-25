## Cluster Scaling Theory

The Node Pool count represents the number of
nodes in the node pool per zone.

For example, if this particular pool spans two
compute zones, and you increase the node size from 3 to 6, each zone will have 6
nodes registered, and the total number of nodes in this pool will be 12

You can also manually decrease the cluster size. When you reduce the size of a
cluster, **the nodes to be removed are selected randomly. The resize process doesn’t
differentiate between nodes that are running Pods and ones that are empty.**

When you remove a node from the cluster, all the Pods within that node will be
terminated gracefully. Graceful termination means that a TERM signal is first sent to
the main process in each container. A grace period is then allowed before a KILL
signal is sent and the Pod is deleted. 

This grace period is defined for each Pod.

**If these Pods are managed by a replication controller such as a ReplicaSet or
StatefulSet, they’ll be rescheduled on the remaining nodes**. Otherwise, the Pods won’t
be restarted elsewhere.

Let’s look at some best practices for working with autoscaled clusters.

1. First, don’t run Compute Engine autoscaling for managed instance groups on these
nodes. The GKE autoscaler is separate from Compute Engine autoscaling.

2. Don’t manually resize a node pool using a gcloud command when the cluster
autoscaler is enabled. This might lead to cluster instability and result in the cluster
having wrong node pool sizes.

3. Don’t modify autoscaled nodes manually. All nodes in a node pool should have the
same capacity, labels, and system Pods. In addition, if you change the labels for one
node directly using kubectl, the changes won’t be propagated to the other nodes in
the node pool.

4. Do specify correct resource requests for Pods. This will allow Pods to work efficiently
with the cluster autoscaler. If you don’t know the resource needs of Pods, measure
them under a test load.

5. Finally, do use PodDisruptionBudgets. It’s expected that the Pods belonging to the
controller can be safely terminated and relocated. If your application cannot tolerate
such disruption, maintain your application’s availability using PodDisruptionBudgets. 

## Autoscaling and HorizontalPodAutoScaler


