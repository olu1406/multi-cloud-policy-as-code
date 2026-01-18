# Getting started

1. Install tools.

   ```bash
   ./scripts/install-tools.sh
   ```

2. Generate a Terraform plan JSON for policy checks.

   ```bash
   ./scripts/tf-plan-json.sh examples/aws-secure-baseline
   ```

3. Run policy tests.

   ```bash
   ./scripts/conftest.sh examples/aws-secure-baseline/plan.json
   ```
