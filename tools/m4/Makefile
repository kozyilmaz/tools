
target_name ?= m4

include ../../Makefile.build

M4_VERSION="1.4.20"

m4_clone:
	if [ ! -f "m4-$(M4_VERSION).tar.gz" ]; then curl -OL https://ftpmirror.gnu.org/m4/m4-$(M4_VERSION).tar.gz; fi
	if [ ! -d "m4-$(M4_VERSION)" ]; then tar xzf m4-$(M4_VERSION).tar.gz; fi

m4_config:
	( cd m4-$(M4_VERSION); ./configure --prefix=${BSPTOOLS} )

m4_build:
	make -C m4-$(M4_VERSION) -j ${BSPJOB}

m4_install:
	${BSPSUDO} make -C m4-$(M4_VERSION) install

m4_uninstall:
	${BSPSUDO} make -C m4-$(M4_VERSION) uninstall

m4_clean:
	@rm -rf m4-$(M4_VERSION)

m4_distclean:
	@rm -rf m4-$(M4_VERSION)
	@rm -rf m4-$(M4_VERSION).tar.gz
