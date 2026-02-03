<#
.SYNOPSIS
    Security monitoring status: CloudTrail, GuardDuty, Security Hub.
.DESCRIPTION
    Aligned with Module 5 (Monitoring). Reports whether CloudTrail, GuardDuty,
    and Security Hub are enabled in the current (or specified) region(s).
.EXAMPLE
    .\Get-SecurityMonitoringStatus.ps1
.EXAMPLE
    .\Get-SecurityMonitoringStatus.ps1 -AllRegions
.NOTES
    Requires: AWS.Tools.CloudTrail, AWS.Tools.GuardDuty (GuardDuty API may vary by region)
#>
[CmdletBinding()]
param(
    [switch]$AllRegions,
    [string[]]$Regions = @((Get-DefaultAWSRegion).Region)
)

$ErrorActionPreference = 'Stop'
$modules = @('AWS.Tools.CloudTrail', 'AWS.Tools.GuardDuty')
foreach ($m in $modules) {
    if (-not (Get-Module -ListAvailable -Name $m)) {
        Write-Error "Install $m : Install-Module $m -Scope CurrentUser"
        exit 1
    }
}
Import-Module AWS.Tools.CloudTrail, AWS.Tools.GuardDuty

if ($AllRegions) {
    $Regions = (Get-AWSRegion).Region | Where-Object { $_ -notmatch '^(ap-northeast-3|me-south-2|eu-south-2|eu-central-3)$' }
}

$report = [System.Collections.Generic.List[object]]::new()
foreach ($r in $Regions) {
    $cloudTrail = $false
    $guardDuty = $false
    $securityHub = $false

    try {
        $trails = Get-CTTrail -Region $r -ErrorAction SilentlyContinue
        $cloudTrail = $trails -and $trails.Count -gt 0
    } catch { }

    try {
        $gd = Get-GDDetector -Region $r -ErrorAction SilentlyContinue
        $guardDuty = $gd -and $gd.Count -gt 0
    } catch { }

    try {
        if (Get-Module -ListAvailable -Name AWS.Tools.SecurityHub) {
            Import-Module AWS.Tools.SecurityHub
            $hub = Get-SHUBHub -Region $r -ErrorAction SilentlyContinue
            $securityHub = $null -ne $hub
        }
    } catch { }

    $report.Add([PSCustomObject]@{
        Region      = $r
        CloudTrail  = $cloudTrail
        GuardDuty   = $guardDuty
        SecurityHub = $securityHub
    })
}

Write-Host "`n=== Security Monitoring Status ===" -ForegroundColor Cyan
$report | Format-Table -AutoSize
$report