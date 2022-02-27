#!/bin/bash

command="conan remote add artifactory http://artifactory:8081/artifactory/api/conan/conan-test; \
conan user -p YoavKlein3 -r artifactory admin
"

docker exec consumer /bin/bash -c "eval $command"
docker exec producer /bin/bash -c "eval $command"
