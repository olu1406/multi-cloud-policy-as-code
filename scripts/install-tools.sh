#!/usr/bin/env bash
set -euo pipefail

command -v terraform >/dev/null 2>&1 || {
  echo "Terraform not found. Install from https://developer.hashicorp.com/terraform/downloads" >&2
}

command -v conftest >/dev/null 2>&1 || {
  echo "Conftest not found. Install from https://www.conftest.dev/" >&2
}

command -v opa >/dev/null 2>&1 || {
  echo "OPA not found. Install from https://www.openpolicyagent.org/docs/latest/#running-opa" >&2
}

echo "Tool check complete."
