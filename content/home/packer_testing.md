+++
weight = 40
+++

{{% section %}}

## Part 2.1

Build an test AMI with Packer

---

**Workflow**

1. Create a EC2 instance
2. Apply Ansible roles to this instance
3. Test the result
4. Convert to AMI

---

### Packer

<span class="badge tool">Build tool</span> <span class="badge">[Website](https://www.packer.io/)</span> <span class="badge">[Github](https://github.com/hashicorp/packer)</span>

> Packer is a free and open source tool for creating golden images for multiple platforms

Supports multiple platforms like AWS, Azure, GCP, VMWare and Docker.

{{% note %}}
We use Packer to build an golden image AMI for our App provisioned by our Ansible roles.
{{% /note %}}

---

### Chef Inspec

{{< figure class="float" height="120px" src="https://avatars3.githubusercontent.com/u/39202509?s=200&v=4" >}}

<span class="badge tool">Unit test</span>
<span class="badge tool">Integration test</span>
<span class="badge">[Github](https://github.com/inspec/inspec)</span>
<span class="badge">[Docs](https://www.inspec.io/)</span>

Chef InSpec is an testing framework for infrastructure with a human- and machine-readable DSL.

    describe port(80) do
        it { should_not be_listening }
    end

    describe port(443) do
        it { should be_listening }
        its('protocols') {should include 'tcp'}
    end

Provides a wide range of controls for servers and cloud providers like AWS or Azure.

---

<script id="asciicast-B2Uk82Myi4FbQSKmQ73cr5PGk" src="https://asciinema.org/a/B2Uk82Myi4FbQSKmQ73cr5PGk.js" async></script>

<small>https://asciinema.org/a/B2Uk82Myi4FbQSKmQ73cr5PGk</small>

---

#### 💡 Tips

- Add a Docker builder for local testing of Ansible playbook integration
- Packer can also be used to build Docker images
- Packer can build multi cloud images by using multiple builders
- Use the "Breakpoint Provisioner" for debugging

---

### Conclusion

- Packer is the defacto standard tool for building golden images
- Packer integrates best with with Inspec

{{% /section %}}
