
target_name ?= util-linux

include ../../Makefile.build

UTIL-LINUX_MAJOR=2
UTIL-LINUX_MINOR=40
UTIL-LINUX_MICRO=2

UTIL-LINUX_VERSION=$(UTIL-LINUX_MAJOR).$(UTIL-LINUX_MINOR).$(UTIL-LINUX_MICRO)

util-linux_clone:
	if [ ! -f "util-linux-$(UTIL-LINUX_VERSION).tar.gz" ]; then curl -OL https://www.kernel.org/pub/linux/utils/util-linux/v$(UTIL-LINUX_MAJOR).$(UTIL-LINUX_MINOR)/util-linux-$(UTIL-LINUX_VERSION).tar.gz; fi
	if [ ! -d "util-linux-$(UTIL-LINUX_VERSION)" ]; then tar xvf util-linux-$(UTIL-LINUX_VERSION).tar.gz; fi

util-linux_config:
	$(call patchme,util-linux-$(UTIL-LINUX_VERSION))
	( cd util-linux-$(UTIL-LINUX_VERSION); \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		./configure ${BSPHOST} --prefix=${BSPROOTFS} \
		--with-pic --enable-static --disable-shared \
		--disable-nls --disable-all-programs --enable-libuuid \
	)

util-linux_build:
	make -C util-linux-$(UTIL-LINUX_VERSION) -j ${BSPJOB}

util-linux_install:
	${BSPSUDO} make -C util-linux-$(UTIL-LINUX_VERSION) install

util-linux_uninstall:
	${BSPSUDO} make -C util-linux-$(UTIL-LINUX_VERSION) uninstall

util-linux_clean:
	@rm -rf util-linux-$(UTIL-LINUX_VERSION)

util-linux_distclean:
	@rm -rf util-linux-$(UTIL-LINUX_VERSION)
	@rm -rf util-linux-$(UTIL-LINUX_VERSION).tar.gz
