ARG OS_VERSION=3.22.0.65
ARG DEVICE_MODEL=ferrari
ARG IMAGE_VERSION=5.2.96


FROM --platform=linux/amd64 carlonluca/qt-dev:6.8.2
ARG OS_VERSION
ARG DEVICE_MODEL
ARG IMAGE_VERSION

RUN apt update
RUN apt install -y wget python3 xz-utils file cmake ninja-build build-essential git pkg-config
RUN wget https://storage.googleapis.com/remarkable-codex-toolchain/${OS_VERSION}/${DEVICE_MODEL}/remarkable-production-image-${IMAGE_VERSION}-${DEVICE_MODEL}-public-x86_64-toolchain.sh
RUN bash remarkable-production-image-${IMAGE_VERSION}-${DEVICE_MODEL}-public-x86_64-toolchain.sh -d /opt/remarkable
RUN rm *-toolchain.sh

ENTRYPOINT ["/bin/bash"]