FROM continuumio/miniconda3

RUN mkdir -p codenames-duet

COPY . /codenames-duet
WORKDIR /codenames-duet

RUN apt-get update && apt-get install -y doxygen graphviz git

RUN conda env create --name codenames-duet --file environment.yml

RUN echo "conda activate codenames-duet" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

RUN pre-commit install
