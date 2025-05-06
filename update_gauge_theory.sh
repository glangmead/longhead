SRCHTML=../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/html/discrete_gauge_theory.html
SRCYML=../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/discrete_gauge_theory.yml
TRG=content/writing/differential_geometry_in_hott/index.html
cp ../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/html/* content/writing/differential_geometry_in_hott
cp ../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/discrete_gauge_theory.pdf content/writing/differential_geometry_in_hott/
cp ../writing/differential_geometry_in_hott/latex/discrete_gauge_theory/dgt_talk*.pdf content/writing/differential_geometry_in_hott/
cp content/writing/differential_geometry_in_hott/*.svg public/writing/differential_geometry_in_hott
echo "---" > $TRG
echo 'title: "Discrete differential geometry in homotopy type theory"' >> $TRG
cat $SRCYML | egrep '^[a-z][a-z]*: ' | egrep -v title >> $TRG
echo "---" >> $TRG
cat $SRCHTML | sed 's+<body>+<body><ul><li>See the talk <b><a href="https://youtu.be/gfES21UUEy4">on YouTube</a></b></li><li><b><a href="https://arxiv.org/abs/2504.20363">Arxiv link</a></li> <li>Download <a href="discrete_gauge_theory.pdf">the local PDF version</a> or <a href="dgt_talk_handout.pdf">the slides</a></b>.</li></ul><hr/>+' | sed 's+<img src="./a759d588a14f8c3262cd16583e7da6f92659664d.svg" alt="image"+<img src="./a759d588a14f8c3262cd16583e7da6f92659664d.svg" alt="image" id="eq:attach"+' | sed 's+\[eq:attach\]+above+' | egrep -v "(<title>|<h1 class=.title|<p class=.author|<p class=.date)" >> $TRG
