MD = md
SRC = $(wildcard *.$(MD))
BIB = references.bib
CSL = style_files/new-phytologist

PDF=$(SRC:.md=.pdf)
TEX=$(SRC:.md=.tex)
DOC=$(SRC:.md=.docx)

all:	$(PDF) $(DOC)

pdf:	clean $(PDF)
docx:	clean $(DOC)

#--template=templates/template.docx

%.pdf:	%.md
	pandoc -S -o manuscript.pdf --template=templates/template.tex --filter pandoc-citeproc --csl=$(CSL).csl --bibliography=$(BIB) -o $@ $<
%.docx:	%.md
	pandoc -S -o manuscript.docx --filter pandoc-citeproc --csl=$(CSL).csl --bibliography=$(BIB) -o $@ $<


clean:
	rm -f *.pdf *.docx
