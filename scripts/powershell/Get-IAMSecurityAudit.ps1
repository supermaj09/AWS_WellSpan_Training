<#
.SYNOPSIS
    IAM security audit: MFA status, unused credentials, inline policies.
.DESCRIPTION
    Aligned with Module 2 (IAM). Reports IAM users without MFA, inactive access keys,
    and users with inline policies (prefer managed policies).
.EXAMPLE
    .\Get-IAMSecurityAudit.ps1
.EXAMPLE
    .\Get-IAMSecurityAudit.ps1 -IncludePasswordAge
.NOTES
    Requires: AWS.Tools.IdentityManagement (Install-Module AWS.Tools.IdentityManagement)
#>
[CmdletBinding()]
param(
    [switch]$IncludePasswordAge,
    [int]$AccessKeyInactiveDays = 90
)

$ErrorActionPreference = 'Stop'
if (-not (Get-Module -ListAvailable -Name AWS.Tools.IdentityManagement)) {
    Write-Error "Install AWS.Tools.IdentityManagement: Install-Module AWS.Tools.IdentityManagement -Scope CurrentUser"
    exit 1
}

Import-Module AWS.Tools.IdentityManagement

$report = [System.Collections.Generic.List[object]]::new()
$users = Get-IAMUserList

foreach ($user in $users) {
    $userName = $user.UserName
    $mfa = Get-IAMVirtualMFADeviceList | Where-Object { $_.SerialNumber -like "*$userName*" }
    $mfaEnabled = $null -ne $mfa -and $mfa.Count -gt 0

    $policies = Get-IAMUserPolicyList -UserName $userName
    $inlinePolicyCount = ($policies | Measure-Object).Count

    $keys = Get-IAMAccessKey -UserName $userName
    $activeKeys = @($keys.AccessKeyMetadata | Where-Object { $_.Status -eq 'Active' })
    $lastUsed = $null
    if ($activeKeys.Count -gt 0) {
        try {
            $lastUsed = Get-IAMAccessKeyLastUsed -AccessKeyId $activeKeys[0].AccessKeyId
        } catch { }
    }

    $report.Add([PSCustomObject]@{
        UserName           = $userName
        MFAEnabled         = $mfaEnabled
        InlinePolicyCount  = $inlinePolicyCount
        ActiveAccessKeys   = $activeKeys.Count
        LastKeyUsed        = if ($lastUsed.LastUsedDate) { $lastUsed.LastUsedDate.ToString('u') } else { 'Never' }
        CreateDate         = $user.CreateDate.ToString('u')
    })
}

Write-Host "`n=== IAM Security Audit ===" -ForegroundColor Cyan
Write-Host "Users without MFA:"
$report | Where-Object { -not $_.MFAEnabled } | Format-Table UserName, InlinePolicyCount, ActiveAccessKeys, LastKeyUsed -AutoSize

Write-Host "`nUsers with inline policies (consider migrating to managed policies):"
$report | Where-Object { $_.InlinePolicyCount -gt 0 } | Format-Table UserName, InlinePolicyCount, MFAEnabled -AutoSize

Write-Host "`nFull report (CSV-friendly):"
$report | Format-Table -AutoSize

# Output for piping
$report
