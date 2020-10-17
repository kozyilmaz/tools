
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

TOOLS_ENABLE_ESSENTIALS ?= y
TOOLS_ENABLE_CMAKE      ?= n
TOOLS_ENABLE_GCC        ?= n

# macOS does have m4 and libtool by default
# Linux does not have any tools by default
# therefore,
# if m4 is not available, it is built (out-of-the-box Linux)
# libtool is built with 'g' prefix on all platforms

# check for m4 presence, add if not
ifeq ($(shell command -v m4;),)
subdir-y = \
	m4
endif
# for distclean inclusion
ifneq ($(findstring $(BSPTOOLS)/bin/m4,$(shell command -v m4;)),)
subdir-y = \
	m4
endif

# essentials
subdir-${TOOLS_ENABLE_ESSENTIALS} += \
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
