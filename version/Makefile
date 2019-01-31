
target_name ?= version

include ../Makefile.build

version_clone:
	@true

version_config:
	@true

version_build:
	@true

version_install:
ifeq ($(shell git diff),)
	@${BSPSUDO} sh -c "echo '$(shell git rev-parse --verify HEAD)' > ${BSPTOOLS}/version.txt"
else
	@${BSPSUDO} sh -c "echo '$(shell git rev-parse --verify HEAD)-dirty' > ${BSPTOOLS}/version.txt"
endif

version_uninstall:
	${BSPSUDO} rm -rf ${BSPTOOLS}/version.txt

version_clean:
	@true

version_distclean:
	@true
