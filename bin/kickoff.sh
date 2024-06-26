#!/usr/bin/env node

# Build the Docker image with the provided PAT
docker build --build-arg PAT="$1" -t kitbag-kickoff-cookiecutter-image -f https://raw.githubusercontent.com/hmredmond/docker-cookiecutter/main/Dockerfile .

# Run the Docker container
docker run -it -v "$(pwd)":/app kitbag-kickoff-cookiecutter-image https://github.com/statsbomb/kitbag-kickoff.git