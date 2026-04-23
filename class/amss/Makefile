BASE ?= ../amss2025
export BASE := $(abspath $(BASE))

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: all clean code curs lab proiect static

all: curs lab proiect code static

curs lab proiect:
	$(MAKE) -C $@

code:
	$(MAKE) -C curs/code

static:
	@mkdir -p $(BASE)
	rsync -a $(AMSS_ROOT)/static/ $(BASE)/

clean:
	$(MAKE) -C curs clean
	$(MAKE) -C lab clean
	$(MAKE) -C proiect clean
	$(MAKE) -C curs/code clean
