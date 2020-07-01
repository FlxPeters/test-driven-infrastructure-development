
echo "### Test container via hadolint"
docker run --rm -i hadolint/hadolint < Dockerfile

echo "### Test container via container-structure-test"
container-structure-test test -i flxpeters/tdd-infra-example:latest -c tests/container-structure-test.yaml

echo "### Start test container"
docker run --rm --name tdd-example-test -d -p 8000:8000 flxpeters/tdd-infra-example:latest

echo "### Test container via curl"
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

echo "### Stop test container"
docker stop tdd-example-test
