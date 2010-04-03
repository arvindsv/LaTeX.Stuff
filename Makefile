%.pdf: %.tex
	xelatex $*

clean:
	$(RM) *.dvi *.log *.aux

distclean: clean
	$(RM) *.pdf
