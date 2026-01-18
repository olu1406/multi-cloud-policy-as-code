# Architecture

The repository is organized to separate infrastructure, policy logic, and documentation:

- `modules/`: reusable Terraform building blocks for secure cloud resources.
- `policy/`: OPA/Conftest policies and tests.
- `examples/`: sample Terraform configurations with compliant and non-compliant cases.
- `scripts/`: developer tooling helpers.

CI validates Terraform formatting/validation and Conftest policy checks.
