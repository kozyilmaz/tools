
target_name ?= secp256k1

include ../../Makefile.build

SECP256K1_VERSION=v0.4.0

secp256k1_clone:
	if [ ! -d "secp256k1-$(SECP256K1_VERSION)" ]; then (git clone https://github.com/bitcoin-core/secp256k1.git secp256k1-$(SECP256K1_VERSION) && cd secp256k1-$(SECP256K1_VERSION) && git checkout $(SECP256K1_VERSION)); fi

secp256k1_config:
	( cd secp256k1-$(SECP256K1_VERSION) && LIBTOOLIZE=glibtoolize ./autogen.sh; \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		./configure ${BSPHOST} --prefix=${BSPROOTFS} \
		--with-pic --enable-static --disable-shared \
	)

secp256k1_build:
	make -C secp256k1-$(SECP256K1_VERSION)/build -j ${BSPJOB}

secp256k1_install:
	make -C secp256k1-$(SECP256K1_VERSION)/build install

secp256k1_uninstall:
	make -C secp256k1-$(SECP256K1_VERSION)/build uninstall

secp256k1_clean:
	rm -rf secp256k1-$(SECP256K1_VERSION)

secp256k1_distclean:
	rm -rf secp256k1-$(SECP256K1_VERSION)
	rm -rf secp256k1-$(SECP256K1_VERSION).tar.gz
