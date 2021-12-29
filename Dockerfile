FROM mcr.microsoft.com/dotnet/sdk:6.0

ADD ["build.ps1", "/root/scripts/"]

RUN pwsh -File /root/scripts/build.ps1

ENTRYPOINT ["pwsh", "-NoLogo"]
