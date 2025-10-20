TARGETS: index.html

index.html: README.md Makefile
	pandoc $(OPTIONS) -s -o $@ $<

include ../include.mk