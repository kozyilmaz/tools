
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

PACKAGES_ENABLE_ZLIB    ?= y
PACKAGES_ENABLE_OPENSSL ?= y
PACKAGES_ENABLE_CURL    ?= y

# zlib
subdir-${PACKAGES_ENABLE_ZLIB} += \
	zlib

# openssl
subdir-${PACKAGES_ENABLE_OPENSSL} += \
	openssl

# curl
subdir-${PACKAGES_ENABLE_CURL} += \
	curl


# internal depends
openssl_depends-y = \
	zlib

curl_depends-y = \
	openssl


include ../Makefile.lib
