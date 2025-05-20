# Microsoft appears to have retired the mcr.microsoft.com/powershell container image
# The PowerShell documentation now references the dotnet container image, which includes PowerShell installed
FROM mcr.microsoft.com/dotnet/sdk:latest

ADD ["build.ps1", "/root/scripts/"]

RUN pwsh -File /root/scripts/build.ps1

ENTRYPOINT ["pwsh", "-NoLogo"]
