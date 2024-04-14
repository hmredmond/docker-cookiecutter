
#!/bin/bash

# Extract the PAT from the command-line argument
PAT="$1"
echo "PAT: $1"
# Build the Docker image with the provided PAT
docker build --build-arg PAT="$1" -t cookiecutter-image-4 .

# Run the Docker container
docker run -it -v "$(pwd)":/app cookiecutter-image-4 https://github.com/statsbomb/kitbag-kickoff.git