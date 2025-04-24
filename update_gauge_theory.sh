SRCHTML=../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/html/discrete_gauge_theory.html
SRCYML=../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/discrete_gauge_theory.yml
TRG=content/writing/towards_gauge_theory_in_hott/index.html
cp ../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/html/* content/writing/towards_gauge_theory_in_hott
cp ../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/discrete_gauge_theory.pdf content/writing/towards_gauge_theory_in_hott/
cp ../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/dgt_talk*.pdf content/writing/towards_gauge_theory_in_hott/
echo "---" > $TRG
echo 'title: "Discrete differential geometry in homotopy type theory"' >> $TRG
cat $SRCYML | egrep '^[a-z][a-z]*: ' | egrep -v title >> $TRG
echo "---" >> $TRG
cat $SRCHTML | sed 's+<body>+<body><p><b>Download <a href="discrete_gauge_theory.pdf">the PDF version</a> or <a href="dgt_talk_handout.pdf">the slides</a></b>.</p>+' | egrep -v "(<title>|<h1 class=.title|<p class=.author|<p class=.date)" >> $TRG
