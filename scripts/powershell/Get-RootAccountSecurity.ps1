<#
.SYNOPSIS
    Root account security: MFA and access key check.
.DESCRIPTION
    Aligned with Module 7 (Best Practices). Checks whether the root account
    has MFA enabled and has no access keys (root should not use access keys).
.EXAMPLE
    .\Get-RootAccountSecurity.ps1
.NOTES
    Requires: AWS.Tools.IdentityManagement. Summary only; root credentials
    are required to manage root MFA/keys. Run with credentials that can
    call GetAccountSummary.
#>
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
if (-not (Get-Module -ListAvailable -Name AWS.Tools.IdentityManagement)) {
    Write-Error "Install AWS.Tools.IdentityManagement: Install-Module AWS.Tools.IdentityManagement -Scope CurrentUser"
    exit 1
}

Import-Module AWS.Tools.IdentityManagement

try {
    $summary = Get-IAMAccountSummary
} catch {
    Write-Error "Could not get account summary. Ensure IAM permissions include iam:GetAccountSummary."
    exit 1
}

$rootMFA = $summary.SummaryMap['AccountMFAEnabled'] -eq 1
$rootKeys = [int]$summary.SummaryMap['AccountAccessKeysPresent']

Write-Host "`n=== Root Account Security ===" -ForegroundColor Cyan
Write-Host "Root MFA enabled: $rootMFA"
Write-Host "Root access keys present: $rootKeys"

if (-not $rootMFA) {
    Write-Host "Recommendation: Enable MFA for the root account." -ForegroundColor Yellow
}
if ($rootKeys -gt 0) {
    Write-Host "Recommendation: Remove root access keys; use IAM users/roles instead." -ForegroundColor Yellow
}
if ($rootMFA -and $rootKeys -eq 0) {
    Write-Host "Root account security checks passed." -ForegroundColor Green
}

[PSCustomObject]@{
    RootMFAEnabled = $rootMFA
    RootAccessKeysPresent = $rootKeys
}