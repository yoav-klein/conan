
# Creating a Package Demo

This document contains instructions for a Hello-world level package creation.

We'll be using the `Hello` git repo for this demo. This repo contains a simple C++ library that we'll package into a Conan package.

1. First, we'll use the `conan new` helper command:

```
$ conan new hello/0.1 -t
```

The `-t` flag is used to generate a test_package directory. This is a simulation for a consuming client to see that our package is ok.


Now we have the following structure:

```
|── conanfile.py
├── README.md
└── test_package
    ├── CMakeLists.txt
    ├── conanfile.py
    └── example.cpp

```

The `conanfile.py` is what defines our package. You can see it defines methods for retrieving the source, building and packaging.

2. Create the package. <br>

Now we want to install the package. This can be done using the `conan create` command. Let's see it and then we'll do it more manually:

```
$ conan create . [user/channel]
```

This will install do the followings:
- `export` the recipe (copy it to the local cache ~/.conan/data/hello/0.1/export)
- Install the package, forcing it to be built from sources.
- Run the tests

Another way of doing the same thing is:

```
# in the root folder
$ conan export .
$ conan install hello/0.1@ --build
$ conan test test_package hello/0.1
```

Explanation:
1. `conan export` copies the recipe file to the local cache. This is always the first step of creating a package.
2. `conan install` can take either a path to a file (like `conanfile.txt` or `conanfile.py`) or a _reference_. In this case, we give it a reference to our recipe we've just exported.  The `--build` tells conan install to execute the `build` method (and also the `source` I guess). In this stage, our package is already installed.

## Test
The `conan new -t` command generated a `test_package` folder for us. It contains a simple example consuming project that will link with our package.

Note few points: 
- The `conanfile.py` of this folder doesn't contain a `package` method, nor version and name, since we're not creating a package here. 
- The `test` method runs the executable.
- the `imports` method copies shared libraries from the `lib` folder  of the package (or `bin` in case of dlls) to the `bin` folder of this "package". This is for dynamic linking.
- Note that the conanfile.py doesn't contain any reference to our tested package. This is done automatically by the `conan test` command..

### conan test
The `conan test` command is of the form: 
```
conan test <path_to_test_folder> <package_reference>
```
The folder should contain a `conanfile.py` that defines the `test` method (and maybe some others..) This command inserts the _package_reference_ to the conanfile.py to the `requires` field.

You can test the package with other options, such as using dynamic linking as such:

```
$ conan test test_package demo/0.1 -o hello:shared=True
```


## View the installed binary packages.
You can see the installed binary packages for this reference.
```
$ conan search hello/0.1@
Existing packages for recipe hello/0.1:

    Package_ID: b911f48570f9bb2902d9e83b2b9ebf9d376c8c56
        [options]
            fPIC: True
            shared: False
        [settings]
            arch: x86_64
            build_type: Release
            compiler: gcc
            compiler.libcxx: libstdc++11
            compiler.version: 9
            os: Linux
        Outdated from recipe: False



```

In this case, you see that we have only one binary package for this reference, which has the settings x86_64, Release, gcc, etc.

## Build the package with different configuration
We can also build the package with different settings and produce another binary package. Let's run `conan install --build` with the clang profile.

```
$ conan install hello/0.1@ --build -pr clang
```

If we now run `conan search` we'll get:

```
Package_ID: 66a6f7f469b857b2375b756c6b63014aab71b2dd
        [options]
            fPIC: True
            shared: False
        [settings]
            arch: x86_64
            compiler: clang
            compiler.version: 10
            os: Linux
        Outdated from recipe: False

Package_ID: b911f48570f9bb2902d9e83b2b9ebf9d376c8c56
        [options]
            fPIC: True
            shared: False

```
