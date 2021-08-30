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

# Attempt to use the GitHub workflow commands to set a variable
# See: https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions#using-workflow-commands-to-access-toolkit-functions
Write-Host -Object ('::set-output name=MODULE_VERSION::{0}' -f $ModuleVersion)
Write-Output -Object ('::set-output name=MODULE_VERSION::{0}' -f $ModuleVersion)

# Return the AWS Tools version from the script as stdout
return $ModuleVersion
