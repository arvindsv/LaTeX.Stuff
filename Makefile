%.pdf: %.tex
	xelatex $*
	xelatex $*

clean:
	$(RM) *.dvi *.log *.aux *.out

distclean: clean
	$(RM) *.pdf
