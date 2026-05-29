#!/bin/bash

outdir="/tmp/hw_tex"

do_pdflatex() {
	pdflatex \
		--shell-escape \
		--output-directory "$outdir" \
		main.tex
}

do_biblatex() {
	biber \
		--output-directory "$outdir" \
		main
}

if [[ ! -a "$outdir" ]]
then
	mkdir -p "$outdir" 
fi

case $1 in
	--all)
		do_pdflatex
		do_biblatex
		do_pdflatex
		;;

	*)
		do_pdflatex
esac
