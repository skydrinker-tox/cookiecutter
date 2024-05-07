# Dockerized Cookiecutter

[![CI build](https://github.com/skydrinker-tox/cookiecutter/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/skydrinker-tox/cookiecutter/actions/workflows/docker-publish.yml)
[![Latest image](https://img.shields.io/badge/ghcr.io%2Fskydrinker--tox%2Fcookiecutter-latest-blue)](https://github.com/skydrinker-tox/cookiecutter/pkgs/container/cookiecutter)


Rootless image with pre-installed [Cookiecutter](https://github.com/cookiecutter/cookiecutter), based on `python:3-alpine` image.

Packages added to the base `python:3-alpine` image:
- bash
- git
- pipenv (python pip package)
- pipenv (python pip cookiecutter)

## Usage

Calls the `cookiecutter` CLI from the current directory (will display *cookiecutter* help if no argument provided):

```
docker run -it --rm -v "$PWD":/usr/src/cookie ghcr.io/skydrinker-tox/cookiecutter:latest
```

Example, bake cookie from Github repository (official *cookiecutter* example):


```
docker run -it --rm -v "$PWD":/usr/src/cookie ghcr.io/skydrinker-tox/cookiecutter:latest gh:audreyfeldroy/cookiecutter-pypackage
```

