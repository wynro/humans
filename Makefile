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

clean:

distclean: clean

uninstall:
	-rm -f "${DESTDIR}/usr/bin/humans"
	-rm -f "${DESTDIR}/usr/bin/humans-load"
	-rm -f "${DESTDIR}/usr/bin/humans-get-sources"
	-rm -f "${DESTDIR}/usr/bin/humans-process-usernames"
	-rm -f "${DESTDIR}/usr/share/humans"
	-rm -f "${DESTDIR}/etc/bash_completion.d/humans"

package:
	gbp buildpackage -us -uc

.PHONY: all install clean distclean uninstall package
