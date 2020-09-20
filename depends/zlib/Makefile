
target_name ?= zlib

include ../../Makefile.build

ZLIB_VERSION=1.2.11

zlib_clone:
	if [ ! -f "zlib-$(ZLIB_VERSION).tar.gz" ]; then curl -OL https://www.zlib.net/zlib-$(ZLIB_VERSION).tar.gz; fi
	if [ ! -d "zlib-$(ZLIB_VERSION)" ]; then tar xzf zlib-$(ZLIB_VERSION).tar.gz; fi

zlib_config:
	( cd zlib-$(ZLIB_VERSION); \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		./configure ${BSPHOST} --prefix=${BSPROOTFS} \
		--const --static \
	)

zlib_build:
	make -C zlib-$(ZLIB_VERSION) -j ${BSPJOB}

zlib_install:
	make -C zlib-$(ZLIB_VERSION) install

zlib_uninstall:
	make -C zlib-$(ZLIB_VERSION) uninstall

zlib_clean:
	rm -rf zlib-$(ZLIB_VERSION)

zlib_distclean:
	rm -rf zlib-$(ZLIB_VERSION)
	rm -rf zlib-$(ZLIB_VERSION).tar.gz
