
target_name ?= autoconf

include ../../Makefile.build

AUTOCONF_VERSION="2.72"

autoconf_clone:
	if [ ! -f "autoconf-$(AUTOCONF_VERSION).tar.gz" ]; then curl -OL https://ftpmirror.gnu.org/autoconf/autoconf-$(AUTOCONF_VERSION).tar.gz; fi
	if [ ! -d "autoconf-$(AUTOCONF_VERSION)" ]; then tar xzf autoconf-$(AUTOCONF_VERSION).tar.gz; fi

autoconf_config:
	( cd autoconf-$(AUTOCONF_VERSION); ./configure --prefix=${BSPTOOLS} )

autoconf_build:
	make -C autoconf-$(AUTOCONF_VERSION) -j ${BSPJOB}

autoconf_install:
	${BSPSUDO} make -C autoconf-$(AUTOCONF_VERSION) install

autoconf_uninstall:
	${BSPSUDO} make -C autoconf-$(AUTOCONF_VERSION) uninstall

autoconf_clean:
	@rm -rf autoconf-$(AUTOCONF_VERSION)

autoconf_distclean:
	@rm -rf autoconf-$(AUTOCONF_VERSION)
	@rm -rf autoconf-$(AUTOCONF_VERSION).tar.gz
