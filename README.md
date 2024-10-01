# <img src="https://static.wixstatic.com/media/355b75_1c4e29d87f1e449cbdfdb2b623ac66ce~mv2.png/v1/fill/w_292,h_72,fp_0.50_0.50,q_85,usm_0.66_1.00_0.01,enc_auto/355b75_1c4e29d87f1e449cbdfdb2b623ac66ce~mv2.png" width="100"> research, Inc. - VSCode CLI Tunnel Docker Container

This Docker container allows easily running the VSCode CLI's Tunnel. By using the container, you agree to the [VSCode server license](https://aka.ms/vscode-server-license).

## Container Images and Tags

Each container is built for AMD64/x64 and ARM64/aarch64 architectures. For each version, the following tags are available (for example I will use 1.93.1)

- `latest`, `base`, `1.93.1`, `1.93.1-base` - The most up-to-date version of _just the server_. Use this tag as the base if you want to customize your own image.
- `base-dev`, `1.93.1-base-dev` - The most up-to-date version of the server with basic development tools installed (docker and git). Use this if you want to use version control and/or externally provide a Docker container. This container is _good enough_ for most development tasks, especially if you plan on using Dev Containers.
- `full-dev`, `1.93.1-full-dev` - The most up-to-date version of the server with a full development environment. This includes the base-dev image, plus Node.js, Python, and Bash with history support.

${\color{grey}\textsf{Copyright © 2024 HARP research, Inc. Visit us at }}$ [https://harpresearch.ai](https://harpresearch.ai)
