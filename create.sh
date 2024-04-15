#!/bin/bash

# Extract the PAT from the command-line argument
PAT="$1"
echo "PAT: $1"

curl -O https://raw.githubusercontent.com/hmredmond/docker-cookiecutter/main/kickoff-time.sh
chmod +x kickoff-time.sh 
sh ./kickoff-time.sh $PAT