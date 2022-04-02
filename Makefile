VERSION   = 1.1
TARBALL   = ufbathesis-$(VERSION).tar.gz
UPLOAD_TO = app.dcc.ufba.br:~/public_html/ufbathesis/

LATEX     = latex
BIBTEX    = bibtex
MAKEINDEX = makeindex
XDVI      = xdvi -gamma 4
DVIPS     = dvips
DVIPDF    = dvipdft
L2H       = latex2html
GH        = gv

RERUN     = "(There were undefined references|Rerun to get (cross-references|the bars) right)"
RERUNBIB  = "No file.*\.bbl|Citation.*undefined"
MAKEIDX   = "^[^%]*\\makeindex"
MPRINT    = "^[^%]*print"
USETHUMBS = "^[^%]*thumbpdf"

all: bsc qual prop msc phd

bsc: template-bsc.dvi template-bsc.pdf

qual: template-qual.dvi template-qual.pdf

msc: template-msc.dvi template-msc.pdf

prop: template-prop.dvi template-prop.pdf

phd: template-phd.dvi template-phd.pdf

%.dvi: %.tex ufbathesis.cls
	latex -src -interaction=nonstopmode $<

%.pdf: %.tex ufbathesis.cls
	pdflatex -synctex=1 -interaction=nonstopmode $<

%.bbl %.blg : biblio.bib %.aux
	bibtex $<

%.aux : %.tex
	latex -src -interaction=nonstopmode $<

dist: $(TARBALL)

$(TARBALL): ufbathesis.cls abntex2-alf.bst
	tar czf $(TARBALL) $^

index.html: README.md
	(pandoc -s -f markdown -t html $< | sed -e 's/##VERSION##/$(VERSION)/g' > $@) || ($(RM) $@; false)

upload: $(TARBALL) index.html template-bsc.tex template-qual.tex template-msc.tex template-prop.tex template-phd.tex .htaccess
	rsync -avp $^ $(UPLOAD_TO)

clean:
	$(RM) $(TARBALL)
	$(RM) *.bbl *.blg *.aux *.lof *.log *.lot *.toc *.out *.brf *.synctex.* template*.pdf template*.dvi
	$(RM) index.html
