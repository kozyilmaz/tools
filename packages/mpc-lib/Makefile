
target_name ?= mpc-lib

include ../../Makefile.build

MPC_LIB_VERSION=84b7fb83502a998703b6ceb113273fc20fa55b7b

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
	if [ ! -d "mpc-lib-$(MPC_LIB_VERSION)" ]; then (git clone https://github.com/fireblocks/mpc-lib.git mpc-lib-$(MPC_LIB_VERSION) && cd mpc-lib-$(MPC_LIB_VERSION) && git checkout $(MPC_LIB_VERSION)); fi

mpc-lib_config:
	$(call patchme,mpc-lib-$(MPC_LIB_VERSION))
ifeq ($(HOST_PLATFORM),MACOS)
	if [ -d "mpc-lib-$(MPC_LIB_VERSION)" ]; then patch -d mpc-lib-$(MPC_LIB_VERSION) -p1 < patches-macos/006-mpc-lib-macos-no-tests.patch ; fi
	if [ -d "mpc-lib-$(MPC_LIB_VERSION)" ]; then patch -d mpc-lib-$(MPC_LIB_VERSION) -p1 < patches-macos/007-mpc-lib-macos-format.patch ; fi
	if [ -d "mpc-lib-$(MPC_LIB_VERSION)" ]; then patch -d mpc-lib-$(MPC_LIB_VERSION) -p1 < patches-macos/008-mpc-lib-macos-flags.patch ; fi
	if [ -d "mpc-lib-$(MPC_LIB_VERSION)/include" ]; then cp -a patches-macos/byteswap.h mpc-lib-$(MPC_LIB_VERSION)/include/ ; fi
endif

mpc-lib_build:
	CC=${BSPCC} \
	CXX=${BSPCXX} \
	CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
	CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
	CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
	LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
	PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
	ARCH_CFLAGS=$(MPC_LIB_FLAGS) make -C mpc-lib-$(MPC_LIB_VERSION) -j ${BSPJOB};

mpc-lib_install:
	if [ ! -d "${BSPROOTFS}/include/mpc-lib" ]; then ${BSPSUDO} mkdir -p ${BSPROOTFS}/include/mpc-lib; fi
	if [ -d "mpc-lib-$(MPC_LIB_VERSION)/include" ]; then ${BSPSUDO} cp -a mpc-lib-$(MPC_LIB_VERSION)/include/* ${BSPROOTFS}/include/mpc-lib; fi
	if [ -f "mpc-lib-$(MPC_LIB_VERSION)/src/common/libcosigner.so" ]; then ${BSPSUDO} cp -a mpc-lib-$(MPC_LIB_VERSION)/src/common/libcosigner.so ${BSPROOTFS}/lib; fi
	if [ -f "mpc-lib-$(MPC_LIB_VERSION)/test/cosigner/test" ]; then ${BSPSUDO} cp -a mpc-lib-$(MPC_LIB_VERSION)/test/cosigner/test ${BSPROOTFS}/bin/cosigner-test; fi

mpc-lib_uninstall:
	${BSPSUDO} rm -rf ${BSPROOTFS}/include/mpc-lib
	${BSPSUDO} rm -rf ${BSPROOTFS}/lib/libcosigner.so
	${BSPSUDO} rm -rf ${BSPROOTFS}/bin/cosigner-test

mpc-lib_clean:
	CC=${BSPCC} \
	CXX=${BSPCXX} \
	CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
	CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
	CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
	LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
	PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
	ARCH_CFLAGS=$(MPC_LIB_FLAGS) make -C mpc-lib-$(MPC_LIB_VERSION) -j ${BSPJOB} clean;

mpc-lib_distclean:
	rm -rf mpc-lib-$(MPC_LIB_VERSION)
