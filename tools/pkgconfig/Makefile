
target_name ?= pkgconfig

include ../../Makefile.build

PKGCONFIG_VERSION="0.29.2"

pkgconfig_clone:
	if [ ! -f "pkg-config-$(PKGCONFIG_VERSION).tar.gz" ]; then curl -OL https://pkgconfig.freedesktop.org/releases/pkg-config-$(PKGCONFIG_VERSION).tar.gz; fi;
	if [ ! -d "pkg-config-$(PKGCONFIG_VERSION)" ]; then tar xzf pkg-config-$(PKGCONFIG_VERSION).tar.gz; fi

pkgconfig_config:
	( cd pkg-config-$(PKGCONFIG_VERSION); \
		CFLAGS="-Wno-int-conversion" CXXFLAGS="" ./configure --prefix=${BSPTOOLS} -with-internal-glib --disable-host-tool; \
	)

pkgconfig_build:
	make -C pkg-config-$(PKGCONFIG_VERSION) -j ${BSPJOB}

pkgconfig_install:
	${BSPSUDO} make -C pkg-config-$(PKGCONFIG_VERSION) install

pkgconfig_uninstall:
	${BSPSUDO} make -C pkg-config-$(PKGCONFIG_VERSION) uninstall

pkgconfig_clean:
	@rm -rf pkg-config-$(PKGCONFIG_VERSION)

pkgconfig_distclean:
	@rm -rf pkg-config-$(PKGCONFIG_VERSION)
	@rm -rf pkg-config-$(PKGCONFIG_VERSION).tar.gz
