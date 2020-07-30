+++
weight = 50
+++

{{% section %}}

## Part 2.2

Test Terraform modules

---

#### Workflow

1. _Code_
1. Deploy infrastructure
1. Validate it works
1. Undeploy the infrastructure
1. _Repeat_

---

#### Fact

Testing infrastructure requires a real world infrastructure!

---

#### ⚠ Warning

This will deploy and destroy many resources!

<small>Tipp: Use an isolated sandbox account and nuke this account every night</small>

{{% note %}}

- Separate billing
- Reduce blast radius

{{% /note %}}

---

### ⚒ Tools

---

### Kitchen-Terraform

<span class="badge tool">Test framework</span> <span class="badge">[Github](https://github.com/newcontext-oss/kitchen-terraform)</span>

Kitchen-Terraform enables verification of infrastructure systems provisioned with Terraform.

---

- Written in Ruby, configured via Yaml
- Use the well known [Test Kitchen](https://kitchen.ci/) from Chef the ecosystem
- Same approach for converge and verify development cycle like Molecule
- Integarates with Inspec

---

<script id="asciicast-350610" src="https://asciinema.org/a/350610.js" async></script>

---

### Terratest

<span class="badge tool">Test framework</span> <span class="badge tool">Unit test</span> <span class="badge tool">Integration test</span> <span class="badge">[Github](https://github.com/gruntwork-io/terratest)</span>

Terratest is a Go library that makes it easier to write automated tests for your infrastructure code. It provides a variety of helper functions and patterns for common infrastructure testing tasks.

---

- Support for Terraform, Packer, Kubernetes and Docker
- Validate using the Golang testing framework
- Comes with handy helper functions for e.g. HTTP requests
- Verify cloud resources by using the GO SDK functions

<small>Examples: https://github.com/gruntwork-io/terratest/</small>

---

<script id="asciicast-350621" src="https://asciinema.org/a/350621.js" async></script>

---

### Comparison

---

#### Kitchen-Terraform

- 👍 Good integration with Inspec
- 👍 Support for complex setups and tests
- 👎 Complex Configuration
- 👎 Ruby dependency management

---

#### Terratest

- 👍 Easy to learn (when you know Go)
- 👍 Support for multiple tools
- 👍 Full power of Golang testing framework
- 👎 No integration for Inspec and other test tools

---

#### 💡 Tips

- Use namespaced tests to avoid naming conflicts
- Use a sandbox account to reduce blast radius
- Build combined tests to test modules together

---

### Further prospects

- [Regula](https://github.com/fugue/regula): Convert Terraform Plan to Json and apply Rego policy rules to enforce infrastructure policies
- [Open Policy Agent](https://www.openpolicyagent.org/docs/latest/terraform/): Calculate blast radius on Terraform plan file to enforce infrastructure policies
- [Terraform Sentinal](https://www.terraform.io/docs/cloud/sentinel/index.html): Terraform embedded policy enforcement engine

{{% /section %}}
