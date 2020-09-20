
target_name ?= version

include ../Makefile.build

GIT_REV=$(shell git rev-parse --verify HEAD)
GIT_TAG=$(shell git describe --all --exact-match $(GIT_REV))

version_clone:
	@true

version_config:
	@true

version_build:
	@true

version_install:
ifeq ($(shell git diff),)
	@${BSPSUDO} sh -c "echo '$(GIT_REV)' > ${BSPTOOLS}/version.txt"
	@${BSPSUDO} sh -c "echo '$(GIT_TAG)' >> ${BSPTOOLS}/version.txt"
else
	@${BSPSUDO} sh -c "echo '$(GIT_REV)-dirty' > ${BSPTOOLS}/version.txt"
endif

version_uninstall:
	${BSPSUDO} rm -rf ${BSPTOOLS}/version.txt

version_clean:
	@true

version_distclean:
	@true
