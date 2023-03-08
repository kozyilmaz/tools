
target_name ?= openssl

include ../../Makefile.build

OPENSSL_MAJOR=3
OPENSSL_MINOR=0
OPENSSL_MICRO=8
OPENSSL_LETTER=

OPENSSL_VERSION=$(OPENSSL_MAJOR).$(OPENSSL_MINOR).$(OPENSSL_MICRO)$(OPENSSL_LETTER)

ifeq      (${BSPPLATFORM},ios-arm64)
OPENSSL_PLT = ios64-xcrun
else ifeq (${BSPPLATFORM},ios-sim)
OPENSSL_PLT = iossimulator-xcrun
else ifeq (${BSPPLATFORM},android-arm64-v8a)
OPENSSL_PLT = android-arm64 -D__ANDROID_API__=21
else ifeq (${BSPPLATFORM},android-armeabi-v7a)
OPENSSL_PLT = android-arm -D__ANDROID_API__=21
else ifeq (${BSPPLATFORM},android-x86_64)
OPENSSL_PLT = android-x86_64 -D__ANDROID_API__=21
else ifeq (${BSPPLATFORM},mingw-w64)
OPENSSL_PLT = --cross-compile-prefix=x86_64-w64-mingw32- mingw64
else ifeq (${BSPPLATFORM},arm64)
# native arm64
ifeq      ($(HOST_PLATFORM),WINDOWS)
else ifeq ($(HOST_PLATFORM),MACOS)
OPENSSL_PLT = darwin64-arm64-cc
else ifeq ($(HOST_PLATFORM),LINUX)
OPENSSL_PLT = linux-aarch64
endif
else ifeq (${BSPPLATFORM},x86_64)
# native x64_64
ifeq      ($(HOST_PLATFORM),WINDOWS)
else ifeq ($(HOST_PLATFORM),MACOS)
OPENSSL_PLT = darwin64-x86_64-cc
else ifeq ($(HOST_PLATFORM),LINUX)
OPENSSL_PLT = linux-x86_64
endif
endif

# point OpenSSL cert and cnf directory to the native platform
OPENSSL_DIR = /etc/ssl

openssl_clone:
	if [ ! -f "openssl-$(OPENSSL_VERSION).tar.gz" ]; then curl -OL https://www.openssl.org/source/openssl-$(OPENSSL_VERSION).tar.gz; fi
	if [ ! -d "openssl-$(OPENSSL_VERSION)" ]; then tar xvf openssl-$(OPENSSL_VERSION).tar.gz; fi

openssl_config:
	$(call patchme,openssl-$(OPENSSL_VERSION))
	( cd openssl-$(OPENSSL_VERSION); \
		CFLAGS="" CXXFLAGS="" LDFLAGS="" \
		./Configure $(OPENSSL_PLT) ${BSPEXTRAFLAGS} --prefix=${BSPROOTFS} \
		--openssldir=$(OPENSSL_DIR) \
		no-asm no-shared  \
		no-hw no-dso no-engine \
		no-ssl no-dtls \
		no-tls1 no-tls1_1 \
		no-weak-ssl-ciphers \
		--with-zlib-include=${BSPROOTFS}/include \
		--with-zlib-lib=${BSPROOTFS}/lib \
	)

openssl_build:
	make -C openssl-$(OPENSSL_VERSION) -j ${BSPJOB}

openssl_install:
	${BSPSUDO} make -C openssl-$(OPENSSL_VERSION) install_sw

openssl_uninstall:
	${BSPSUDO} make -C openssl-$(OPENSSL_VERSION) uninstall_sw

openssl_clean:
	rm -rf openssl-$(OPENSSL_VERSION)

openssl_distclean:
	rm -rf openssl-$(OPENSSL_VERSION)
	rm -rf openssl-$(OPENSSL_VERSION).tar.gz
