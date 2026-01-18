package lib.helpers

resource_changes[type] = changes {
  changes := [rc |
    rc := input.resource_changes[_]
    rc.type == type
  ]
}

resource_after(rc) = after {
  after := rc.change.after
}

has_field(obj, field) {
  obj[field]
}
