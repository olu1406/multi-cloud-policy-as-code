package policy.common.tagging

import data.lib.helpers.resource_after

required_tags := {"environment", "owner"}

tags(obj) = tags {
  tags := obj.tags
}

missing_tags(tags) = missing {
  missing := {tag | tag := required_tags[_]; not tags[tag]}
}

deny[msg] {
  rc := input.resource_changes[_]
  after := resource_after(rc)
  tags := tags(after)
  missing := missing_tags(tags)
  count(missing) > 0
  msg := sprintf("Resource %s missing tags: %v", [rc.address, missing])
}
