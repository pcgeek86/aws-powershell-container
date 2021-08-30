#!/usr/bin/env pwsh

Set-Location -Path $PSScriptRoot

$WebClient = [System.Net.WebClient]::new()
$AWSPowerShellURL = 'https://sdk-for-net.amazonwebservices.com/ps/v4/latest/AWS.Tools.zip'
$DestinationPath = '{0}/AWS.Tools.zip' -f $PSScriptRoot

$WebClient.DownloadFile($AWSPowerShellURL, 'AWS.Tools.zip')

# Extract the AWS PowerShell module
Expand-Archive -Path $DestinationPath -DestinationPath $env:PSModulePath.Split(':')[0]

# Return the AWS Tools version from the script
return (Get-Module -ListAvailable -Name AWS.Tools.Common).Version
