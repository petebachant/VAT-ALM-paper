

paper:
	latexmk -pdf paper.tex


cover-letter:
	cd cover-letter
	pandoc --template=template-letter.tex cover-letter.md -o cover-letter.pdf


figs:
	python scripts/getfigs.py


bib:
	git submodule update library
	cp library/Library.bib library.bib


zip:
	python scripts/zip.py
