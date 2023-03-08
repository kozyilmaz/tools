
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
ifeq (${BSPPLATFORM},x86_64)
	( cd blockchain-crypto-mpc; \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include -Wno-parentheses -Wno-unused-command-line-argument -Wno-deprecated -Wno-deprecated-declarations -DMPC_CRYPTO_NO_JNI" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib -L${BSPROOTFS}/lib64" \
		make -f makefile -j ${BSPJOB} \
	)
else
$(warning Unbound MPC only allows x86-64 builds due to ASM parts)
endif

unbound_install:
	if [ -f "blockchain-crypto-mpc/include/mpc_crypto.h" ]; then ${BSPSUDO} cp blockchain-crypto-mpc/include/mpc_crypto.h ${BSPROOTFS}/include; fi
	if [ -f "blockchain-crypto-mpc/libmpc_crypto.so" ]; then ${BSPSUDO} cp blockchain-crypto-mpc/libmpc_crypto.so ${BSPROOTFS}/lib; fi
	if [ -f "blockchain-crypto-mpc/mpc_crypto_bench" ]; then ${BSPSUDO} cp blockchain-crypto-mpc/mpc_crypto_bench ${BSPROOTFS}/bin; fi

unbound_uninstall:
	${BSPSUDO} rm -rf ${BSPROOTFS}/include/mpc_crypto.h
	${BSPSUDO} rm -rf ${BSPROOTFS}/lib/libmpc_crypto.so
	${BSPSUDO} rm -rf ${BSPROOTFS}/bin/mpc_crypto_bench

unbound_clean:
	rm -rf blockchain-crypto-mpc

unbound_distclean:
	rm -rf blockchain-crypto-mpc
