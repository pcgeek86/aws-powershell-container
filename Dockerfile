FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine

ADD ["build.ps1", "/root/scripts/"]

RUN pwsh -File /root/scripts/build.ps1

ENTRYPOINT ["pwsh", "-NoLogo"]
