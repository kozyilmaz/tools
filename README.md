# GNU Tools for macOS/Linux

This repository builds most used GNU tools for macOS and Linux from scratch without requiring any dependencies  
Optionally, it can be used to compile static libraries of commonly used GNU packages and create development SDK's for various architectures like Linux, macOS, iOS (`x86_64` and `ios64`), Android (`arm64-v8a`) and Windows (`mingw-64`)  
No additional dependency required except Xcode Command Line Tools for macOS and compiler suites for respective platforms  
All build tools are compiled from scratch with native macOS `clang` and *nix `gcc`  

### Available Tools
```
autoconf
automake
libtool    (prefixed with 'g')
pkg-config
cmake
gmp        (only as static library)
mpfr       (only as static library)
mpc        (only as static library)
isl        (only as static library)
gcc        (suffixed with '-gnu')
```

### Available Packages
```
zlib
openssl
curl
```

### Build instructions
```shell
# run once to install Xcode CLI tools for macOS
$ xcode-select --install

# clone and build tools for native platform
$ git clone https://github.com/kozyilmaz/tools.git
$ cd tools
$ source environment
$ make

# compile packages for a specific arch
$ source environment [optional: ios-arm64, ios-sim, android-arm64-v8a, android-armeabi-v7a, android-x86_64, mingw-w64]
$ make packages
```

### Fine Tuning and Debugging
```shell
# console logs will be enabled via PRINT_DEBUG
$ cd tools
$ source environment
$ PRINT_DEBUG=y make all

# environment file can be edited to increase/decrease parallel jobs (default autodetect)
BSPJOB=4

# environment file can be edited to select/unselect tools:
export TOOLS_ENABLE_ESSENTIALS=y
export TOOLS_ENABLE_CMAKE=y
export TOOLS_ENABLE_GCC=y
```

### Providing Multi-Platform Build Options
* [How to use 'tools' as a build system (as a subtree), to compile GNU tools/create SDKs for various architectures?](documents/README.multi.md)
