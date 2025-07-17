
target_name ?= libmicrohttpd

include ../../Makefile.build

LIBMICROHTTPD_VERSION=1.0.2

libmicrohttpd_clone:
	if [ ! -f "libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz" ]; then curl -OL https://ftpmirror.gnu.org/libmicrohttpd/libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz; fi;
	if [ ! -d "libmicrohttpd-$(LIBMICROHTTPD_VERSION)" ]; then tar xvf libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz; fi

libmicrohttpd_config:
	( cd libmicrohttpd-$(LIBMICROHTTPD_VERSION); \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		./configure ${BSPHOST} --prefix=${BSPROOTFS} \
		--with-pic --enable-static --disable-shared \
		--disable-nls --enable-gcc-hardening \
		--disable-curl \
	)

libmicrohttpd_build:
	make -C libmicrohttpd-$(LIBMICROHTTPD_VERSION) -j ${BSPJOB}

libmicrohttpd_install:
	${BSPSUDO} make -C libmicrohttpd-$(LIBMICROHTTPD_VERSION) install

libmicrohttpd_uninstall:
	${BSPSUDO} make -C libmicrohttpd-$(LIBMICROHTTPD_VERSION) uninstall

libmicrohttpd_clean:
	@rm -rf libmicrohttpd-$(LIBMICROHTTPD_VERSION)

libmicrohttpd_distclean:
	@rm -rf libmicrohttpd-$(LIBMICROHTTPD_VERSION)
	@rm -rf libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
