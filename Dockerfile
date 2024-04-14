FROM python:3.9

# Install cookiecutter
RUN pip install cookiecutter

# Set working directory
WORKDIR /app

# Set environment variable for the Personal Access Token
ARG PAT
ENV MY_PAT=$PAT

RUN echo $MY_PAT
# Configure Git to use the PAT
RUN git config --global credential.helper '!f() { echo "username=${MY_PAT}"; echo "password=x-oauth-basic"; }; f'

# # Create a script for downloading the folder structure
RUN echo '#!/bin/bash' >> /app/download.sh \
    && echo 'mkdir -p /app/output' >> /app/download.sh \
    && echo 'cd /app/output' >> /app/download.sh \
    && echo 'wget --recursive --no-parent --no-host-directories http://localhost:8000/output/' >> /app/download.sh \
    && chmod +x /app/download.sh

RUN echo 'About to run cookiecutter'

# Run cookiecutter command and save artifacts
RUN cookiecutter --no-input gh:statsbomb/kitbag-kickoff

CMD ls && cp -R Kickoff-project-name/* /app/output/ \
    && /app/download.sh