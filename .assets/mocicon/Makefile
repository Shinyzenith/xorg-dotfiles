# surf - simple browser
# See LICENSE file for copyright and license details.

include config.mk

SRC = mocicon.c
OBJ = ${SRC:.c=.o}

all: options mocicon

options:
	@echo mocicon build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.mk


mocicon: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ mocicon.o ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f mocicon ${OBJ} mocicon-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p mocicon-${VERSION}
	@cp -R CHANGELOG Makefile README config.mk ${SRC} mocicon-${VERSION}
	@tar -cf mocicon-${VERSION}.tar mocicon-${VERSION}
	@bzip2 mocicon-${VERSION}.tar
	@rm -rf mocicon-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f mocicon ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/mocicon

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/mocicon

.PHONY: all options clean dist install uninstall
