# GNU Tools for macOS

This repository builds most used GNU tools for macOS  
No additional dependency required except Xcode Command Line Tools  
All build tools are compiled from scratch with native macOS `clang`  

### Available packages
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
gcc        (suffixed with version)
```

### Build instructions
```shell
# run once to install Xcode CLI tools
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

# environment file can be edited to increase/decrease parallel jobs
BSPJOB=4

# environment file can be edited to select/unselect packages:
export TOOLS_ENABLE_ESSENTIALS=y
export TOOLS_ENABLE_CMAKE=y
export TOOLS_ENABLE_GCC=y
```


## Multi-platform build environment
Besides compiling GNU tools for macOS, this repository may be used to provide multi-platform build options for Linux, macOS, iOS (`x86_64` and `ios64`) and Android (`arm64-v8a` ABI)  
In that scenario `tools` should be a subdirectory in a bigger project and the preferred way to do is including `tools` as a git subtree.

```sh
# add tools as subtree
$ git remote add tools https://github.com/kozyilmaz/tools.git
$ git subtree add --prefix=tools/ --squash tools master
# check tools subtree updates
$ git fetch https://github.com/kozyilmaz/tools.git master
$ ./contrib/devtools/git-subtree-check.sh tools
# sync tools subtree with tools/master
$ git remote add tools-remote https://github.com/kozyilmaz/tools.git
$ git subtree pull --prefix=tools/ --squash tools-remote master
```

Alternatively `Makefile` targets like below can be used to keep track (check/update) of the `tools` subtree easily  
```
tools-check:
	@echo "  CHECK      tools"
	@git fetch https://github.com/kozyilmaz/tools.git master
	@$(TOPDIR)/tools/contrib/devtools/git-subtree-check.sh tools

tools-update:
	@echo "  UPDATE     tools"
ifeq ($(shell git remote -v |grep '\<tools-remote\>'),)
	@git remote add tools-remote https://github.com/kozyilmaz/tools.git
else
	@git remote set-url tools-remote https://github.com/kozyilmaz/tools.git
endif
	@git subtree pull --prefix=tools/ --squash tools-remote master
```

Assuming `tools` is in the top directory of the project (`$PROJECT_DIR/tools`), then a shim `environment` file should be created in `$PROJECT_DIR` (example below)  
```
#!/bin/sh

# usage: source environment [optional: ios-arm64, ios-sim, android-arm64-v8a, android-armeabi-v7a, android-x86_64]
source tools/environment $1
```

### Linux and macOS
```sh
$ source environment
$ make all
# for debugging
$ PRINT_DEBUG=y make all
```
Output directory will be `$PROJECT_DIR/rootfs/x86_64`

### iOS
```sh
$ source environment ios-arm64
$ make all
# for debugging
$ PRINT_DEBUG=y make all
```
Output directory will be `$PROJECT_DIR/rootfs/ios-arm64`

### iOS Simulator
```sh
$ source environment ios-sim
$ make all
# for debugging
$ PRINT_DEBUG=y make all
```
Output directory will be `$PROJECT_DIR/rootfs/ios-sim`

### Android (arm64-v8a, armeabi-v7a)
Please refer to [Android NDK README](https://developer.android.com/ndk/guides/other_build_systems) for `$NDK` and `$HOST_TAG` variables
```sh
$ export ANDROID_NDK=$PATH_TO_NDK
$ export ANDROID_HOST_TAG=$HOST_TAG
$ source environment android-$ANDROID_ABI
$ make all
# for debugging
$ PRINT_DEBUG=y make all
```
Output directory will be `$PROJECT_DIR/rootfs/android-$ANDROID_ABI`

