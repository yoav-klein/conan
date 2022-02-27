# Package Existing Binaries

In some cases, you'll want to package pre-existing binaries. This is useful when you have binaries not built using Conan.

This is done using the `export-pkg` command.

This folder simulates this situation - we have a `lib/libhello.a` library and `include/hello.h` header.

How do we make a package out of this?

1. Create a recipe

```
$ conan new hello/0.3 --bare
```

This will create a `conanfile.py` file which doesn't include any `source()` or `build()` methods.

The `package_info` method, as provided by default, defines header files in the `include` directory, libraries in the `lib` directory and binaries in the `bin` directory.

That means that files in the `include` directory will be provided as headers to the consumers in the `conanbuildinfo.cmake` file.

2. Run export-pkg to create the package:

```
$ conan export-pkg . [-s os=<os>] [-s arch=<arch>] ...
```

This will create the package with the given settings (if not provided the default profile will be used of course). What this means is that the package created by this run of `export-pkg` will be usable by clients with those settings.

3. Test the package

To see that our package is installed properly:

```
$ cd test
$ mkdir build && cd build
$ conan install ..
$ cmake ..
$ cmake --build
```