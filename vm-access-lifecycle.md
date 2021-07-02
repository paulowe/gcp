## VM states


## Once an instance is running you can:

- reset (instance remains running) - console, gcloud, API , OS
- reboot (running -> running) - OS: sudo reboot
- stop (running -> terminated) - console, gcloud, API
- shutdown (running -> terminated) - OS: sudo shutdown
- restart (terminated -> running) - console, gcloud, API, OS
- delete (running/terminated -> N/A) - console, gcloud, API
- *preemption* - automatic command by Compute Engine, 30s shutdown script time. If it takes any longer Compute Engine sends an ACPI mechanical power off signal to the OS

## Availability policy: Automatic changes

Also known as "Scheduling options" in the SDK/API

Compute Engine can live migrate to another host due to a maintenance event

**Maintenance behaviors**

1. Live Migrate (Default)

2. Automatic restart - due to a crash or maintenance event (not preemption or  user-initiated terminate)

3. Terminate - You can set the behavior to terminate your instances during maintenance events 

**Configuration of Maintenance behavior and Availability policies** can be done before launching an instance / after launch
by configuring the **On host maintenence** and **Automatic restart**
