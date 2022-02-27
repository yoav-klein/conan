#!/bin/bash

# create the conanfile.py of the demo hello project
conan new hello/0.1

# export the package recipe to the local cache
conan export .

# build a binary package with the default profile
conan install --build=hello hello/0.1@

# upload the package recipe along with the binaries to artifactory
conan upload -r artifactory --all hello/0.1@
