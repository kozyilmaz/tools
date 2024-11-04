
target_name ?= prometheus

include ../../Makefile.build

PROMETHEUS_VERSION=v1.3.0

prometheus_clone:
	if [ ! -d "prometheus-cpp-$(PROMETHEUS_VERSION)" ]; then (git clone https://github.com/jupp0r/prometheus-cpp.git prometheus-cpp-$(PROMETHEUS_VERSION) && cd prometheus-cpp-$(PROMETHEUS_VERSION) && git checkout $(PROMETHEUS_VERSION) && git submodule init && git submodule update); fi

prometheus_config:
	$(call patchme,prometheus-cpp-$(PROMETHEUS_VERSION))
	( cd prometheus-cpp-$(PROMETHEUS_VERSION) && mkdir -p _build && cd _build; \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		cmake -DCMAKE_INSTALL_PREFIX=${BSPROOTFS} \
		-DCMAKE_C_COMPILER=${BSPCC} \
		-DCMAKE_CXX_COMPILER=${BSPCXX} \
		-DCMAKE_C_FLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_CXX_FLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_EXE_LINKER_FLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_SHARED_LINKER_FLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS}" \
		-DCMAKE_STATIC_LINKER_FLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS}" \
		-DENABLE_TESTING=OFF \
		-DBUILD_SHARED_LIBS=OFF \
		-DZLIB_INCLUDE_DIR="${BSPROOTFS}/include" -DZLIB_LIBRARY="${BSPROOTFS}/lib/libz.a" .. \
		-DCURL_INCLUDE_DIR="${BSPROOTFS}/include" -DCURL_LIBRARIES="${BSPROOTFS}/lib/libcurl.a" .. \
		-DOPENSSL_ROOT_DIR=${BSPROOTFS} \
		.. \
	)

prometheus_build:
	make -C prometheus-cpp-$(PROMETHEUS_VERSION)/_build -j ${BSPJOB}

prometheus_install:
	${BSPSUDO} make -C prometheus-cpp-$(PROMETHEUS_VERSION)/_build install

prometheus_uninstall:
	${BSPSUDO} rm -rf ${BSPROOTFS}/include/prometheus
	${BSPSUDO} rm -rf ${BSPROOTFS}/lib/libprometheus-cpp-*
	${BSPSUDO} rm -rf ${BSPROOTFS}/lib/cmake/prometheus-cpp

prometheus_clean:
	@if [ -d "prometheus-cpp-$(PROMETHEUS_VERSION)" ]; then cd prometheus-cpp-$(PROMETHEUS_VERSION) && git clean -dfx && git clean -dfX && git checkout * ; fi

prometheus_distclean:
	@rm -rf prometheus-cpp-$(PROMETHEUS_VERSION)
	@rm -rf prometheus-cpp-$(PROMETHEUS_VERSION).tar.gz
