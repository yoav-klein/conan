
# Produce and Consume
---

In this example, we want to demonstrate how to create a package, upload it to Artifactory,
and then consume it by a consumer project.

## Infrastructure
---
### docker-compose.yaml
We have a compose file which includes 3 services: Artifactory server, producer and consumer.
The producer produces Conan packages, while the consumer consumes them.

### setup-artifactory.sh
This script creates a directory for the artifactory data which will be used by the
Artifactory container, so the data will survive across runs.

Then, it will run `docker-compose up` to start the containers

### Setting up Artifactory
- Change the password to `YoavKlein3`.
- Open a repo of name `conan-test`


### Setting up consumer and producer
In the consumer and producer directories, you have the `setup-conan.sh` script
which will set up our Artifactory instance as a remote. Run this script in both
containers.


## Proucing and consuming
---

### Producer
First, we use the `producer` container to upload the `hello/0.1` package to Artifactory:

```
$ docker exec producer -w /project /project/create-hello-package.sh
```

This will create the `hello/0.1` demo package, build it, and upload to Artifactory.

### Consumer
Now, we have a small consumer project that consumes the `hello/0.1` package.

```
$ docker exec consumer -w /project /project/build.sh
```
