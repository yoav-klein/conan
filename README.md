
# Conan
---
Conan is a package manager for C/C++. In this repository, we demonstrate the use of Conan.

## Infrastructure
---
With the `docker-compose.yaml` we spawn the following containers:
- `artifactory`: An Artifactory instance, in which we create a `conan-test` repository.
- `producer`: A container containing conan, in which we'll produce packages
- `consumer`: Same container, in which we'll consume the packages.

### Usage
1. Run the `setup-artifactory.sh` script. This will run the compose file plus some required setup.
2. Browse to the Artifactory web page. Change the password to `YoavKlein3` and create a repo named `conan-test`.
3. Run the `init.sh` to setup our repo as a remote in both producer and consumer containers.


## Examples
---

We want to demonstrate the following features:
1. Consume binary package
2. Produce a binary package and consume it.
3. Produce a package recipe (with `source()` method), and then consume and build it in the consumer.
4. Produce a package recipe with sources bundled, and then consume and build it in the consumer.


### Consume a binary package
For this, we use the `use_poco_example`. In this example, we consume the Poco library.

### Produce a binary package and consume it


## Producing and consuming
---

### Producer
First, we use the `producer` container to upload the `hello/0.1` package to Artifactory:

```
$ docker exec -w /project producer /project/create-hello-package.sh
```

This will create the `hello/0.1` demo package, build it, and upload to Artifactory.

### Consumer
Now, we have a small consumer project that consumes the `hello/0.1` package.

```
$ docker exec -w /project consumer /project/build.sh
```
