BASE ?= ../amss2026
export BASE := $(abspath $(BASE))

AMSS_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: all clean curs lab proiect exam static

all: curs lab proiect exam static

curs lab proiect exam:
	$(MAKE) -C $@

static:
	@mkdir -p $(BASE)
	rsync -a $(AMSS_ROOT)/static/ $(BASE)/

clean:
	$(MAKE) -C curs clean
	$(MAKE) -C lab clean
	$(MAKE) -C proiect clean
	$(MAKE) -C exam clean
