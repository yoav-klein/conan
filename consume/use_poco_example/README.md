
# Example - Consume the Poco Package


In this example, we're consuming the Poco package.


We have a `md5.cpp` file which uses the Poco MD5Engine class

## Run

1. Create a build directory
```
$ mkdir build && cd build
```

2. Install the required package
```
$ conan install ..
```

This creates a `conanbuildinfo.cmake` module that defines variables and the `conan_setup` command. This module will be included from your main CMakeLists.txt file so you'll have the information you need to use the library.


3. Run CMake
```
$ cmake ..
$ cmake --build .
```

## NOTE
You may encounter a linking error:

```
[100%] Linking CXX executable bin/md5
/usr/bin/ld: CMakeFiles/md5.dir/md5.cpp.o: in function `main':
md5.cpp:(.text+0x9d): undefined reference to `Poco::DigestEngine::digestToHex[abi:cxx11](std::vector<unsigned char, std::allocator<unsigned char> > const&)'
collect2: error: ld returned 1 exit status

```

This is because: The default Conan profile conatins:
`compiler.libcxx=libstdc++` whereas if you use GCC>=5, the compiler is using `libstdc++11`, so you need to change the default setting:

```
 conan profile update settings.compiler.libcxx=stdc++11 default
```



