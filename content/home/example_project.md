+++
weight = 25
+++

{{% section %}}

### Example Project

---

{{< slide background-image="/diagram/clustered_web_services_example.png" background-color="#fff">}}

---

{{< slide background-image="/diagram/clustered_web_services_example.png" class="blured" >}}

## How do we build this test driven?

---

### Divide and conquer

- Split the project in testable unit
- Test each unit in isolation
- Integrate units and test them together

---

{{< slide background-image="/diagram/value_stream.png" background-color="#fff"  >}}

---

{{< slide background-image="/diagram/value_stream.png" class="blured" >}}

### Part 1

- **Dockerized Python App**<br>Package App as Docker image
- **Ansible role Docker**<br>Install Docker with Ansible
- **Ansible role Application**<br>Setup App with Docker

---

{{< slide background-image="/diagram/value_stream.png" class="blured" >}}

### Part 2

- **Packer**<br>Package App and Docker to an AMI with Packer
- **Terraform Module**<br>Setup ELB, Autoscaling Group and EC2 instances
- **Terraform Deployment**<br>Deploy terraform Module to a AWS region

{{% note %}}

- Create a value stream
- This example could be easier with services like ECS. The purpose here is to demonstrate several tools from containers, to VMs and orchestration with terraform.
  {{% /note %}}

---

{{< figure src="/img/test_pyramid.png" title="IaC test pyramid" >}}

{{% note %}}

- There is no good talk about testing without a pyramid!
- Can be used for splitting up the project into smaller junks

{{% /note %}}

{{% /section %}}
