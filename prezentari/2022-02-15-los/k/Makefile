
all: index.html

index.html: imp.md Makefile
	pandoc $< -o $@ -s -t slidy

clean:
	-rm $(objects)

.PHONY: all clean
