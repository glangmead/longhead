SRCHTML=../writing/differential_geometry_in_hott/agda/html/discrete_gauge_theory.html
SRCMD=../writing/differential_geometry_in_hott/agda/discrete_gauge_theory.lagda.md
TRG=content/writing/towards_gauge_theory_in_hott/index.html
cp ../writing/differential_geometry_in_hott/agda/html/* content/writing/towards_gauge_theory_in_hott
echo "---" > $TRG
echo 'title: "Discrete Gauge Theory in Homotopy Type Theory"' >> $TRG
cat $SRCMD | head -n 20 | egrep '^[a-z][a-z]*: ' | egrep -v title >> $TRG
echo "---" >> $TRG
cat $SRCHTML | egrep -v "<title>" >> $TRG
