[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/pricing.md)
## Cloud Load Balancing
- Fully distributed
- Software defined 
- Managed service (no worries about scaling, or managing VMs)

### Types of traffic
1. HTTP(S)
2. TCP/SSL
3. TCP (non SSL)
5. UDP

### Features
- Cross region load balancing - A single **Anycast IP** frontends all your backend instances **globally**
- Automatic **multi-region failover**

### Load Balancers and Use Cases

1. Global HTTP(S) - For Layer 7; Cross regional load balancing in a Web App. 
3. Global SSL Proxy - For Layer 4; load balancing of Secure Socket traffic that is not HTTP(S); Supported on specific port numbers only 
4. Global TCP Proxy - For Layer 4; load balancing of non SSL TCP traffic; Supported on specific port numbers only
5. Regional - For load balancing of any traffic (TCP/UDP); Supported on any port number
6. Regional Internal - For load balancing of traffic inside a VPC; Useful for internal multi-tier apps

## To create CPU artificial load

``` dd if=/dev/urandom | gzip -9 >> /dev/null &```

It does so by forcing the CPU to continuousy attempt to compress random data
