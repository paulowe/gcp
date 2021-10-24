# Paul Owe, 22-10-2021
#!/bin/bash/
set -ex
export my_zone=us-central1-a
export my_cluster=standard-cluster-1
# create 3 nodes. sets most default configurations
# For more options. https://cloud.google.com/sdk/gcloud/reference/container/clusters/create.

gcloud container clusters create $my_cluster --num-nodes 3 --zone $my_zone --enable-ip-alias
