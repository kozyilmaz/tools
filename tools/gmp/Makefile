
target_name ?= gmp

include ../../Makefile.build

GMP_VERSION="6.3.0"

gmp_clone:
	if [ ! -f "gmp-$(GMP_VERSION).tar.bz2" ]; then curl -OL https://ftpmirror.gnu.org/gmp/gmp-$(GMP_VERSION).tar.bz2; fi;
	if [ ! -d "gmp-$(GMP_VERSION)" ]; then tar xjf gmp-$(GMP_VERSION).tar.bz2; fi

gmp_config:
	( cd gmp-$(GMP_VERSION); CFLAGS="" CXXFLAGS="" ./configure --prefix=${BSPTOOLS} --with-pic --enable-cxx --enable-static --disable-shared; )

gmp_build:
	make -C gmp-$(GMP_VERSION) -j ${BSPJOB}

gmp_install:
	${BSPSUDO} make -C gmp-$(GMP_VERSION) install

gmp_uninstall:
	${BSPSUDO} make -C gmp-$(GMP_VERSION) uninstall

gmp_clean:
	@rm -rf gmp-$(GMP_VERSION)

gmp_distclean:
	@rm -rf gmp-$(GMP_VERSION)
	@rm -rf gmp-$(GMP_VERSION).tar.bz2
