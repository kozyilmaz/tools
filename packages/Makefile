
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

PACKAGES_ENABLE_ZLIB       ?= y
PACKAGES_ENABLE_OPENSSL    ?= y
PACKAGES_ENABLE_CURL       ?= y
PACKAGES_ENABLE_UTIL_LINUX ?= y

# zlib
subdir-${PACKAGES_ENABLE_ZLIB} += \
	zlib

# openssl
subdir-${PACKAGES_ENABLE_OPENSSL} += \
	openssl

# curl
subdir-${PACKAGES_ENABLE_CURL} += \
	curl

# util-linux
subdir-${PACKAGES_ENABLE_UTIL_LINUX} += \
	util-linux

# internal depends
openssl_depends-y = \
	zlib

curl_depends-y = \
	openssl


include ../Makefile.lib
