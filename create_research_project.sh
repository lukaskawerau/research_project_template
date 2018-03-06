#!/bin/bash

mkdir $1

cd $1

mkdir -p "data/external" "data/raw" "data/processed" "data/interim"
touch data/external/.gitkeep data/raw/.gitkeep data/processed/.gitkeep data/interim/.gitkeep
mkdir -p "output" "replication" "src/tests" "writing/figures" "literature"
touch replication/.gitkeep src/.gitkeep writing/figures/.gitkeep src/tests/.gitkeep .here literature/.gitkeep
printf "# Ignore everything in this directory\n*\n# Except this file\n!.gitignore" >> output/.gitignore
printf "Version: 1.0

RestoreWorkspace: No
SaveWorkspace: No
AlwaysSaveHistory: No

EnableCodeIndexing: Yes
UseSpacesForTab: Yes
NumSpacesForTab: 2
Encoding: UTF-8

RnwWeave: Sweave
LaTeX: pdfLaTeX

BuildType: Makefile" >> $1.rproj

printf "# $1

## Operations
### Folder structure
- \`data\` contains the data.
  - \`data/raw\` is immutable data that is *never changed*
  - \`data/processed\` contains the data that our analysis is based on (if changed from external or raw)
  - \`data/external\` contains data that we have from foreign sources: control variables etc. etc.
- \`literature\` contains the .bib file with references as well as PDFs
- \`output\` contains the final text product
- \`replication\` will house the final submission data and code for the journal
- \`src\` contains source code files: analysis, preprocessing etc.
- \`writing\` contains figures and text." >> README.md

if [ -z "$2" ]
  then
    git init
    git add .
    git commit -m "Initial Commit"
    echo "No remote repository added."
else
    git init
    git add .
    git commit -m "Initial Commit"
    git remote add origin $2
    git push -u origin master
fi

