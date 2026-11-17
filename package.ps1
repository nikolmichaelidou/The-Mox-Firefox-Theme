$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$dist = Join-Path $root "dist"
New-Item -ItemType Directory -Force -Path $dist | Out-Null

$manifest = Get-Content -Raw (Join-Path $root "manifest.json") | ConvertFrom-Json
$output = Join-Path $dist "the-mox-$($manifest.version).xpi"
$tempZip = Join-Path $dist "the-mox-$($manifest.version).zip"

if (Test-Path $output) { Remove-Item $output }
if (Test-Path $tempZip) { Remove-Item $tempZip }

Compress-Archive -Path @(
    (Join-Path $root "manifest.json"),
    (Join-Path $root "assets")
) -DestinationPath $tempZip

Move-Item -Path $tempZip -Destination $output

Write-Host "Created $output"
