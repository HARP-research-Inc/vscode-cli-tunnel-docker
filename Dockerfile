FROM alpine:3.20.3 AS base

WORKDIR /vscode
ARG VERSION=latest

RUN ARCH_FULL=`uname -m`; case "$ARCH_FULL" in "x86_64") ARCH="x64";; "aarch64") ARCH="arm64";; esac \
    && wget -O /vscode/vscode_cli.tar.gz https://update.code.visualstudio.com/${VERSION}/cli-alpine-${ARCH}/stable \
    && tar -xf /vscode/vscode_cli.tar.gz  \
    && mv /vscode/code /usr/bin/code \
    && rm /vscode/vscode_cli.tar.gz

# Dependencies of node.js, which is a requirement
RUN apk add ca-certificates so:libada.so.2 so:libbase64.so.0 so:libbrotlidec.so.1 so:libbrotlienc.so.1 so:libcares.so.2 so:libcrypto.so.3 so:libgcc_s.so.1 so:libicui18n.so.74 so:libicuuc.so.74 so:libnghttp2.so.14 so:libssl.so.3 so:libstdc++.so.6 so:libz.so.1

ENTRYPOINT ["/usr/bin/code", "tunnel", "--accept-server-license-terms"]

FROM base AS base-dev
# We want an environment where developers can run commands and have a development environment where they can run any commands they might need

RUN apk add git
RUN apk add docker-cli

FROM base-dev AS full-dev

# Common programming languages
RUN apk add nodejs npm python3 py3-pip

# Useful for monitoring the server
RUN apk add jq
