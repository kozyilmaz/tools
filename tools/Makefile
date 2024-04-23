
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

TOOLS_ENABLE_ESSENTIALS ?= y
TOOLS_ENABLE_CMAKE      ?= y
TOOLS_ENABLE_GCC        ?= n

# essentials
subdir-${TOOLS_ENABLE_ESSENTIALS} += \
	m4 \
	autoconf \
	automake \
	libtool \
	pkgconfig

# cmake
subdir-${TOOLS_ENABLE_CMAKE} += \
	cmake

# gcc
subdir-${TOOLS_ENABLE_GCC} += \
	gmp \
	mpfr \
	mpc \
	isl \
	gnugcc

automake_depends-y = \
	autoconf

libtool_depends-y = \
	automake

pkgconfig_depends-y = \
	libtool

cmake_depends-y = \
	pkgconfig

gmp_depends-y = \
	pkgconfig

mpfr_depends-y = \
	gmp

mpc_depends-y = \
	mpfr

isl_depends-y = \
	mpc

gnugcc_depends-y = \
	isl \
	mpc \
	mpfr \
	gmp

include ../Makefile.lib
