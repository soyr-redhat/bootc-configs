.PHONY: help build-all build-base build-pytorch build-cron build-dev

REGISTRY ?= ghcr.io/soyr-redhat
TAG ?= latest

help:
	@echo "Available targets:"
	@echo "  build-all      - Build all configurations"
	@echo "  build-base     - Build base configuration"
	@echo "  build-pytorch  - Build PyTorch configuration"
	@echo "  build-cron     - Build cron tasks configuration"
	@echo "  build-dev      - Build dev workstation configuration"
	@echo ""
	@echo "Variables:"
	@echo "  REGISTRY       - Container registry (default: ghcr.io/soyr-redhat)"
	@echo "  TAG            - Image tag (default: latest)"

build-all: build-base build-pytorch build-cron build-dev

build-base:
	podman build -t $(REGISTRY)/bootc-base:$(TAG) base/

build-pytorch:
	podman build -t $(REGISTRY)/bootc-pytorch:$(TAG) pytorch/

build-cron:
	podman build -t $(REGISTRY)/bootc-cron:$(TAG) cron-tasks/

build-dev:
	podman build -t $(REGISTRY)/bootc-dev:$(TAG) dev-workstation/

push-all: build-all
	podman push $(REGISTRY)/bootc-base:$(TAG)
	podman push $(REGISTRY)/bootc-pytorch:$(TAG)
	podman push $(REGISTRY)/bootc-cron:$(TAG)
	podman push $(REGISTRY)/bootc-dev:$(TAG)
