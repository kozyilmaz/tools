
target_name ?= libtool

include ../../Makefile.build

LIBTOOL_VERSION="2.5.4"

libtool_clone:
	if [ ! -f "libtool-$(LIBTOOL_VERSION).tar.gz" ]; then curl -OL https://ftpmirror.gnu.org/libtool/libtool-$(LIBTOOL_VERSION).tar.gz; fi;
	if [ ! -d "libtool-$(LIBTOOL_VERSION)" ]; then tar xzf libtool-$(LIBTOOL_VERSION).tar.gz; fi

libtool_config:
	( cd libtool-$(LIBTOOL_VERSION); ./configure --prefix=${BSPTOOLS} --enable-static --disable-shared )

libtool_build:
	make -C libtool-$(LIBTOOL_VERSION) -j ${BSPJOB}

libtool_install:
	${BSPSUDO} make -C libtool-$(LIBTOOL_VERSION) install

libtool_uninstall:
	${BSPSUDO} make -C libtool-$(LIBTOOL_VERSION) uninstall

libtool_clean:
	@rm -rf libtool-$(LIBTOOL_VERSION)

libtool_distclean:
	@rm -rf libtool-$(LIBTOOL_VERSION)
	@rm -rf libtool-$(LIBTOOL_VERSION).tar.gz
