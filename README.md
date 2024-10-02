# <img src="https://static.wixstatic.com/media/355b75_1c4e29d87f1e449cbdfdb2b623ac66ce~mv2.png/v1/fill/w_292,h_72,fp_0.50_0.50,q_85,usm_0.66_1.00_0.01,enc_auto/355b75_1c4e29d87f1e449cbdfdb2b623ac66ce~mv2.png" width="100"> research, Inc. - VSCode CLI Tunnel Docker Container

This Docker container allows easily running the VSCode CLI's Tunnel. By using the container, you agree to the [VSCode server license](https://aka.ms/vscode-server-license).

## Container Images and Tags

Each container is built for AMD64/x64 and ARM64/aarch64 architectures. For each version, the following tags are available (for example I will use 1.93.1)

- `latest`, `base`, `1`, `1.93`, `1.93.1`, `1-base`, `1.93-base`, `1.93.1-base`, - The most up-to-date version of _just the server_. Use this tag as the base if you want to customize your own image.
- `base-dev`, `1-base-dev`, `1.93-base-dev`, `1.93.1-base-dev` - The most up-to-date version of the server with basic development tools installed (docker and git).
- `full-dev`, `1-full-dev`, `1.93-full-dev`, `1.93.1-full-dev` - The most up-to-date version of the server with a full development environment. This includes the base-dev image, plus Node.js, Python, and Bash with history support.

### Base Image

The base image is an Alpine Linux image with the VSCode server installed. It is the smallest image available and should be used to build your own images with your own curation of images. However, this will not include tools such as Git, which will make it hard to use the VSCode server for development, so if you are planning on using the VSCode server for development, use another image or extend it.

### Base Dev Image

The base dev image is based off of the base image and has basic development tools installed. This includes Docker and Git. This image is good enough for most development tasks, especially if you plan on using Dev Containers or only building with Docker. This image will require supplying a Docker daemon, either with a supplemental `dind` container or passing in a `/var/run/docker.sock` from the host.

### Full Dev Image

The full dev image is based off of the base dev image and has a "full" development environment installed. This has the Node.js and Python languages installed, which are common languages and also used at HARP Research. This image is primarily designed to be used inside of the [isolated-development-space](https://github.com/HARP-research-Inc/isolated-development-space), and is very opinionated. If you want to change the set of development tools, you should make a custom image based off of the base or base-dev image. To make it easier, you can fork the repo and change the Dockerfile commands in the full-dev stage to customize your own image.

${\color{grey}\textsf{Copyright © 2024 HARP research, Inc. Visit us at }}$ [https://harpresearch.ai](https://harpresearch.ai)
