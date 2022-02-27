#!/bin/bash

# create the conanfile.py of the demo hello project
conan new hello/0.1

# export the package recipe to the local cache
conan export .

# upload the package recipe to Artifactory
conan upload -r artifactory hello/0.1@
