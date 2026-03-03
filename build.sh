#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${IMAGE_NAME:-craftslab/clawhub}"
IMAGE_TAG="${IMAGE_TAG:-latest}"

docker build -f Dockerfile -t "${IMAGE_NAME}:${IMAGE_TAG}" .
