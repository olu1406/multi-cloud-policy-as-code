#!/usr/bin/env bash
set -euo pipefail

example_dir=${1:?"Usage: $0 <example-dir>"}

pushd "${example_dir}" >/dev/null
terraform init -upgrade
terraform plan -out=tfplan
terraform show -json tfplan > plan.json
popd >/dev/null

echo "Plan written to ${example_dir}/plan.json"
