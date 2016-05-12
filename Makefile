## Makefile for VAT-ALM paper
##

## paper:           Build PDF of paper
.PHONY: paper
paper:
	latexmk -pdf paper.tex


## clean:           Use latexmk to clean files
.PHONY: clean
clean:
	latexmk -c paper.tex
	rm paper.bbl


## view:            View paper.pdf
.PHONY: view
view: paper
ifeq ($(shell uname -s),MINGW64_NT-10.0)
	start "" paper.pdf
else
	echo "Viewing only setup for Windows"
endif


## cover-letter:    Build cover letter PDF
.PHONY: cover-letter
cover-letter:
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
novelty.pdf: novelty.md
	pandoc novelty.md -o novelty.pdf


.PHONY: help
help: Makefile
	@sed -n "s/^##//p" $<
