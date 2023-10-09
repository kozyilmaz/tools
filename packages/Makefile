
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

PACKAGES_ENABLE_ZLIB           ?= y
PACKAGES_ENABLE_OPENSSL        ?= y
PACKAGES_ENABLE_CURL           ?= y
PACKAGES_ENABLE_UTIL_LINUX     ?= y
PACKAGES_ENABLE_LIBMICROHTTPD  ?= y
PACKAGES_ENABLE_LIBHTTPSERVER  ?= y
PACKAGES_ENABLE_PROMETHEUS     ?= y
PACKAGES_ENABLE_SECP256K1      ?= y
PACKAGES_ENABLE_MPC_LIB        ?= y

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

# libmicrohttpd
subdir-${PACKAGES_ENABLE_LIBMICROHTTPD} += \
	libmicrohttpd

# libhttpserver
subdir-${PACKAGES_ENABLE_LIBHTTPSERVER} += \
	libhttpserver

# prometheus
subdir-${PACKAGES_ENABLE_PROMETHEUS} += \
	prometheus

# secp256k1
subdir-${PACKAGES_ENABLE_SECP256K1} += \
	secp256k1

# mpc-lib
subdir-${PACKAGES_ENABLE_MPC_LIB} += \
	mpc-lib

# internal depends
openssl_depends-y = \
	zlib

curl_depends-y = \
	openssl

libmicrohttpd_depends-y = \
	curl

libhttpserver_depends-y = \
	libmicrohttpd

prometheus_depends-y = \
	zlib \
	openssl \
	curl

mpc-lib_depends-y = \
	openssl \
	util-linux \
	secp256k1

include ../Makefile.lib
