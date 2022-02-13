objects := $(patsubst %.md,%.pdf,$(wildcard *.md)) $(patsubst %.md,%.html,$(wildcard *.md))

all: $(objects)

%.pdf: %.md k.bib Makefile
	pandoc $< -o $@ -s -t beamer --toc -V theme:metropolis --citeproc

%.html: %.md k.bib Makefile
	pandoc $< -o $@ -s -t slidy --toc --citeproc

%.ipynb: %.md
	pandoc $< -o $@

clean:
	-rm $(objects)

.PHONY: all clean
