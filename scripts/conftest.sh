#!/usr/bin/env bash
set -euo pipefail

plan_file=${1:?"Usage: $0 <plan.json>"}

conftest test --policy policy "${plan_file}"
