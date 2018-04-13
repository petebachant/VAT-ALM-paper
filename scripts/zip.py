#!/usr/bin/env python
"""This script zips up all the necessary source files to compile the paper."""

from zipfile import ZipFile
from subprocess import check_output
import os

# Describe version via git
version = check_output(["git", "describe", "--always",
                        "--dirty"]).strip().decode()

figures = ["figures/" + f for f in os.listdir("figures") \
           if f.endswith(".pdf") or f.endswith(".png")]

# Some figs were removed to shorten submission
removed_figs = ["CFT-vectors_alpha_deg_urel_geom",
                "thesis_alm-geometry",
                "end-effects_rvat-20-deg",
                "RM2-ALM_meancontquiv",
                "RM2-ALM_kcont",
                "RM2-ALM_wake-profiles",
                "RM2-ALM_recovery-bar-chart"]

for fig in figures:
    for f in removed_figs:
        if f in fig:
            figures.remove(fig)

files = ["paper.tex", "paper.bbl", "logo-mdpi-eps-converted-to.pdf",
         "logo-updates.pdf", "chicago2.bst", "mdpi.cls", "mdpi.bst"]

with ZipFile("archive/paper-{}.zip".format(version), "w") as f:
    for fig in figures:
        f.write(fig)
    for file in files:
        if "-eps-converted-to" in file:
            arcname = file.replace("-eps-converted-to", "")
        else:
            arcname = None
        f.write(file, arcname=arcname)
