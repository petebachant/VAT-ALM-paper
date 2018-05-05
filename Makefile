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


## word-count:      Count words in PDF
.PHONY: word-count
word-count:
	@pdftotext paper.pdf
	@wc -w paper.txt
	@rm paper.txt


## reviews:         Build PDFs of review responses
.PHONY: reviews
reviews: reviews/reviewer1-response.md reviews/reviewer2-response.md
	pandoc reviews/reviewer1-response.md -o reviews/reviewer1-response.pdf -H reviews/quote-config.tex
	pandoc reviews/reviewer4-response.md -o reviews/reviewer4-response.pdf -H reviews/quote-config.tex


## diff:            Create a diff PDF comparing to the previous tagged version
.PHONY: diff
diff:
	bash scripts/diff.sh


## archive          Copy latest built PDF to archive directory
.PHONY: archive
archive: paper
	cp paper.pdf archive/paper-$(shell git describe --always --dirty).pdf


.PHONY: help
help: Makefile
	@sed -n "s/^##//p" $<
