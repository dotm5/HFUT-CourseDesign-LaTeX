# latexmkrc — HFUT 课程设计模板构建配置
# 使用方式：latexmk  （自动检测并调用 xelatex，按需多次编译）

$pdf_mode = 5;          # xelatex
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode %O %S';
$out_dir = 'build';
$aux_dir = 'build';
