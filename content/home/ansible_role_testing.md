+++
weight = 40
+++

{{% section %}}

## Part 1.2

Testing Ansible roles

---

### Molecule

{{< figure class="float" height="120px" src="https://molecule.readthedocs.io/en/latest/_static/images/logo_invert.png" >}}

<span class="badge tool">Test Framework</span>
<span class="badge">[Github](https://github.com/ansible-community/molecule)</span>
<span class="badge">[Docs](https://molecule.readthedocs.io/en/latest/)</span>

Modular framework for testing Ansible roles in many scenarios and distributions

**Drivers:** <br>Ansible, Docker, Podman, Vagrant, Cloud providers

**Verifiers:** <br>Ansible-Lint, yamllint, Ansible, Inspec, Testinfra, Goss

---

### Workflow

1. Install dependencies via Ansible Galaxy
2. Lint the Ansible role code
3. **Prepare**: Start one ore more test instances using a driver and apply prepare steps
4. **Converge**: Apply the role via an Ansible playbook
5. Run the playbook again to ensure idempotence
6. **Verify**: Run one or more verifiers
7. Cleanup

---

### Ansible Lint

<span class="badge tool">Linter</span>
<span class="badge">[Github](https://github.com/ansible/ansible-lint)</span>

Checks playbooks for practices and behaviour that could potentially be improved.

    $ ansible-lint geerlingguy.apache

    [502] All tasks should be named
    /Users/chouseknecht/.ansible/roles/geerlingguy.apache/tasks/main.yml:29
    Task/Handler: include_vars apache-22.yml

---

### yamllint

<span class="badge tool">Linter</span>
<span class="badge">[Github](https://github.com/adrienverge/yamllint)</span>
<span class="badge">[Example](https://github.com/geerlingguy/ansible-role-docker/blob/master/.yamllint)</span>

A linter for YAML files. <br> Enforce best practices and formats for yaml files.

{{< figure src="https://raw.githubusercontent.com/adrienverge/yamllint/master/docs/screenshot.png" >}}

---

### Ansible as verifier

<span class="badge tool">Unit test</span>
<span class="badge tool">Integration test</span>
<span class="badge">[Github](https://github.com/aelsabbahy/goss)</span>

Use ansible facts and modules and assert as test driver.

    - name: Populate service facts
      service_facts:

    - name: Assert services are running
      assert:
        that:
          - ansible_facts.services['docker.service'].state == 'running'

    - name: Check Cadvisor web is available
      uri: url="http://localhost:8089/containers/" status_code=[200]
      register: result
      until: result.status == 200
      retries: 60
      delay: 1

---

### Testinfra

{{< figure class="float" height="120px" src="https://testinfra.readthedocs.io/en/latest/_static/logo.svg" >}}

<span class="badge tool">Unit test</span>
<span class="badge">[Github](https://github.com/philpep/testinfra)</span>
<span class="badge">[Docs](https://testinfra.readthedocs.io/en/latest/)</span>

With Testinfra you can write unit tests in **Python** to **test actual state of your servers**.

    def test_nginx_is_installed(host):
        nginx = host.package("nginx")
        assert nginx.is_installed
        assert nginx.version.startswith("1.2")

    def test_nginx_running_and_enabled(host):
        nginx = host.service("nginx")
        assert nginx.is_running
        assert nginx.is_enabled

Make use of the well known pytest framework. Inspired by Serverspec.

---

### Goss

<span class="badge tool">Unit test</span>
<span class="badge">[Github](https://github.com/aelsabbahy/goss)</span>

Goss is a simple YAML based tool for validating a server’s configuration. Allows generating tests from current system status. No coding required.

    $ cat goss.yaml
    port:
        tcp:22:
            listening: true
            ip:
            - 0.0.0.0
    service:
        sshd:
            enabled: true
            running: true

Can also be used for verifying docker images!

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

### Molecule conclusion

- Testing Ansible roles is a solved problem
- Use molecule as Ansible's native testing framework
- Use one ore more linter
- Use the verifier you like best
- Testing in docker is fast but can be complicated

{{% /section %}}
