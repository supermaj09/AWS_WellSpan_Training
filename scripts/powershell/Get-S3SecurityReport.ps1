<#
.SYNOPSIS
    S3 security report: public access, encryption, versioning.
.DESCRIPTION
    Aligned with Module 4 (Data Protection). Lists buckets and reports on
    Block Public Access, default encryption, and versioning status.
.EXAMPLE
    .\Get-S3SecurityReport.ps1
.EXAMPLE
    .\Get-S3SecurityReport.ps1 -Region us-east-1
.NOTES
    Requires: AWS.Tools.S3 (Install-Module AWS.Tools.S3)
#>
[CmdletBinding()]
param(
    [string]$Region = (Get-DefaultAWSRegion).Region
)

$ErrorActionPreference = 'Stop'
if (-not (Get-Module -ListAvailable -Name AWS.Tools.S3)) {
    Write-Error "Install AWS.Tools.S3: Install-Module AWS.Tools.S3 -Scope CurrentUser"
    exit 1
}

Import-Module AWS.Tools.S3

$buckets = Get-S3Bucket -Region $Region
$report = [System.Collections.Generic.List[object]]::new()

foreach ($bucket in $buckets) {
    $name = $bucket.BucketName
    $encryption = $null
    $versioning = $null
    $blockPublic = $null

    try {
        $encryption = Get-S3BucketEncryption -BucketName $name -Region $Region -ErrorAction SilentlyContinue
    } catch { }
    try {
        $versioning = Get-S3BucketVersioning -BucketName $name -Region $Region -ErrorAction SilentlyContinue
    } catch { }
    try {
        $blockPublic = Get-S3PublicAccessBlock -BucketName $name -Region $Region -ErrorAction SilentlyContinue
    } catch { }

    $report.Add([PSCustomObject]@{
        BucketName       = $name
        Encryption       = if ($encryption.ServerSideEncryptionConfiguration?.Rules) { 'Enabled' } else { 'None' }
        Versioning       = if ($versioning.Status -eq 'Enabled') { 'Enabled' } else { 'Off' }
        BlockPublicAcl   = if ($blockPublic?.BlockPublicAcls) { $true } else { $false }
        BlockPublicPolicy = if ($blockPublic?.BlockPublicPolicy) { $true } else { $false }
    })
}

Write-Host "`n=== S3 Security Report ($Region) ===" -ForegroundColor Cyan
Write-Host "Buckets without encryption:"
$report | Where-Object { $_.Encryption -eq 'None' } | Format-Table BucketName, Versioning, BlockPublicAcl -AutoSize

Write-Host "`nBuckets without versioning:"
$report | Where-Object { $_.Versioning -eq 'Off' } | Format-Table BucketName, Encryption -AutoSize

Write-Host "`nFull report:"
$report | Format-Table -AutoSize

$report