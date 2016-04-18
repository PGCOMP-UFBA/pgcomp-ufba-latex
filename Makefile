# FILE

LATEX_FILE 	= main.tex
LATEX_AUX 	=  main.aux


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
