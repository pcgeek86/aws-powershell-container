FROM mcr.microsoft.com/powershell:latest

ADD ["build.ps1", "/root/scripts/"]

RUN pwsh -File /root/scripts/build.ps1

ENTRYPOINT ["pwsh", "-NoLogo"]
