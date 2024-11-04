
target_name ?= secp256k1

include ../../Makefile.build

SECP256K1_VERSION=v0.5.1

secp256k1_clone:
	if [ ! -d "secp256k1-$(SECP256K1_VERSION)" ]; then (git clone https://github.com/bitcoin-core/secp256k1.git secp256k1-$(SECP256K1_VERSION) && cd secp256k1-$(SECP256K1_VERSION) && git checkout $(SECP256K1_VERSION)); fi

secp256k1_config:
	( cd secp256k1-$(SECP256K1_VERSION) && ./autogen.sh; \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		./configure ${BSPHOST} --prefix=${BSPROOTFS} \
		--with-pic --enable-static --disable-shared --enable-module-recovery \
	)

secp256k1_build:
	make -C secp256k1-$(SECP256K1_VERSION) -j ${BSPJOB}

secp256k1_install:
	${BSPSUDO} make -C secp256k1-$(SECP256K1_VERSION) install

secp256k1_uninstall:
	${BSPSUDO} make -C secp256k1-$(SECP256K1_VERSION) uninstall

secp256k1_clean:
	@if [ -d "secp256k1-$(SECP256K1_VERSION)" ]; then cd secp256k1-$(SECP256K1_VERSION) && git clean -dfx && git clean -dfX && git checkout * ; fi

secp256k1_distclean:
	@rm -rf secp256k1-$(SECP256K1_VERSION)
