# NODE AFFINITY AND POD AFFINITY ARE BOTH CONFIGURED ON PODS

# NODE AFFINITY (selecting type of node. e.g Node Pools)

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
preferences (preferredDuuringSchedulingIgnoredDuringExecution) in addition to hard requirements (requiredDuringSchedulingIgnoredDuringExecution)

### 1. Hard Affinity Rules

![image](https://user-images.githubusercontent.com/40435982/143484713-182c799d-56db-43b3-b21e-174bc332b4f6.png)

operationr: In (OR operator)

- you can use several matchExpressions (the node MUST satisy each matchExpression. Logical AND)

### 2. Hard Anti-Affinity Rules
Uses same code above but with a NotIn operator instead.

For example, if the NotIn operator was used in
this example, you would be configuring a node anti-affinity rule

Full list of operators: 
You can use other operators, such as 
- NotIn, 
- Exists, 
- DoesNotExist, 
- Gt (for greater-than) and 
Lt (for less than). 

For example, if the NotIn operator was used in
this example, you would be configuring a node anti-affinity rule

### 3. Soft Affinity Preferences

Uses preferredDuringSchedulingIgnoredDuringExecution
 and a **weight value** to describe the intesity of preference.
![image](https://user-images.githubusercontent.com/40435982/143485557-f302ef54-d07c-4420-a557-e66fa0366389.png)

### 4. Soft Ant-Affinity Preferences
Use NotiN

#### How the Scheduler Evaluates Preferences
When the scheduler evaluates these preferences, each node that the Pod might be
scheduled on receives a total weight score based on all the requirements it meets,
such as resource requests, resource limits, and other nodeAffinity rules, such as
‘RequiredDuringSchedulingIgnoredDuringExecution.’ The weight of
‘preferredDuringSchedulingIgnoredDuringExecution’ is also added to this total score.
The scheduler then assigns the Pod to the node with the highest total score.

# POD AFFINITY (Application purposes. Maybe preventing Private and Public apps on same node.)
## Pod Affinity Rules
A Pod that is required or prefers to run on the same node as other Pods can be
configured with podAffinity rules.

## Pod Anti-Affinity Rules
Pods that must not, or should not, be scheduled on
the same node as other Pods can be configured with podAntiAffinity rules

![image](https://user-images.githubusercontent.com/40435982/143486506-6da70c18-a686-4f37-8605-9b527207db3d.png)

This Pod strongly prefers not to be scheduled on the same node as Pods
with label key: value of app:webserver. 

This is a strong but still soft preference,
because the weight of this podAntiAffinity rule has the highest possible value of 100,
but the rule is still preferredDuringScheduling. 

### Using Topology Keys for Affinity/Anti-Affinity Rules
Using topologyKeys, you can also specify affinity and non-affinity rules at a higher
level than just specific nodes. 

For example, to ensure that Pods are not co-located in
the same zone, not just the same node, you define a topologyKey to specify that a
podAntiAffinity rule should apply at the zone topology level.

You can use topologyKey to specify topology domains, such as 
- node, 
- zone, and
- region.

The Pod shown above has a podAntiAffinity rule with topologyKey set so that it prefers 
not to be scheduled in the same zone that’s already running at least one Pod with
label key: and value of app:webserver. 

# EXAMPLE
Here’s an example that combines Pod affinity and anti-affinity.
![image](https://user-images.githubusercontent.com/40435982/143488835-06b66778-03ef-4d53-88e0-5a0acb8496b2.png)

Pod number 1, with
label app:webserver, **has both a hard requirement and a soft preference.**

In this Web server Pod,
- the hard requirement has an anti-affinity rule saying that other Pods with the label
app:webserver aren’t allowed in the same zone. 

- On the other hand, the soft
preference has an affinity rule where it prefers to have other Pods with label
app:cache on the same node.

The cache Pods, however, 
- prefer to be scheduled on the same node as a web server
but have 
- a hard requirement that prevents multiple cache Pods from being deployed
in the same zone.

The resulting distribution has the two web server Pods repelling each other at the
zone level, and attracting cache Pods at the node level. Both cache Pods also repel
each other at the zone level and attract web server Pods at the node level. 
