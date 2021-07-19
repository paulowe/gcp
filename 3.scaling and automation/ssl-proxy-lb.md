[Overview](https://github.com/paulowe/gcp/blob/main/3.scaling%20and%20automation/cloud-load-balancing.md)

[Next](https://github.com/paulowe/gcp/blob/main/3.scaling%20and%20automation/tcp-proxy-lb.md)
# SSL Proxy Load Balancing

**Background notes**

[Stackoverflow](https://stackoverflow.com/questions/856209/difference-between-https-protocol-and-ssl-certificate)

HTTPS is HTTP (HyperText Transfer Protocol) plus SSL (Secure Socket Layer). You need a certificate to use any protocol that uses SSL.

SSL allows arbitrary protocols to be communicated securely. It enables clients to (a) verify that they are indeed communicating with the server they expect and not a man-in-the-middle and (b) encrypt the network traffic so that parties other than the client and server cannot see the communication.

An SSL certificate contains a public key and certificate issuer. Not only can clients use the certificate to communicate with a server, clients can verify that the certificate was cryptographically signed by an official Certificate Authority. For example, if your browser trusts the VeriSign Certificate Authority, and VeriSign signs my SSL certificate, your browser will inherently trust my SSL certificate.

[TLS is the successor of SSL](http://en.wikipedia.org/wiki/Transport_Layer_Security)



## SSL Proxy LB
- Global Load balancing for HTTPS (encrypted, non-HTTP)
- Terminates SSL session at Load balancing layer THEN 
- Balances connections across your instances using SSL (Recommended) or TCP protocols
<img src="https://i.stack.imgur.com/bgz04.png" />

- IPv4 or IPv6 clients
- Intelligent routing - measn LB can route requests to backend locations where there is capacity
- Certificate management
- Automatic Security patching by GCP
- SSL policies

