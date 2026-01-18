SHELL := /bin/bash

.PHONY: fmt validate policy-test ci

fmt:
	terraform fmt -recursive

validate:
	for dir in examples/azure-secure-landing-zone examples/aws-secure-baseline; do \
		terraform -chdir=$$dir init -backend=false; \
		terraform -chdir=$$dir validate; \
	done

policy-test:
	conftest test policy/tests

ci: fmt validate policy-test
