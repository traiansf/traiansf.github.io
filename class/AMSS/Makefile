BASE ?= ../amss2025
export BASE := $(abspath $(BASE))

.PHONY: all clean code curs lab proiect

all: curs lab proiect code

curs lab proiect:
	$(MAKE) -C $@

code:
	$(MAKE) -C curs/code

clean:
	$(MAKE) -C curs clean
	$(MAKE) -C lab clean
	$(MAKE) -C proiect clean
	$(MAKE) -C curs/code clean
