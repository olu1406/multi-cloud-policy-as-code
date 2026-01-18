# Policy library

Policies are organized by cloud and service, with shared helpers and common rules in `policy/common`.

## Layout

- `policy/azure/storage`: Azure Storage controls.
- `policy/azure/keyvault`: Azure Key Vault controls.
- `policy/aws/s3`: AWS S3 controls.
- `policy/aws/iam`: AWS IAM controls.
- `policy/common`: shared tagging and region rules.
- `policy/tests`: unit-style tests for policies.

Use Conftest to evaluate Terraform plan JSON outputs against these policies.
