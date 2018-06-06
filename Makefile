.PHONY: doc copy configure checkout clone clean

all: clone checkout configure doc

doc:
	cd libhangul/doc && make doc
	test -d docs || mkdir docs
	cp -af libhangul/doc/html/* docs

configure:
	cd libhangul && ./autogen.sh && ./configure

checkout:
	cd libhangul && git checkout libhangul-0.1.0

clone:
	test -d libhangul || git clone https://github.com/libhangul/libhangul.git

clean:
	rm -rf docs
