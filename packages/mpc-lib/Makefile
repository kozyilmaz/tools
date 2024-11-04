
target_name ?= mpc-lib

include ../../Makefile.build

MPC_LIB_VERSION=latest

ifeq      (${BSPPLATFORM},ios-arm64)
else ifeq (${BSPPLATFORM},ios-sim)
else ifeq (${BSPPLATFORM},android-arm64-v8a)
else ifeq (${BSPPLATFORM},android-armeabi-v7a)
else ifeq (${BSPPLATFORM},android-x86_64)
else ifeq (${BSPPLATFORM},mingw-w64)
else ifeq (${BSPPLATFORM},arm64)
# native arm64
ifeq      ($(HOST_PLATFORM),WINDOWS)
else ifeq ($(HOST_PLATFORM),MACOS)
MPC_LIB_FLAGS =
else ifeq ($(HOST_PLATFORM),LINUX)
endif
else ifeq (${BSPPLATFORM},aarch64)
# native aarch64
ifeq      ($(HOST_PLATFORM),WINDOWS)
else ifeq ($(HOST_PLATFORM),MACOS)
else ifeq ($(HOST_PLATFORM),LINUX)
MPC_LIB_FLAGS =
endif
else ifeq (${BSPPLATFORM},x86_64)
# native x64_64
ifeq      ($(HOST_PLATFORM),WINDOWS)
else ifeq ($(HOST_PLATFORM),MACOS)
MPC_LIB_FLAGS =
else ifeq ($(HOST_PLATFORM),LINUX)
MPC_LIB_FLAGS =
endif
endif

mpc-lib_clone:
	if [ ! -d "mpc-lib-$(MPC_LIB_VERSION)" ]; then (git clone https://github.com/fireblocks/mpc-lib.git mpc-lib-$(MPC_LIB_VERSION)); fi

mpc-lib_config:
	( cd mpc-lib-$(MPC_LIB_VERSION) && mkdir -p _build && cd _build; \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		cmake -DCMAKE_INSTALL_PREFIX=${BSPROOTFS} \
		-DCMAKE_C_COMPILER=${BSPCC} \
		-DCMAKE_CXX_COMPILER=${BSPCXX} \
		-DCMAKE_C_FLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_CXX_FLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_EXE_LINKER_FLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_SHARED_LINKER_FLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_STATIC_LINKER_FLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_SHARED_LIBRARY_SUFFIX_CXX=".so" \
		-DBUILD_SHARED_LIBS=OFF \
		-DOPENSSL_ROOT_DIR=${BSPROOTFS} \
		-DUUID_INCLUDE_DIR=${BSPROOTFS}/include \
		-DUUID_LIBRARY=${BSPROOTFS}/lib/libuuid.a \
		.. \
	)

mpc-lib_build:
	make -C mpc-lib-$(MPC_LIB_VERSION)/_build -j ${BSPJOB};

mpc-lib_install:
	if [ ! -d "${BSPROOTFS}/include/mpc-lib" ]; then ${BSPSUDO} mkdir -p ${BSPROOTFS}/include/mpc-lib; fi
	if [ -d "mpc-lib-$(MPC_LIB_VERSION)/include" ]; then ${BSPSUDO} cp -a mpc-lib-$(MPC_LIB_VERSION)/include/* ${BSPROOTFS}/include/mpc-lib; fi
	if [ -f "mpc-lib-$(MPC_LIB_VERSION)/_build/src/common/libcosigner.so" ]; then ${BSPSUDO} cp -a mpc-lib-$(MPC_LIB_VERSION)/_build/src/common/libcosigner.so ${BSPROOTFS}/lib; fi
	if [ -f "mpc-lib-$(MPC_LIB_VERSION)/_build/test/cosigner/cosigner_test" ]; then ${BSPSUDO} cp -a mpc-lib-$(MPC_LIB_VERSION)/_build/test/cosigner/cosigner_test ${BSPROOTFS}/bin/cosigner-test; fi

mpc-lib_uninstall:
	${BSPSUDO} rm -rf ${BSPROOTFS}/include/mpc-lib
	${BSPSUDO} rm -rf ${BSPROOTFS}/lib/libcosigner.so
	${BSPSUDO} rm -rf ${BSPROOTFS}/bin/cosigner-test

mpc-lib_clean:
	@if [ -d "mpc-lib-$(MPC-LIB_VERSION)" ]; then cd mpc-lib-$(MPC-LIB_VERSION) && git clean -dfx --quiet && git clean -dfX --quiet && git checkout * --quiet; fi

mpc-lib_distclean:
	@rm -rf mpc-lib-$(MPC_LIB_VERSION)
