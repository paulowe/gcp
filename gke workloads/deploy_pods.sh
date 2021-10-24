#!/bin/bash
set -ex
# deploy nginx as a pod named nginx-1
kubectl create deployment --image nginx nginx-1

# When a repository isn't specified, the default behavior is to try 
# and find the image either locally or in the Docker public registry. In this case, the image is pulled from the Docker public registry.
