.PHONY: doc copy configure checkout clone clean

all: clone fetch checkout configure doc
	@echo "Documents generated"

doc:
	cd libhangul && git checkout origin/master
	cd libhangul/doc && make doc
	test -d docs || mkdir docs
	cp -af libhangul/doc/html docs/git

configure:
	cd libhangul && ./autogen.sh && ./configure

checkout:
	cd libhangul && git checkout origin/master

fetch:
	cd libhangul && git fetch origin

clone:
	test -d libhangul || git clone https://github.com/libhangul/libhangul.git

clean:
	rm -rf docs

%:
	cd libhangul && git checkout libhangul-$@
	cd libhangul/doc && make doc
	test -d docs || mkdir docs
	cp -af libhangul/doc/html docs/$@
