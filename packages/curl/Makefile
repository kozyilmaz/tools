
target_name ?= curl

include ../../Makefile.build

CURL_VERSION=7.88.1

curl_clone:
	if [ ! -f "curl-$(CURL_VERSION).tar.gz" ]; then curl -OL https://curl.haxx.se/download/curl-$(CURL_VERSION).tar.gz; fi
	if [ ! -d "curl-$(CURL_VERSION)" ]; then tar xvf curl-$(CURL_VERSION).tar.gz; fi

curl_config:
	( cd curl-$(CURL_VERSION); \
		CC=${BSPCC} \
		CXX=${BSPCXX} \
		CFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CXXFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		CPPFLAGS="${BSPCFLAGS} ${BSPEXTRAFLAGS} -I${BSPROOTFS}/include" \
		LDFLAGS="${BSPLDFLAGS} ${BSPEXTRAFLAGS} -L${BSPROOTFS}/lib" \
		PKG_CONFIG_PATH=${BSPROOTFS}/lib/pkgconfig \
		./configure ${BSPHOST} --prefix=${BSPROOTFS} \
		--with-pic --enable-static --disable-shared \
		--enable-threaded-resolver \
		--disable-verbose \
		--disable-manual \
		--disable-debug \
		--disable-curldebug \
		--disable-libcurl-option \
		--enable-optimize \
		--enable-symbol-hiding \
		--disable-unix-sockets \
		--disable-ftp --disable-ldap --disable-ldaps --disable-rtsp \
		--disable-dict --disable-telnet --disable-tftp --disable-pop3 \
		--disable-imap --disable-smb --disable-smtp --disable-gopher \
		--disable-ntlm-wb \
		--with-ssl=${BSPROOTFS} \
		--with-ca-fallback \
		--with-zlib=${BSPROOTFS} \
	)

curl_build:
	make -C curl-$(CURL_VERSION) -j ${BSPJOB}

curl_install:
	${BSPSUDO} make -C curl-$(CURL_VERSION) install

curl_uninstall:
	${BSPSUDO} make -C curl-$(CURL_VERSION) uninstall

curl_clean:
	rm -rf curl-$(CURL_VERSION)

curl_distclean:
	rm -rf curl-$(CURL_VERSION)
	rm -rf curl-$(CURL_VERSION).tar.gz
