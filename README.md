# Multicloud Kubernetes Provisioning
This repository contains IaC and scripts to provision a Kubernetes cluster across multiple cloud providers.

## k3d (Local / Self-Hosted)
### Prerequisites
All dependencies can be installed via a Makefile task
```sh
make -f k3d/Makefile mac-deps
```

### Usage
Create k3d cluster:
```sh
make -f k3d/Makefile k3d-create CLUSTER_NAME=cluster-name
```

Initialize local development environment:
```sh
make -f k3d/Makefile skaffold-init
```

Start local development environment:
```sh
make -f k3d/Makefile skaffold-dev
```