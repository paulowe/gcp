# When designing for reliability, the key performance metrics are
1. Availability - The percent of time a system is running and able to process requests
  - Achieved with fault tolerance
  - Creating back up systems
  - Health checks
  - Metrics to count real trafic success andd failure
3. Durability - The odds of losing data due to hardware or system failure
  - Replicate data in multiple zones
  - Perfrom regular backups
  - Practice restoring from backups
4. Scalability - The ability of a system to handle growing user and data load
  - Monitor usage
  - Use capacity auto-scaling to add/remove servers
