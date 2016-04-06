# FILE

LATEX_FILE 	= template-bsc.tex
LATEX_AUX 	=  template-bsc.aux


# TOOLCHAINS

CC 	= pdflatex
BIB	= bibtex
REMOVE  = rm



all: biblio
	$(CC) --shell-escape $(LATEX_FILE) ufbathesis.cls

pdflatex:
	$(CC) --shell-escape $(LATEX_FILE) ufbathesis.cls


biblio: clean pdflatex
	$(BIB) $(LATEX_AUX)
	$(CC) --shell-escape $(LATEX_FILE)
clean:
	$(REMOVE) *.aux *.bbl *.blg *.out *.log -f
