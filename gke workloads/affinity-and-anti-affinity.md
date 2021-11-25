## 1. Use NodeSelector

For a Pod to run on a specific node, that node **must match all the labels present under
the nodeSelector field in a Pod**. NodeSelector is a Pod specification field that
specifies one or more labels.

If the node’s labels are changed, running Pods are not affected. 
  
NodeSelector is only used during Pod scheduling

Remember: A Pod won’t be scheduled if the NodeSelector
requirements aren’t met

## 2. Node Affinity and Anti Affinity

Like NodeSelectors, Node affinity also allows you to constrain which nodes your Pod
can be scheduled on, based on labels, but the features are more expressive and can
be used to constrain against 
- the labels of both nodes and 
- other Pods running on nodes

Affinity and Node Anti-affinity **rules won’t prevent a Pod from being
launched if the preferences cannot be met**. Think of these as allowing you to set soft
preferences
