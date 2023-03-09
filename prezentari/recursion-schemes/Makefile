all: recursion.pdf README.md index.html

index.html: recursion.lhs Makefile
	pandoc $< -o $@ -s -t slidy --toc --toc-depth 2 --citeproc

README.md: recursion.lhs Makefile
	pandoc $<  -o $@

%.pdf: %.lhs Makefile
	pandoc -t beamer $<  -o $@

clean:
	rm -f *.pdf *.md *.html

