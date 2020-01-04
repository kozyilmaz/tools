
target_name ?= gnugcc

include ../Makefile.build

GCC_VERSION="9.2.0"

ifeq      ($(HOST_PLATFORM),WINDOWS)
HOST_GCC_FLAGS =
else ifeq ($(HOST_PLATFORM),LINUX)
HOST_GCC_FLAGS =
else ifeq ($(HOST_PLATFORM),MACOS)
HOST_GCC_FLAGS = --with-sysroot=$(shell xcrun --sdk macosx --show-sdk-path) --with-native-system-header-dir=/usr/include
endif

gnugcc_clone:
	if [ ! -f "gcc-$(GCC_VERSION).tar.gz" ]; then curl -OL https://ftpmirror.gnu.org/gcc/gcc-$(GCC_VERSION)/gcc-$(GCC_VERSION).tar.gz; fi;
	if [ ! -d "gcc-$(GCC_VERSION)" ]; then tar xzf gcc-$(GCC_VERSION).tar.gz; fi

gnugcc_config:
	( cd gcc-$(GCC_VERSION); \
		CFLAGS="" CXXFLAGS="" \
		./configure --prefix=${BSPTOOLS} \
		--with-gmp=${BSPTOOLS} \
		--with-mpfr=${BSPTOOLS} \
		--with-mpc=${BSPTOOLS} \
		--with-isl=${BSPTOOLS} \
		--enable-checking=release \
		--enable-languages=c,c++ \
		--disable-multilib \
		--disable-nls \
		--program-suffix=-$(GCC_VERSION) \
		$(HOST_GCC_FLAGS) \
	)

gnugcc_build:
	make -C gcc-$(GCC_VERSION) -j ${BSPJOB}

gnugcc_install:
	${BSPSUDO} make -C gcc-$(GCC_VERSION) install

gnugcc_uninstall:
	${BSPSUDO} make -C gcc-$(GCC_VERSION) uninstall

gnugcc_clean:
	rm -rf gcc-$(GCC_VERSION)

gnugcc_distclean:
	rm -rf gcc-$(GCC_VERSION)
	rm -rf gcc-$(GCC_VERSION).tar.gz
