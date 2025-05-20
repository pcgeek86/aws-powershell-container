# aws-powershell-container
This project automatically builds a container image with the latest version of the AWS PowerShell module installed.

## Prerequisites

In order to use this container image, you'll need to configure your [AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) at the standard filesystem location: `$HOME/.aws/credentials`.
You can use the AWS CLI tool or the `Set-AWSCredential` command in the AWS PowerShell module, or manually craft the INI file using your preferred text editor.

## Run a Container

Install [Docker Desktop](https://www.docker.com/products/docker-desktop) on your system, and run the following command:

```
docker run --rm --interactive --tty --mount "src=$HOME/.aws/,dst=/root/.aws/,type=bind" ghcr.io/pcgeek86/aws-powershell-container:4.1.822
```

This command will make your AWS config and credential files accessible to the container, so you don't have to perform any duplicate configuration.
