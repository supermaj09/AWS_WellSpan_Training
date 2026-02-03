<#
.SYNOPSIS
    Enable or verify CloudTrail in all regions.
.DESCRIPTION
    Aligned with Module 5 (Monitoring). Lists CloudTrail trails per region.
    Use AWS Console or CLI to create trails; this script is for verification.
.EXAMPLE
    .\Enable-CloudTrailMultiRegion.ps1
.EXAMPLE
    .\Enable-CloudTrailMultiRegion.ps1 -WhatIf
.NOTES
    Requires: AWS.Tools.CloudTrail. This script is read-only (reports only).
    To create trails, use AWS Console or aws cloudtrail create-trail.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$S3BucketName,
    [switch]$WhatIf
)

$ErrorActionPreference = 'Stop'
if (-not (Get-Module -ListAvailable -Name AWS.Tools.CloudTrail)) {
    Write-Error "Install AWS.Tools.CloudTrail: Install-Module AWS.Tools.CloudTrail -Scope CurrentUser"
    exit 1
}

Import-Module AWS.Tools.CloudTrail

$regions = (Get-AWSRegion).Region | Where-Object { $_ -notmatch '^(ap-northeast-3|me-south-2|eu-south-2|eu-central-3)$' }
$report = [System.Collections.Generic.List[object]]::new()

foreach ($r in $regions) {
    $trails = @()
    try {
        $trails = Get-CTTrail -Region $r -ErrorAction SilentlyContinue
    } catch { }

    $multiRegion = $trails | Where-Object { $_.IsMultiRegionTrail -eq $true }
    $report.Add([PSCustomObject]@{
        Region         = $r
        TrailCount     = $trails.Count
        HasMultiRegion = $null -ne $multiRegion -and $multiRegion.Count -gt 0
    })
}

Write-Host "`n=== CloudTrail Status by Region ===" -ForegroundColor Cyan
$report | Format-Table -AutoSize

$noTrail = $report | Where-Object { $_.TrailCount -eq 0 }
if ($noTrail) {
    Write-Host "Regions with no CloudTrail: $($noTrail.Region -join ', ')" -ForegroundColor Yellow
}
$report