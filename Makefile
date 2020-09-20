
ifeq ($(BSPTOOLS),)
    $(error You must first run 'source environment')
endif

subdir-y = \
	tools

subdir-y += \
	version

version_depends-y = \
	tools

include Makefile.lib

libmakefile-check:
	@echo "  CHECK      libmakefile"
	@git fetch https://github.com/kozyilmaz/libmakefile.git buildsystem
	@$(TOPDIR)/scripts/git-subtree-check.sh libmakefile

libmakefile-update:
	@echo "  UPDATE     libmakefile"
ifeq ($(shell git remote -v |grep '\<libmakefile-remote\>'),)
	@git remote add libmakefile-remote https://github.com/kozyilmaz/libmakefile.git
else
	@git remote set-url libmakefile-remote https://github.com/kozyilmaz/libmakefile.git
endif
	@git subtree pull --prefix=libmakefile/ --squash libmakefile-remote buildsystem
