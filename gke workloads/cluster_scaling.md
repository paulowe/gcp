## Cluster Scaling

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
