+++
weight = 25
+++

{{% section %}}

### Example Project

---

{{< slide background-image="/diagram/clustered_web_services_example.png" background-color="#fff">}}

---

{{< slide background-image="/diagram/clustered_web_services_example.png" class="blured" >}}

## This is not testable!

---

So, how do we build this test driven?

---

Answer:

### Divide and conquer

- Split the project in testable modules
- Test each modules in isolation
- Integrate modules and test them together

---

{{< slide background-image="/diagram/value_stream.png" background-color="#fff" class="bg-white"  >}}

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
- **Terraform Module**<br>Setup EC2 instances

{{% /section %}}
