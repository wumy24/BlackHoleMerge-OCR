#!/bin/bash
# Compile the paper
# Usage: bash compile.sh

cd "$(dirname "$0")"

# Clean auxiliary files
rm -f main.aux main.bbl main.blg main.log main.out main.synctex.gz

# Compile
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex

echo "Done! Output: main.pdf"
