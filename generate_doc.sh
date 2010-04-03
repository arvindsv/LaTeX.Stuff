#!/bin/bash

trap 'clean' EXIT QUIT

filename_without_extension="cheatsheet"

tmpdir="parts"
function clean
{
    rm -rf "$tmpdir"
}

clean
mkdir "$tmpdir"

annotated_parts=$(grep -o '\\showpart{[^}]*}' "$filename_without_extension.tex" | sed 's#\\showpart{\([^}]*\)}.*#\1#' | sort | uniq)
for part in $annotated_parts
do
    source-highlight -s latex -f latexcolor --regex-range="%_%.*$part" \
        --outlang-def=mylatex.outlang <"$filename_without_extension".tex >"$tmpdir/$part.tex"
done

make distclean && make "$filename_without_extension".pdf && make clean
