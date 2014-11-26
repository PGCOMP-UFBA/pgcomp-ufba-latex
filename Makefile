VERSION = 1.0
TARBALL = ufbathesis-$(VERSION).tar.gz
UPLOAD_TO = app.dcc.ufba.br:~/public_html/ufbathesis/

all: test

test: template.dvi template.pdf template-full.dvi template-full.pdf

%.dvi: %.tex ufbathesis.cls
	latex $<

%.pdf: %.tex ufbathesis.cls
	pdflatex $<

dist: $(TARBALL)

$(TARBALL): ufbathesis.cls abnt-alf.bst
	tar czf $(TARBALL) $^

index.html: README.md
	(pandoc -s -f markdown -t html $< | sed -e 's/##VERSION##/$(VERSION)/g' > $@) || ($(RM) $@; false)

upload: $(TARBALL) index.html template.tex template-full.tex .htaccess
	rsync -avp $^ $(UPLOAD_TO)

clean:
	$(RM) $(TARBALL)
	$(RM) *.aux *.lof *.log *.lot *.toc *.out template*.pdf template*.dvi
	$(RM) index.html
