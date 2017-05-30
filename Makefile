export DESTDIR=/usr

all:

install:
	install -D humans \
		"${DESTDIR}/bin/humans"
	install -D humans-load \
		"${DESTDIR}/bin/humans-load"
	install -D humans-get-sources \
		"${DESTDIR}/bin/humans-get-sources"
	install -D humans-process-usernames \
		"${DESTDIR}/bin/humans-process-usernames"
	install -D schema.sql \
		"${DESTDIR}/share/humans/schema.sql"
	install -D humans.db \
		"${DESTDIR}/share/humans/humans.db"

clean:

distclean: clean

uninstall:
	-rm -f "$(DESTDIR)/bin/humans"
	-rm -f "$(DESTDIR)/bin/humans-load"
	-rm -f "$(DESTDIR)/bin/humans-get-sources"
	-rm -f "${DESTDIR}/bin/humans-process-usernames"
	-rm -f "$(DESTDIR)/share/humans/schema.sql"
	-rm -f "$(DESTDIR)/share/humans/humans.db"

.PHONY: all install clean distclean uninstall
