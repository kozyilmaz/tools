
target_name ?= mpfr

include ../../Makefile.build

MPFR_VERSION="4.2.2"

mpfr_clone:
	if [ ! -f "mpfr-$(MPFR_VERSION).tar.gz" ]; then curl -OL https://ftpmirror.gnu.org/mpfr/mpfr-$(MPFR_VERSION).tar.gz; fi;
	if [ ! -d "mpfr-$(MPFR_VERSION)" ]; then tar xzf mpfr-$(MPFR_VERSION).tar.gz; fi

mpfr_config:
	( cd mpfr-$(MPFR_VERSION); CFLAGS="" CXXFLAGS="" ./configure --prefix=${BSPTOOLS} --with-gmp=${BSPTOOLS} --enable-static --disable-shared; )

mpfr_build:
	make -C mpfr-$(MPFR_VERSION) -j ${BSPJOB}

mpfr_install:
	${BSPSUDO} make -C mpfr-$(MPFR_VERSION) install

mpfr_uninstall:
	${BSPSUDO} make -C mpfr-$(MPFR_VERSION) uninstall

mpfr_clean:
	@rm -rf mpfr-$(MPFR_VERSION)

mpfr_distclean:
	@rm -rf mpfr-$(MPFR_VERSION)
	@rm -rf mpfr-$(MPFR_VERSION).tar.gz
