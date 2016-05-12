## Makefile for VAT-ALM paper
##

paper.pdf:
	latexmk -pdf paper.tex


.PHONY: clean
clean:
	latexmk -c paper.tex
	rm paper.bbl


.PHONY: view
view: paper.pdf
ifeq ($(shell uname -s),MINGW64_NT-10.0)
	start "" paper.pdf
else
	echo "Viewing only setup for Windows"
endif


## cover-letter/cover-letter.pdf: Build cover letter PDF
cover-letter/cover-letter.pdf:
	cd cover-letter && pandoc --template=template-letter.tex cover-letter.md -o cover-letter.pdf


## figs:            Copy figures from simulations to figures directory
.PHONY: figs
figs:
	python scripts/getfigs.py


## bib:             Update BibTeX database
.PHONY: bib
bib:
	cd library && git pull origin master
	cp library/Library.bib library.bib


## zip:             Archive all files needed to build the paper
.PHONY: zip
zip:
	python scripts/zip.py


## novelty.pdf:     Build novelty file PDF
novelty.pdf:
	pandoc novelty.md -o novelty.pdf


.PHONY: help
help: Makefile
	@sed -n "s/^##//p" $<
