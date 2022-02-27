# mymath
---

This is a demo library. The `conanfile.py` contains an attribute of `export_sources` - which 
tells conan that when we run `export` - it will export the sources along with the package recipe.

 This can help us demonstrate 2 things:
1. Upload a package recipe along with sources
2. Upload a binary package


## Build the package

```
$ conan export .
$ conan install mymath/0.1@ --build
```

## Upload the package recipe to Artifactory - no binaries

```
$ conan upload -r artifactory mymath/0.1@
```
This will upload the package recipe along with the sources. Now, the consumer can `conan install --build`
this package, so he will download the package with the sources and build it.

## Upload the package recipe along with binaries
```
$ conan upload -r artifactory mymath/0.1@ --all
```