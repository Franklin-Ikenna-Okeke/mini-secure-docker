#!/bin/bash
set -euo pipefail

IMAGE_NAME="hardened-app"

echo "[CI] Building Docker image: ${IMAGE_NAME}"
docker build -t "${IMAGE_NAME}" .

echo "[CI] Running Trivy security gate (HIGH,CRITICAL)..."
# --exit-code 1 means: if findings exist at this severity -> FAIL
mkdir -p security/reports
trivy image --severity HIGH,CRITICAL "${IMAGE_NAME}" | tee security/reports/trivy-high-critical.txt


trivy image \
  --severity HIGH,CRITICAL \
  --ignore-unfixed \
  --exit-code 1 \
  "${IMAGE_NAME}"


echo "[CI] Security gate passed (no HIGH/CRITICAL vulnerabilities)."
