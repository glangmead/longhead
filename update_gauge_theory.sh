SRCHTML=../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/html/discrete_gauge_theory.html
SRCYML=../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/discrete_gauge_theory.yml
TRG=content/writing/towards_gauge_theory_in_hott/index.html
cp ../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/html/* content/writing/towards_gauge_theory_in_hott
echo "---" > $TRG
echo 'title: "Discrete Gauge Theory in Homotopy Type Theory"' >> $TRG
cat $SRCYML | head -n 20 | egrep '^[a-z][a-z]*: ' | egrep -v title >> $TRG
echo "---" >> $TRG
cat $SRCHTML | egrep -v "<title>" >> $TRG
