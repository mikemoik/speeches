# Build with lualatex, enable shell-escape so minted can call pygmentize.
$pdf_mode = 4;   # 4 = lualatex (1 = pdflatex, 5 = xelatex)
$lualatex = 'lualatex -shell-escape -interaction=nonstopmode -synctex=1 %O %S';
