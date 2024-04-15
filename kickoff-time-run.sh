
#!/bin/bash

# Run the Docker container
docker run -it -v "$(pwd)":/app kitbag-kickoff-cookiecutter-image https://github.com/statsbomb/kitbag-kickoff.git