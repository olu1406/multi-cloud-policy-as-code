package policy.aws.iam

import data.lib.helpers.resource_changes
import data.lib.helpers.resource_after

policy_doc(doc) = parsed {
  parsed := json.unmarshal(doc)
}

has_wildcard(stmt) {
  stmt.Action == "*"
  stmt.Resource == "*"
}

# Deny overly permissive IAM policies.

deny[msg] {
  rc := resource_changes["aws_iam_policy"][_]
  after := resource_after(rc)
  doc := policy_doc(after.policy)
  stmt := doc.Statement[_]
  has_wildcard(stmt)
  msg := sprintf("IAM policy %s allows Action=* on Resource=*", [after.name])
}
