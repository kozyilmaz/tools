# Multi-platform build environment
Besides compiling GNU tools for macOS, this repository may be used to provide multi-platform build options for Linux, macOS, iOS (`x86_64` and `ios64`) and Android (`arm64-v8a` ABI)  
In that scenario `tools` should be a subdirectory in a bigger project and the preferred way to do is including `tools` as a git subtree.

```sh
# add tools as subtree
$ git remote add tools https://github.com/kozyilmaz/tools.git
$ git subtree add --prefix=tools/ --squash tools master
# check tools subtree updates
$ git fetch https://github.com/kozyilmaz/tools.git master
$ ./scripts/git-subtree-check.sh tools
# sync tools subtree with tools/master
$ git remote add tools-remote https://github.com/kozyilmaz/tools.git
$ git subtree pull --prefix=tools/ --squash tools-remote master
```

### Creating top-level Makefile targets/rules
Alternatively `Makefile` targets can be used to keep track (check/update) of the `tools` subtree  
In addition, a build dependency for `tools` can be added on top of the project `Makefile`  

Below is a template for the top-level `Makefile` for a project that wants to use `tools`

```sh
ifeq ($(BSPROOT),)
    $(error You must first run 'source environment')
endif

TOOLSGOALS := clean distclean
ifeq ($(filter $(TOOLSGOALS),$(MAKECMDGOALS)),)
# check if 'tools' is already built, if not, add to subdir
ifeq ($(shell if [ -e $(BSPTOOLS)/version.txt ]; then cat $(BSPTOOLS)/version.txt | cut -d '-' -f 1; fi),)
subdir-y += tools
endif
else
# add tools for 'clean' and 'distclean' anyway
subdir-y += tools
endif

subdir-${ANY_ENV_VAR} += \
	tools/packages \
	package_dir_to_be_built

include Makefile.lib

tools-check:
	@echo "  CHECK      tools"
	@git fetch https://github.com/kozyilmaz/tools.git master
	@$(TOPDIR)/tools/scripts/git-subtree-check.sh tools

tools-update:
	@echo "  UPDATE     tools"
ifeq ($(shell git remote -v |grep '\<tools-remote\>'),)
	@git remote add tools-remote https://github.com/kozyilmaz/tools.git
else
	@git remote set-url tools-remote https://github.com/kozyilmaz/tools.git
endif
	@git subtree pull --prefix=tools/ --squash tools-remote master

clone:
	@true

config:
	@true

build:
	@true

install:
	@true

uninstall:
	@true

clean:
	@true

distclean: clean
	@true
```


### Creating top-level environment file
Assuming `tools` is in the top directory of the project (`$PROJECT_DIR/tools`), then a shim `environment` file should be created in `$PROJECT_DIR` (example below)  
```sh
#!/bin/sh

# usage: source environment [optional: ios-arm64, ios-sim, android-arm64-v8a, android-armeabi-v7a, android-x86_64]
source tools/environment $1
```


Packages can be selected on/off via top-level environment file
```sh
#!/bin/sh

# usage: source environment [optional: ios-arm64, ios-sim, android-arm64-v8a, android-armeabi-v7a, android-x86_64, mingw-w64]
source tools/environment $1

# tools selection
export TOOLS_ENABLE_ESSENTIALS=y
export TOOLS_ENABLE_CMAKE=y
export TOOLS_ENABLE_GCC=n

# depends selection
export PACKAGES_ENABLE_ZLIB=y
export PACKAGES_ENABLE_OPENSSL=y
export PACKAGES_ENABLE_CURL=y
```


## Providing build options

### Linux and macOS
```sh
$ source environment
$ make all
# for debugging
$ PRINT_DEBUG=y make all
```
Output directory will be `$PROJECT_DIR/release/x86_64`

### iOS
```sh
$ source environment ios-arm64
$ make all
# for debugging
$ PRINT_DEBUG=y make all
```
Output directory will be `$PROJECT_DIR/release/ios-arm64`

### iOS Simulator
```sh
$ source environment ios-sim
$ make all
# for debugging
$ PRINT_DEBUG=y make all
```
Output directory will be `$PROJECT_DIR/release/ios-sim`

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
Output directory will be `$PROJECT_DIR/release/android-$ANDROID_ABI`

