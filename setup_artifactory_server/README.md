
# Setup an Artifactory Server
---

You can run an Artifactory instance (Community Edition) and use Conan repositories to host your packages.

## Run an Artifacotry instance
You have a script here `setup_artifactory.sh`, just run it, and it will run a Docker container
with an Artifactory instance. It will create a local directory and bind mount to it, so data will be preserved
from one run to another.

The server listends on port 8081 for REST API, and 8082 for GUI.

NOTE: In the _Custom Base URL_ setting, just leave it blank.

## Setup a Repository
Browse to the Artifactory server on port 8082, and create a Conan type repository, call it `conan-test`.

## Setup the client
In order to communicate with the server, you need to configure a remote in your client:
```
$ conan remote add my-artifactory http://<server_ip>:8081/artifactory/api/conan/conan-test
```

## Upload packages
Assuming you have a package `hello/0.1`. You can upload the package with `conan upload`.

### Upload the recipe only
The most basic command just uploads the package recipe:
```
$ conan upload -r my-artifactory hello/0.1
```

This will only upload the package recipe.

### Upload binary package
In order to upload a binary package, specify the Package ID after the reference:

```
$  conan upload -r my-artifactory hello/0.1:50a5030bbbb13ae56bc4be41915ecd48549cb895
```

### Upload all binary packages
You can also upload all binary packages of a package:
```
$ conan upload -r my-artifactory --all hello/0.1
```



