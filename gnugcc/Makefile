
target_name ?= gnugcc

include ../Makefile.build

GCC_VERSION="8.3.0"

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
		--with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk \
		--with-native-system-header-dir=/usr/include \
		--program-suffix=-$(GCC_VERSION); \
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
