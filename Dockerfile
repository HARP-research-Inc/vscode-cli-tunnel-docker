FROM alpine:3.20.3

WORKDIR /vscode

RUN wget -O /vscode/vscode_cli.tar.gz 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64'
 && tar -xf /vscode/vscode_cli.tar.gz && mv /vscode/code /usr/bin/code && rm /vscode/vscode_cli.tar.gz

ENTRYPOINT ["/usr/bin/code", "tunnel", "--accept-server-license-terms"]
