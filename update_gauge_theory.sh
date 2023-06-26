SRCHTML=../writing/differential_geometry_in_hott/agda/html/group_extensions.html
SRCMD=../writing/differential_geometry_in_hott/agda/group_extensions.lagda.md
TRG=content/writing/towards_gauge_theory_in_hott/index.html
cp ../writing/differential_geometry_in_hott/agda/html/* content/writing/towards_gauge_theory_in_hott
echo "---" > $TRG
cat $SRCMD | head -n 20 | egrep '^[a-z][a-z]*: ' >> $TRG
echo "---" >> $TRG
cat $SRCHTML >> $TRG
