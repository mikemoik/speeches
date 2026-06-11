MAIN := main

.PHONY: all watch clean distclean

all:
	latexmk $(MAIN).tex

watch:
	latexmk -pvc $(MAIN).tex

clean:
	latexmk -c

distclean:
	latexmk -C
