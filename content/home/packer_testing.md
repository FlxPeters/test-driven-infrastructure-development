+++
weight = 40
+++

{{% section %}}

{{< slide class="blured light" background-image="https://images.unsplash.com/photo-1505460913785-79883ec8cf5a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80"  >}}

## Part 2.1

Build an test AMI with Packer

---

### Inspec

<span class="badge">Unit test</span> <span class="badge">Integration test</span> <span class="badge">[Website](https://community.chef.io/products/chef-inspec/)</span>

Chef InSpec is an open source automated testing tool from Chef.

**Supports different levels of testing:**

- Unit Test (e.g. Json Content)
- Configuration (Files, Ports)
- Infrastructure (AWS, Azure)

---

        # Configuration
        describe port(8080) do
            it { should be_listening }
        end

        # Infrastructure
        describe aws_iam_user(username: 'test_user') do
            it { should have_mfa_enabled }
            it { should_not have_console_password }
        end

---

https://www.packer.io/docs/provisioners/inspec

---

### Conclusion

{{% /section %}}
