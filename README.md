# Bootable Container Configurations

A collection of bootable container images based on Fedora/RHEL for different use cases.

## What is bootc?

[bootc](https://github.com/containers/bootc) allows you to build bootable operating system images from OCI container images. You can deploy these directly to bare metal, VMs, or cloud instances.

## Available Configurations

- **base** - Minimal Fedora bootc base image with essential tools
- **pytorch** - ML/AI workstation with PyTorch, CUDA, and development tools
- **cron-tasks** - Lightweight system for running scheduled tasks and automation
- **dev-workstation** - Full development environment with languages and tools

## Building Images

```bash
# Build a specific configuration
cd <config-name>
podman build -t bootc-<config-name> .

# Or use the Makefile
make build-pytorch
```

## Installing to a System

```bash
# Install to a disk/partition
sudo bootc install to-disk --generic-image ghcr.io/soyr-redhat/bootc-pytorch /dev/vda

# Or install to existing system
sudo bootc switch ghcr.io/soyr-redhat/bootc-pytorch
```

## Updating

Once installed, update your system with:
```bash
sudo bootc upgrade
```

## Repository Structure

```
bootc-fed/
├── base/
│   └── Containerfile
├── pytorch/
│   └── Containerfile
├── cron-tasks/
│   └── Containerfile
├── dev-workstation/
│   └── Containerfile
└── README.md
```

## Publishing to GitHub Container Registry

Images are automatically built and published to `ghcr.io/soyr-redhat/bootc-*` on push to main.
