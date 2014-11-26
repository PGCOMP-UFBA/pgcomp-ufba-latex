VERSION = 1.0
TARBALL = ufbathesis-$(VERSION).tar.gz
UPLOAD_TO = app.dcc.ufba.br:~/public_html/ufbathesis/

LATEX	= latex
BIBTEX	= bibtex
MAKEINDEX = makeindex
XDVI	= xdvi -gamma 4
DVIPS	= dvips
DVIPDF  = dvipdft
L2H	= latex2html
GH	= gv

RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right)"
RERUNBIB = "No file.*\.bbl|Citation.*undefined"
MAKEIDX = "^[^%]*\\makeindex"
MPRINT = "^[^%]*print"
USETHUMBS = "^[^%]*thumbpdf"

all: qual prop msc phd

qual: template-qual.dvi template-qual.pdf 

msc: template-msc.dvi template-msc.pdf

prop: template-prop.dvi template-prop.pdf

phd: template-phd.dvi template-phd.pdf

%.dvi: %.tex ufbathesis.cls
	latex $<

%.pdf: %.tex ufbathesis.cls
	pdflatex $<

%.bbl %.blg : biblio.bib %.aux
	bibtex $<

%.aux : %.tex
	latex $<

dist: $(TARBALL)

$(TARBALL): ufbathesis.cls abntex2-alf.bst
	tar czf $(TARBALL) $^

index.html: README.md
	(pandoc -s -f markdown -t html $< | sed -e 's/##VERSION##/$(VERSION)/g' > $@) || ($(RM) $@; false)

upload: $(TARBALL) index.html template-qual.tex template-msc.tex template-prop.tex template-phd.tex .htaccess
	rsync -avp $^ $(UPLOAD_TO)

clean:
	$(RM) $(TARBALL)
	$(RM) *.bbl *.blg *.aux *.lof *.log *.lot *.toc *.out template*.pdf template*.dvi
	$(RM) index.html
