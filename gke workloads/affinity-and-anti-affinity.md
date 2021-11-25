## 1. Use NodeSelector

For a Pod to run on a specific node, that node must match all the labels present under
the nodeSelector field in a Pod. NodeSelector is a Pod specification field that
specifies one or more labels.

If the node’s labels are changed, running Pods are not affected. 
  
NodeSelector is only used during Pod scheduling

## 2. Affinity and Anti Affinity
