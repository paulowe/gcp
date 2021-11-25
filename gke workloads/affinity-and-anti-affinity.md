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

