
target_name ?= isl

include ../../Makefile.build

ISL_VERSION="0.25"

isl_clone:
	if [ ! -f "isl-$(ISL_VERSION).tar.gz" ]; then curl -OL https://libisl.sourceforge.io/isl-$(ISL_VERSION).tar.gz; fi;
	if [ ! -d "isl-$(ISL_VERSION)" ]; then tar xzf isl-$(ISL_VERSION).tar.gz; fi

isl_config:
	( cd isl-$(ISL_VERSION); CFLAGS="" CXXFLAGS="" ./configure --prefix=${BSPTOOLS} --with-gmp-prefix=${BSPTOOLS} --enable-static --disable-shared; )

isl_build:
	make -C isl-$(ISL_VERSION) -j ${BSPJOB}

isl_install:
	${BSPSUDO} make -C isl-$(ISL_VERSION) install

isl_uninstall:
	${BSPSUDO} make -C isl-$(ISL_VERSION) uninstall

isl_clean:
	rm -rf isl-$(ISL_VERSION)

isl_distclean:
	rm -rf isl-$(ISL_VERSION)
	rm -rf isl-$(ISL_VERSION).tar.gz
