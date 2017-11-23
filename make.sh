mkdir $1
mv $1.tex $1
cd $1
platex $1.tex
dvipdfmx -f ptex-ipa.map $1.dvi
rm $1.log $1.dvi $1.aux
