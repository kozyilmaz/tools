
target_name ?= libhttpserver

include ../../Makefile.build

LIBHTTPSERVER_VERSION=0.19.0

libhttpserver_clone:
	if [ ! -d "libhttpserver-$(LIBHTTPSERVER_VERSION)" ]; then (git clone https://github.com/etr/libhttpserver.git libhttpserver-$(LIBHTTPSERVER_VERSION) && cd libhttpserver-$(LIBHTTPSERVER_VERSION) && git checkout $(LIBHTTPSERVER_VERSION)); fi

libhttpserver_config:
	$(call patchme,libhttpserver-$(LIBHTTPSERVER_VERSION))
	( cd libhttpserver-$(LIBHTTPSERVER_VERSION) && ./bootstrap && rm -rf build && mkdir build && cd build; \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
		LIBS="-lpthread" \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		../configure ${BSPHOST} --prefix=${BSPROOTFS} \
		--with-pic --enable-static --disable-shared \
	)

libhttpserver_build:
	make -C libhttpserver-$(LIBHTTPSERVER_VERSION)/build -j ${BSPJOB}

libhttpserver_install:
	${BSPSUDO} make -C libhttpserver-$(LIBHTTPSERVER_VERSION)/build install

libhttpserver_uninstall:
	${BSPSUDO} make -C libhttpserver-$(LIBHTTPSERVER_VERSION)/build uninstall

libhttpserver_clean:
	@if [ -d "libhttpserver-$(LIBHTTPSERVER_VERSION)" ]; then cd libhttpserver-$(LIBHTTPSERVER_VERSION) && git clean -dfx && git clean -dfX && git checkout * ; fi

libhttpserver_distclean:
	@rm -rf libhttpserver-$(LIBHTTPSERVER_VERSION)
