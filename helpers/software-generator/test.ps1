using module ./SoftwareReport.Base.psm1
using module ./SoftwareReport.Comparer.psm1
Import-Module $(Join-Path $PSScriptRoot "SoftwareReport.Tools.psm1") -Force

$ErrorActionPreference = "Stop"
$global:ErrorView = "NormalView"

$jsonReport = Get-Content -Path $(Join-Path $PSScriptRoot "macos-11-DEMO_OUT.json") -Raw
$parsedReport = [SoftwareReport]::FromJson($jsonReport)

$parsedReport.ToJson() | Out-File -FilePath $(Join-Path $PSScriptRoot "TEST.json") -Force

$markdownReport = $parsedReport.ToMarkdown()

$markdownReport | Out-File -Path $(Join-Path $PSScriptRoot "macos-11-DEMO_OUT_2.md") -Force