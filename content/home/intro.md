+++
weight = 20
+++

{{% section %}}

## Infrastructure <br>as <br>Code

---

{{< slide background-image="https://images.unsplash.com/photo-1582854050148-651d87fa3319?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" >}}

## Expectation

---

{{< slide background-image="https://images.pexels.com/photos/861464/pexels-photo-861464.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260" >}}

## Reality

---

Testing is the way to success

> Code without tests is broken by design.

<small>[Jacob](https://jacobian.org/)</small>

---

{{< slide background-image="/diagram/clustered_web_services_example.png" background-color="#fff">}}

---

{{< slide background-image="/diagram/clustered_web_services_example.png" class="blured" >}}

## How do we build this test driven?

---

{{< slide class="blured light" background-image="https://images.unsplash.com/photo-1505461397380-71e1c7570998?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80"  >}}

### Divide and conquer

- Split the project in testable unit
- Test each unit in isolation
- Integrate units and test them together

---

{{< slide background-image="/diagram/value_stream.png" background-color="#fff"  >}}

---

{{< slide background-image="/diagram/value_stream.png" class="blured" >}}

- **Dockerized Python App**<br>Package App as Docker image
- **Ansible role Docker**<br>Install Docker with Ansible
- **Ansible role Application**<br>Setup App with Docker

---

{{< slide background-image="/diagram/value_stream.png" class="blured" >}}

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
