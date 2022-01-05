# aws-powershell-container
This project automatically builds a container image with the latest version of the AWS PowerShell module installed.

## Run a Container

Install [Docker Desktop](https://www.docker.com/products/docker-desktop) on your system, and run the following command:

```
docker run --rm --interactive --tty --mount "src=$HOME/.aws/,dst=/root/.aws/,type=bind" ghcr.io/pcgeek86/aws-powershell-container:4.1.16.0
```
