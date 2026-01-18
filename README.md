# Multi-Cloud Policy-as-Code (Azure + AWS)

This repository provides a starter implementation for building a multi-cloud policy-as-code program across Azure and AWS. It includes Terraform module examples, OPA/Conftest policy libraries, and CI automation to validate policy compliance.

## Repository structure

```
multi-cloud-policy-as-code/
├─ docs/
├─ examples/
├─ modules/
├─ policy/
├─ scripts/
├─ .github/workflows/
├─ Makefile
└─ .editorconfig
```

## Quick start

1. Install tooling.

   ```bash
   ./scripts/install-tools.sh
   ```

2. Validate policies against the sample Terraform plans.

   ```bash
   make policy-test
   ```

3. Run the CI checks locally.

   ```bash
   make ci
   ```

## What is included

- **Terraform modules** for secure storage, key management, and networking.
- **OPA/Conftest policies** for Azure Storage, Azure Key Vault, AWS S3, and AWS IAM.
- **Examples** for compliant and non-compliant configurations.
- **Docs** covering architecture, policy library design, and testing.

## Next steps

- Add organization-specific tag and region constraints in `policy/common`.
- Expand the Terraform modules with more baselines (CIS/NIST).
- Integrate with Azure Policy or AWS Config for runtime enforcement.
