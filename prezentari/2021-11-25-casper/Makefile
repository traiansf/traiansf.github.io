objects := $(patsubst %.md,%.pdf,$(wildcard *.md))

all: index.html

%.pdf: %.md header.tex Makefile
	pandoc $< -o $@ -s -t beamer --toc -V theme:metropolis -H header.tex

index.html: README.md Makefile
	pandoc $< -o $@ -s -t slidy --toc --toc-depth 2

%.ipynb: %.md
	pandoc $< -o $@

clean:
	-rm $(objects)

.PHONY: all clean
