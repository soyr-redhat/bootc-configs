# Bootable Container Configurations

A collection of bootable container images based on Fedora/RHEL for different use cases.

## Building Images

```bash
# Build a specific configuration
cd <config-name>
podman build -t bootc-<config-name> .

# Or use the Makefile
make build-pytorch-cpu
```

## Installing to a System

```bash
# Install to a disk/partition
sudo bootc install to-disk --generic-image ghcr.io/soyr-redhat/bootc-pytorch-cpu /dev/vda

# Or install to existing system
sudo bootc switch ghcr.io/soyr-redhat/bootc-pytorch-cpu
```

## Updating

Once installed, update your system with:
```bash
sudo bootc upgrade
```

## Repository Structure

```
bootc-configs/
├── base/
│   └── Containerfile
├── pytorch-cpu/
│   └── Containerfile
├── pytorch-cuda/
│   └── Containerfile
├── cron-tasks/
│   └── Containerfile
├── dev-workstation/
│   └── Containerfile
└── README.md
```

## Publishing to GitHub Container Registry

Images are automatically built and published to `ghcr.io/soyr-redhat/bootc-*` on push to main.
