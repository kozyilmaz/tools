
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

DEPENDS_ENABLE_ZLIB    ?= y
DEPENDS_ENABLE_OPENSSL ?= y
DEPENDS_ENABLE_CURL    ?= y

# zlib
subdir-${DEPENDS_ENABLE_ZLIB} += \
	zlib

# openssl
subdir-${DEPENDS_ENABLE_OPENSSL} += \
	openssl

# curl
subdir-${DEPENDS_ENABLE_CURL} += \
	curl


# internal depends
openssl_depends-y = \
	zlib

curl_depends-y = \
	openssl


include ../Makefile.lib
