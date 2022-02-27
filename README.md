
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
3. Produce a package recipe with sources bundled, and then consume and build it in the consumer.
4. Produce a package recipe (with `source()` method), and then consume and build it in the consumer.


### Consume a binary package
For this, we use the `use_poco_example`. In this example, we consume the Poco library.

### Produce a binary package and consume it
For this, we use the `produce/mymath` - in which we produce a binary package and upload it to Artifactory.
Then, we use the `consume/use-mymath` in the consumer to consume the package from Artifactory.

### Produce a package recipe with sources bundled, and then consume and build in consumer
For this, we also use the `produce/mymath` library. In this case, we don't build a binary package, only export
the package recipe and upload it. Then, we use `consume/use-mymath` in the same way, just passing the `--build` 
flag to `conan install` to build the library from sources.

### Produce a package recipe without sources
For this, we'll use the `produce/hello-package` example. In this example, we use the `hello` demo repo.
We export the recipe, and upload it to Artifactory. Then, we consume the package with `conan install .. --build`
to build the recipe. This case is different from the previous, since in this case we pull the sources from git,
the sources are not present in the package in Artifactory.
