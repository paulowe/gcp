### Cloud Native Loadbalancing (better than using Node based, Kubeproxy - which has tradeoffs between latency, as a result of double hop vs traffic distribution evenness)

Cloud Native Load balancing uses Network Endpoint Groups (eliminates extra network hops)

Can alleviate the double hop dilemma.

#### Details
![image](https://user-images.githubusercontent.com/40435982/144130089-d7adecde-c97d-4812-a539-2f9f8b649260.png)


#### Advantages
![image](https://user-images.githubusercontent.com/40435982/144129400-12d04903-7cab-48bb-8ed9-b7c17d546a06.png)

### Best choice (New): Container native load balancing using Network Endpoint Groups
![image](https://user-images.githubusercontent.com/40435982/144496507-b30dc41c-d159-49a1-b222-c888b211ab17.png)

## Ok Choice; Set external-traffic policy to Local

Suppose that the lowest possible latency is most important. You can configure the
LoadBalancer Service to force kube-proxy to choose a Pod local to the Node that
received the client traffic. To do that, set the externalTrafficPolicy field to “Local” in the
Service manifest.

This choice eliminates the double-hop to another node. Why? 

Because kube-proxy will always choose a Pod on the receiving node. In addition, when packets are
forwarded from node to node, the source client IP address is preserved and directly
visible to the destination Pod.

![image](https://user-images.githubusercontent.com/40435982/144134090-100a89a9-3f1e-4226-8abf-d9c99b0642c2.png)

## You are designing a GKE solution. One of your requirements is that network traffic load balancing should be directed to Pods directly, instead of balanced across nodes. What change can you make to your environment?
