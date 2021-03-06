# Base Dockerfile for CAPTools project.
# See https://docs.docker.com/reference/builder/ for configuration references.
# See https://docs.docker.com/#installation-guides for Docker installation.

FROM google/python

# Copy packages file.
ADD packages.txt /app/

# Install required packages.
RUN apt-get -q update ; \
    apt-get install -y -q $(grep -vE "^\s*#" packages.txt | tr "\n" " ")

# Copy requirements file.
ADD requirements.txt /app/

# Resolve Python modules dependencies.
RUN pip install --upgrade pip
#RUN pip install -r requirements.txt

# Copy application source files.
ADD . /app/
