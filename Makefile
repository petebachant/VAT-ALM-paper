

paper:
	latexmk -pdf paper.tex


cover-letter:
	cd cover-letter
	pandoc --template=template-letter.tex cover-letter.md -o cover-letter.pdf


figs:
	python scripts/getfigs.py


bib:
	python scripts/getbib.py


zip:
	python scripts/zip.py
