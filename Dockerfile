FROM python:3.11-slim

RUN apt update && apt upgrade -y
RUN apt install -y curl
ENV POETRY_HOME=/opt/poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry
RUN poetry config virtualenvs.create false

COPY ./pyproject.toml .
RUN apt install -y gcc
RUN poetry install
RUN apt install -y graphviz