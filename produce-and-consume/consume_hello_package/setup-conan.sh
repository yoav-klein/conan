#!/bin/bash

conan remote add artifactory http://artifactory:8081/artifactory/api/conan/conan-test
conan user -p YoavKlein3 -r artifactory admin
