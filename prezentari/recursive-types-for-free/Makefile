all: recursive-types-for-free.pdf README.md index.html

index.html: recursive-types-for-free.lhs Makefile
	pandoc $< -o $@ -s -t slidy --toc --toc-depth 2 --citeproc

README.md: recursive-types-for-free.lhs Makefile
	pandoc $<  -o $@

%.pdf: %.lhs Makefile
	pandoc -t beamer $<  -o $@

clean:
	rm -f *.pdf *.md

