"""Role testing files using testinfra."""


def test_app_container_is_running(host):

    app = host.docker("app")
    assert app.is_running


def test_port_8080_is_open(host):

    assert host.socket("tcp://0.0.0.0:8000").is_listening
