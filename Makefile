%.pdf: %.tex
	xelatex $*

clean:
	$(RM) *.dvi *.log *.aux *.out

distclean: clean
	$(RM) *.pdf
