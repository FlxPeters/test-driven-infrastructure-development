+++
weight = 30
+++

{{% section %}}

{{< slide class="blured light" background-image="https://images.unsplash.com/photo-1505460913785-79883ec8cf5a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80"  >}}

## Part 1.1

Build and test a Docker image

---

Dockerfile

        FROM python:alpine3.11

        RUN adduser --disabled-password --gecos '' -u 1001 app
        USER app
        WORKDIR /home/app

        COPY --chown=app:app app.py app.py

        EXPOSE 8000

        CMD [ "python3", "app.py" ]

---

### Container Structure Tests

<span class="badge">Static analysis</span> <span class="badge">[Github](https://github.com/GoogleContainerTools/container-structure-test)</span>

Validate the structure of a container image

    schemaVersion: 2.0.0

    fileExistenceTests:
    - name: "app.py"
        path: "/home/app/app.py"
        shouldExist: true
        uid: 1001

    metadataTest:
    exposedPorts: ["8000"]
    cmd: ["python3", "app.py"]
    workdir: "/home/app"

---

### Hadolint

{{< figure  class="float" height="120px" src="https://camo.githubusercontent.com/ed1547b1b7f6060ad464d180a0c28975ba876830/68747470733a2f2f6861646f6c696e742e6769746875622e696f2f6861646f6c696e742f696d672f6361745f636f6e7461696e65722e706e67" >}}

<span class="badge">Linter</span> <span class="badge">Static analysis</span> <span class="badge">[Github](https://github.com/hadolint/hadolint)</span>

A smarter Dockerfile linter that helps you build best practice Docker images

---

### Curl & Bash

<span class="badge">Unit test</span>

    docker run --rm --name tdd-example-test -d -p 8000:8000 tdd-example:latest

    attempt_counter=0
    max_attempts=5
    until $(curl --output /dev/null --silent --fail http://localhost:8000); do
        if [ ${attempt_counter} -eq ${max_attempts} ];then
        echo "Max attempts reached"
        exit 1
        fi
        echo '.'
        attempt_counter=$(($attempt_counter+1))
        sleep 5
    done

    docker stop tdd-example-test

---

### Conclusion

- Testing Docker images is possible, but rarely done
- Enforce best practice by using a linter
- Uses familiar tools to verify the behavior of images

{{% /section %}}
