[Overview](https://github.com/paulowe/gcp/blob/main/readme.md)

[Next](https://github.com/paulowe/gcp/blob/main/gcp-core-infrastructure/dataflow.md)

## Cloud Dataproc - Supercomputing Platform
Hadoop is a supercomputing platform consisting of HDFS for distributed storage of data and YARN for scheduling parallel processing jobs

Hadoop follows a programming model called MapReduce where
- "Map" function runs in parallel with a massive data set to produce intermediate results and
- "Reduce" function builds a final result set based on all the intermediate results
### Cloud Dataproc is managed Hadoop
- Dataproc is fast, and managed way to run Hadoop along with Spark/Hive/Pig on GCP
- Easily **scalable** even when jobs are running
- **Flexible configuration** of machine types
- **Monitor clusters** using Stackdriver
- **Agile use of resources** - Only pay for hardware you use
- Can be used with preemptible VMs (you have to make sure your jobs can be restarted cleanly)
- Billed by the second
- Although cost of running the VMs takes the bulk of Dataproc charges, it is **not the only cost**
- You can use Spark Machine Learning Libraries (MLlib) to perform **data mining**
