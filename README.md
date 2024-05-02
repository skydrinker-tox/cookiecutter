# Dockerized Cookiecutter

Rootless image with pre-installed [Cookiecutter](https://github.com/cookiecutter/cookiecutter), based on `python:3-alpine` image.

Packages added to the base `python:3-alpine` image:
- bash
- git
- pipenv (python pip package)
- pipenv (python pip cookiecutter)

## Build & Publish

```bash
# Build and tag latest
docker build . -t v4leri4n/cookiecutter:alpine-python-3
docker tag v4leri4n/cookiecutter:alpine-python-3 v4leri4n/cookiecutter:latest
# Publish
docker push v4leri4n/cookiecutter:alpine-python-3 
docker push v4leri4n/cookiecutter:latest
```

## Usage

Calls the `cookiecutter` CLI from the current directory (will display *cookiecutter* help if no argument provided):

```
docker run -it --rm -v "$PWD":/usr/src/cookie v4leri4n/cookiecutter:latest 
```

Example, bake cookie from Github repository (official *cookiecutter* example):


```
docker run -it --rm -v "$PWD":/usr/src/cookie v4leri4n/cookiecutter:latest gh:audreyfeldroy/cookiecutter-pypackage
```

