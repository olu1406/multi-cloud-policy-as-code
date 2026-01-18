package policy.common.regions

allowed_regions := {"eastus", "us-east-1"}

deny[msg] {
  rc := input.resource_changes[_]
  after := rc.change.after
  after.location
  not allowed_regions[after.location]
  msg := sprintf("Resource %s uses disallowed Azure region %s", [rc.address, after.location])
}

deny[msg] {
  rc := input.resource_changes[_]
  after := rc.change.after
  after.region
  not allowed_regions[after.region]
  msg := sprintf("Resource %s uses disallowed AWS region %s", [rc.address, after.region])
}
