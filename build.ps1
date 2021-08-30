#!/usr/bin/env pwsh

Set-Location -Path $PSScriptRoot

$WebClient = [System.Net.WebClient]::new()
$AWSPowerShellURL = 'https://sdk-for-net.amazonwebservices.com/ps/v4/latest/AWS.Tools.zip'
$DestinationPath = '{0}/AWS.Tools.zip' -f $PSScriptRoot

$WebClient.DownloadFile($AWSPowerShellURL, $DestinationPath)

# Extract the AWS PowerShell module
Expand-Archive -Path $DestinationPath -DestinationPath $env:PSModulePath.Split(':')[0]

# Clean up the module ZIP file
Remove-Item -Path $DestinationPath

# Determine the current version of the AWS PowerShell module
$ModuleVersion = (Get-Module -ListAvailable -Name AWS.Tools.Common).Version.ToString()

# Write the module version to the GitHub workspace
# See: GITHUB_WORKSPACE environment variable https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions
Set-Content -Path $env:GITHUB_WORKSPACE/awspwsh.json -Value (@{ Version = $ModuleVersion } | ConvertTo-Json)

# Return the AWS Tools version from the script as stdout
return $ModuleVersion
