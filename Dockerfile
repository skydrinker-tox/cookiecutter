# docker build . -t cookiemaker:local

FROM python:3-alpine

LABEL org.opencontainers.image.source=https://github.com/skydrinker-tox/cookiecutter-image
LABEL org.opencontainers.image.description="Rootless image with pre-installed Cookiecutter, based on python:3-alpine image"
LABEL org.opencontainers.image.licenses=MIT

ARG IMAGE_USER
ENV IMAGE_USER=${IMAGE_USER:-cookiemaker}
ENV PATH="/home/${IMAGE_USER}/.local/bin:${PATH}"
ENV COOKIE_WORKDIR=/usr/src/cookie

USER root

RUN adduser -D ${IMAGE_USER}

RUN apk --no-cache update &&\
    apk --no-cache add bash git jq &&\
	python3 -m pip install --upgrade pip &&\
	python3 -m pip install --upgrade setuptools &&\
	mkdir -p ${COOKIE_WORKDIR} &&\
	chown ${IMAGE_USER}:0 ${COOKIE_WORKDIR} &&\
	chmod ug+rw ${COOKIE_WORKDIR}

USER ${IMAGE_USER}

RUN python3 -m pip install --user pipenv &&\
	python3 -m pip install --user cookiecutter
	
WORKDIR ${COOKIE_WORKDIR}

ENTRYPOINT ["cookiecutter"]