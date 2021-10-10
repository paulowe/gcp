# Kubernetes Concepts
There are two important related concepts when studying kubernetes.

### 1. Kubernetes Object Model

Each thing Kubernetes manages is an **Object**
You can view and change these object attributes and states

### 2. Kubernete Declarative Management
Expects you to tell it the states under its management to be

It does this uisng a *Watch Loop*

# Kubernetes Objects

Formally, **a Kubernetes object** is a persistent entity that represents the  state of objects running in the cluster (Desired and Current state)

Two elements of Kubernetes Objects
- Object spec: Give object spec for each object you want to create, and provide desired state
- Object status: Current state described by Kubernetes

## Containers in a Pod share resources

Pods are the smalles deployable Kubernetes object.

A Pod embodies the environment in which one or more containers live in. Containers within the same Pod are tightly coupled and they share resources including networking (IP address) and storage.

Containers in the same pod can communicate via Localhost.

Pods are not self-healing