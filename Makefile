.PHONY: help build-all build-base build-pytorch-cpu build-pytorch-cuda build-cron build-dev

REGISTRY ?= ghcr.io/soyr-redhat
TAG ?= latest

help:
	@echo "Available targets:"
	@echo "  build-all          - Build all configurations"
	@echo "  build-base         - Build base configuration"
	@echo "  build-pytorch-cpu  - Build PyTorch CPU configuration"
	@echo "  build-pytorch-cuda - Build PyTorch CUDA configuration"
	@echo "  build-cron         - Build cron tasks configuration"
	@echo "  build-dev          - Build dev workstation configuration"
	@echo ""
	@echo "Variables:"
	@echo "  REGISTRY           - Container registry (default: ghcr.io/soyr-redhat)"
	@echo "  TAG                - Image tag (default: latest)"

build-all: build-base build-pytorch-cpu build-pytorch-cuda build-cron build-dev

build-base:
	podman build -t $(REGISTRY)/bootc-base:$(TAG) base/

build-pytorch-cpu:
	podman build -t $(REGISTRY)/bootc-pytorch-cpu:$(TAG) pytorch-cpu/

build-pytorch-cuda:
	podman build -t $(REGISTRY)/bootc-pytorch-cuda:$(TAG) pytorch-cuda/

build-cron:
	podman build -t $(REGISTRY)/bootc-cron:$(TAG) cron-tasks/

build-dev:
	podman build -t $(REGISTRY)/bootc-dev:$(TAG) dev-workstation/

push-all: build-all
	podman push $(REGISTRY)/bootc-base:$(TAG)
	podman push $(REGISTRY)/bootc-pytorch-cpu:$(TAG)
	podman push $(REGISTRY)/bootc-pytorch-cuda:$(TAG)
	podman push $(REGISTRY)/bootc-cron:$(TAG)
	podman push $(REGISTRY)/bootc-dev:$(TAG)
