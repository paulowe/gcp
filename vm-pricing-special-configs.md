[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/compute-engine-actions.md)

## Pricing concept for VMs on Compute Engine

1. Committed Use discounts (1 year / 3 year term)
2. Sustained Use Discounts

```
![Sustained use discounts](https://github.com/paulowe/gcp/blob/main/captures/Capture%203.PNG)

This way of adding images doesnt let you customize height and width. Simply use HTML in your .md to customize height and width
```

<img src="https://github.com/paulowe/gcp/blob/main/captures/Capture%203.PNG" alt="Sustained use discount" height="400" width="400"/>

3. **Preemptible VMs** 
                   - Up to 80% discount 
                   - Can be terminated at any time
                   - Live up to 24 hours max
                   - No live migrations, but you can create monitoring and load balancers to keep restoring Prreemptible VMs
                   - Batch processing jobs (jobs can slow down, when PVMs get terminated)


## Special VM Configurations

4. (More expensive) **Sole tenant nodes physically isolate workloads**. You can bring your own license. Sole tenat can be used for a payment processing applications.

5. Shielded VMs - Offer verifiable integrity using
                - Secure boot
                - Virtual trusted platform module (vTPM)
                - Integrity monitoring



