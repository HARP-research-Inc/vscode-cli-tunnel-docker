# VSCode CLI Tunnel Docker Container

This Docker container allows easily running the VSCode CLI's Tunnel. By using the container, you agree to the [VSCode server license](https://aka.ms/vscode-server-license).

## Container Images and Tags

Each container is built for AMD64/x64 and ARM64/aarch64 architectures. For each version, the following tags are available (for example I will use 1.93.1)

- `latest`, `latest-base`, `1.93.1`, `1.93.1-base` - The most up-to-date version of *just the server*. Use this tag as the base if you want to customize your own image.
- `latest-base-dev`, `1.93.1-base-dev` - The most up-to-date version of the server with basic development tools installed (docker and git). Use this if you want to use version control and/or externally provide a Docker container. This container is *good enough* for most development tasks, especially if you plan on using Dev Containers.
- `latest-full-dev`, `1.93.1-full-dev` - The most up-to-date version of the server with a full development environment. This includes the base-dev image, plus Node.js, Python, and Bash with history support.
