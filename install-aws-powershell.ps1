# Installs the AWS PowerShell module on the GitHub host, so we can 
# extract the version number and tag the Docker container image with it.

$global:ProgressPreference = 'SilentlyContinue'

$WebClient = [System.Net.WebClient]::new()
$AWSPowerShellURL = 'https://sdk-for-net.amazonwebservices.com/ps/v4/latest/AWS.Tools.zip'
$DestinationPath = '{0}/AWS.Tools.zip' -f $PSScriptRoot

$WebClient.DownloadFile($AWSPowerShellURL, $DestinationPath)
Expand-Archive -Path $DestinationPath -DestinationPath $env:PSModulePath.Split(':')[0]
Remove-Item -Path $DestinationPath

$ModuleVersion = (Get-Module -ListAvailable -Name AWS.Tools.Common).Version.ToString()
Write-Host -Object ('::set-output name=MODULE_VERSION::{0}' -f $ModuleVersion)
