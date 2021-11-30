### Cloud Native Loadbalancing (better than using Node based, Kubeproxy - which has tradeoffs between latency, as a result of double hop vs traffic distribution evenness)

Cloud Native Load balancing uses Network Endpoint Groups (eliminates extra network hops)

Can alleviate the double hop dilemma.

#### Details
![image](https://user-images.githubusercontent.com/40435982/144130089-d7adecde-c97d-4812-a539-2f9f8b649260.png)


#### Advantages
![image](https://user-images.githubusercontent.com/40435982/144129400-12d04903-7cab-48bb-8ed9-b7c17d546a06.png)

## How?
Suppose that the lowest possible latency is most important. You can configure the
LoadBalancer Service to force kube-proxy to choose a Pod local to the Node that
received the client traffic. To do that, set the externalTrafficPolicy field to “Local” in the
Service manifest.

This choice eliminates the double-hop to another node. Why? 

Because kube-proxy will always choose a Pod on the receiving node. In addition, when packets are
forwarded from node to node, the source client IP address is preserved and directly
visible to the destination Pod.

![image](https://user-images.githubusercontent.com/40435982/144134090-100a89a9-3f1e-4226-8abf-d9c99b0642c2.png)
