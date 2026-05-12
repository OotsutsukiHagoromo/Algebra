#!/bin/bash

outdir="/tmp/hw_tex"

if [[ ! -a "$outdir" ]]
then
	mkdir -p "$outdir" 
fi

pdflatex \
	--shell-escape \
	--output-directory "$outdir" \
	main.tex
