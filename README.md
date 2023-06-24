# Greg tips

For HTMl generated elsewhere such as the `writing` repo, I did steps like this:

    hugo new --kind post writing/towards_gauge_theory_in_hott
    rm content/writing/towards_gauge_theory_in_hott/index.md
    cp ~/proj/writing/differential_geometry_in_hott/agda/html/* content/writing/towards_gauge_theory_in_hott
    mv content/writing/towards_gauge_theory_in_hott/group_extensions.html content/writing/towards_gauge_theory_in_hott/index.html
    # edit index.html to put a yaml header at the top with a date, else it's not added to the writing/ index
    hugo serve

