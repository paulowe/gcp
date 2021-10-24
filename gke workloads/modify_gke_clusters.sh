#!/bin/bash
set -ex
export my_zone=us-central1-a
export my_cluster=standard-cluster-1
gcloud container clusters resize $my_cluster --zone $my_zone --num-nodes=4 -y
