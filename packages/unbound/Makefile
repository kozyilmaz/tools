
target_name ?= unbound

include ../../Makefile.build

BLOCKCHAIN_CRYPTO_MPC_VERSION=f86f72fc00444eedbc7ab994030c68a55b3770e8

unbound_clone:
	if [ ! -d "blockchain-crypto-mpc" ]; then git clone https://github.com/unboundsecurity/blockchain-crypto-mpc.git; fi
	( cd blockchain-crypto-mpc; \
		git checkout $(BLOCKCHAIN_CRYPTO_MPC_VERSION) \
	)

unbound_config:
	$(call patchme,blockchain-crypto-mpc)

unbound_build:
	( cd blockchain-crypto-mpc; \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include -DMPC_CRYPTO_NO_JNI" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib -L${BSPROOTFS}/lib64" \
		make -f makefile -j ${BSPJOB} \
	)

unbound_install:
	${BSPSUDO} make -C blockchain-crypto-mpc -f makefile install

unbound_uninstall:
	${BSPSUDO} make -C blockchain-crypto-mpc -f makefile uninstall

unbound_clean:
	rm -rf blockchain-crypto-mpc

unbound_distclean:
	rm -rf blockchain-crypto-mpc
