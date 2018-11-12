SHELL    = /bin/bash
LATEX = lualatex
BIBTEX   = bibtex
DVIPS    = dvips

BASENAME = project

all: text cv.pdf proposal_abstract.pdf proposal.pdf relevance.pdf thesis_abstract.pdf training.pdf

text:
	latexmk -$(LATEX) -logfilewarnings -halt-on-error $(BASENAME)

%.pdf : %.tex
	latexmk -$(LATEX) -logfilewarnings -halt-on-error $*

final:
	if [ -f *.aux ]; then \
		$(MAKE) clean; \
	fi
	$(MAKE) all
	$(MAKE) clean


clean:
	rm -f *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
		  *.fls *.fdb_latexmk \
	      *.inx *.dvi *.toc *.ptc *.out *~ ~* spellTmp

realclean: clean
	rm -f *.ps *.pdf
