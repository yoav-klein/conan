
# Sources and Recipe in Same Reopsitory

In the `create_hello_package` example, we've used sources from git. This is a typical use-case when you want to pack third-party libraries.

When packaging your own code, you'll have the conanfile.py and the sources in the same repo. In that case, we'll use the `export_sources` field.

The tree in this directory was created by running 
```
$ conan new hello/0.2 -t -s
```
The `-s` stands for sources.

Now take a look at the conanfile.py, you can see it includes a `export_sources` attribute. This directory will be copied to the `export_source` directory in the local cache before it will be built.

Now create the package as in the previous example:

```
$ conan create .
```

Or
```
$ conan export // this will export both the recipe and the sources
$ conan install hello/0.2@ --build
```

You can see that the sources are at:
```
~/.conan/data/hello/0.2/_/_/source/src/
```