FROM python:3.9

# Install cookiecutter
RUN pip install cookiecutter

# Set the working directory
WORKDIR /app

# Set environment variable for the Personal Access Token
ARG PAT
ENV MY_PAT=$PAT

RUN echo 'TOKEN:'
RUN echo $MY_PAT
# Configure Git to use the PAT
RUN git config --global credential.helper '!f() { echo "username=${MY_PAT}"; echo "password=x-oauth-basic"; }; f'

# Set an environment variable for non-interactive mode
ENV COOKIECUTTER_NON_INTERACTIVE=true

# Set an environment variable to disable color output
ENV COOKIECUTTER_NO_INPUT=true

# Set an environment variable to enable verbose output
ENV COOKIECUTTER_VERBOSE=false

# Define the entrypoint
ENTRYPOINT ["cookiecutter"]

# Set a default command (replace with your repository URL)
CMD ["https://github.com/statsbomb/kitbag-kickoff.git"]

# End of Dockerfile

# to be run with the following commands
# docker build --build-arg PAT=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 -t cookiecutter-image .
# docker run -it -v .:/app cookiecutter-image https://github.com/statsbomb/kitbag-kickoff.git  