# GNU Tools for macOS/Linux

This repository builds most used GNU tools for macOS and Linux  
No additional dependency required except Xcode Command Line Tools for macOS  
All build tools are compiled from scratch with native macOS `clang` and Linux `gcc`  

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

### Build instructions
```shell
# run once to install Xcode CLI tools for macOS
$ xcode-select --install

# clone and build tools
$ git clone https://github.com/kozyilmaz/tools.git
$ cd tools
$ source environment
$ make
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
* [How to include and use 'tools' as a build system and compile GNU tools and packages for various architectures?](documents/README.multi.md)
