""" Test docker is installed an can run images """


def test_is_docker_installed(host):
    package_docker = host.package("docker-ce")

    assert package_docker.is_installed


def test_run_hello_world_container_successfully(host):
    hello_world_ran = host.run("docker run hello-world")

    assert "Hello from Docker!" in hello_world_ran.stdout

