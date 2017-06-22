export DESTDIR=""

all:

install:
	install -D humans \
		"${DESTDIR}/usr/bin/humans"
	install -D humans-load \
		"${DESTDIR}/usr/bin/humans-load"
	install -D humans-get-sources \
		"${DESTDIR}/usr/bin/humans-get-sources"
	install -D humans-process-usernames \
		"${DESTDIR}/usr/bin/humans-process-usernames"
	mkdir -p "${DESTDIR}/usr/share/humans/"
	cp schema.sql "${DESTDIR}/usr/share/humans/schema.sql"
	cp humans.db "${DESTDIR}/usr/share/humans/humans.db"
	install -D humans_completion \
		"${DESTDIR}/usr/share/bash-completion/completions/humans"

install-doc:
	cp man/humans.1 \
		"${DESTDIR}/usr/share/man/man1/humans.1"
	cp man/humans-load.1 \
		"${DESTDIR}/usr/share/man/man1/humans-load.1"
	cp man/humans-get-sources.1 \
		"${DESTDIR}/usr/share/man/man1/humans-get-sources.1"
	cp man/humans-process-usernames.1 \
		"${DESTDIR}/usr/share/man/man1/humans-process-usernames.1"

clean:

distclean: clean

uninstall:
	-rm -f "${DESTDIR}/usr/bin/humans"
	-rm -f "${DESTDIR}/usr/bin/humans-load"
	-rm -f "${DESTDIR}/usr/bin/humans-get-sources"
	-rm -f "${DESTDIR}/usr/bin/humans-process-usernames"
	-rm -f "${DESTDIR}/usr/share/humans"
	-rm -f "${DESTDIR}/usr/share/bash-completion/completions/humans"

uninstall-doc:
	-rm -f "${DESTDIR}/usr/share/man/man1/humans.1"
	-rm -f "${DESTDIR}/usr/share/man/man1/humans-load.1"
	-rm -f "${DESTDIR}/usr/share/man/man1/humans-get-sources.1"
	-rm -f "${DESTDIR}/usr/share/man/man1/humans-process-usernames.1"

package:
	gbp buildpackage -us -uc

package-uncommited:
	gbp buildpackage -us -uc --git-ignore-new

test:
	checkbashisms -f humans
	checkbashisms -f humans-get-sources
	checkbashisms -f humans-process-usernames

.PHONY: all install clean distclean uninstall package test
