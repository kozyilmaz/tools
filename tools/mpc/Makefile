
target_name ?= mpc

include ../../Makefile.build

MPC_VERSION="1.3.1"

mpc_clone:
	if [ ! -f "mpc-$(MPC_VERSION).tar.gz" ]; then curl -OL https://ftpmirror.gnu.org/mpc/mpc-$(MPC_VERSION).tar.gz; fi;
	if [ ! -d "mpc-$(MPC_VERSION)" ]; then tar xzf mpc-$(MPC_VERSION).tar.gz; fi

mpc_config:
	( cd mpc-$(MPC_VERSION); CFLAGS="" CXXFLAGS="" ./configure --prefix=${BSPTOOLS} --with-gmp=${BSPTOOLS} --with-mpfr=${BSPTOOLS} --enable-static --disable-shared; )

mpc_build:
	make -C mpc-$(MPC_VERSION) -j ${BSPJOB}

mpc_install:
	${BSPSUDO} make -C mpc-$(MPC_VERSION) install

mpc_uninstall:
	${BSPSUDO} make -C mpc-$(MPC_VERSION) uninstall

mpc_clean:
	@rm -rf mpc-$(MPC_VERSION)

mpc_distclean:
	@rm -rf mpc-$(MPC_VERSION)
	@rm -rf mpc-$(MPC_VERSION).tar.gz
