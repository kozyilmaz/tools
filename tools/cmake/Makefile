
target_name ?= cmake

include ../../Makefile.build

CMAKE_MAJOR=4
CMAKE_MINOR=0
CMAKE_MICRO=3
CMAKE_VERSION=$(CMAKE_MAJOR).$(CMAKE_MINOR).$(CMAKE_MICRO)

cmake_clone:
	if [ ! -f "cmake-$(CMAKE_VERSION).tar.gz" ]; then curl -OL https://cmake.org/files/v$(CMAKE_MAJOR).$(CMAKE_MINOR)/cmake-$(CMAKE_VERSION).tar.gz; fi;
	if [ ! -d "cmake-$(CMAKE_VERSION)" ]; then tar xzf cmake-$(CMAKE_VERSION).tar.gz; fi

cmake_config:
	( cd cmake-$(CMAKE_VERSION); \
		CC=gcc CFLAGS="" CXXFLAGS="" \
		./bootstrap --parallel=${BSPJOB} --prefix=${BSPTOOLS} --no-system-libs --no-qt-gui -- -DCMAKE_USE_OPENSSL=OFF; \
	)

cmake_build:
	make -C cmake-$(CMAKE_VERSION) -j ${BSPJOB}

cmake_install:
	${BSPSUDO} make -C cmake-$(CMAKE_VERSION) -j ${BSPJOB} install

cmake_uninstall:
	${BSPSUDO} make -C cmake-$(CMAKE_VERSION) uninstall

cmake_clean:
	@rm -rf cmake-$(CMAKE_VERSION)

cmake_distclean:
	@rm -rf cmake-$(CMAKE_VERSION)
	@rm -rf cmake-$(CMAKE_VERSION).tar.gz
