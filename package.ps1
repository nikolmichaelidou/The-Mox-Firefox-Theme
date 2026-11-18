param([switch]$Alt)

$ErrorActionPreference = "Stop"

$repo = $PSScriptRoot
$root = if ($Alt) { Join-Path $repo "alt" } else { $repo }
$name = if ($Alt) { "the-mox-terminal-alt" } else { "the-mox-terminal" }
$dist = Join-Path $repo "dist"
New-Item -ItemType Directory -Force -Path $dist | Out-Null

$manifest = Get-Content -Raw (Join-Path $root "manifest.json") | ConvertFrom-Json
$output = Join-Path $dist "$name-$($manifest.version).xpi"
$tempZip = Join-Path $dist "$name-$($manifest.version).zip"

if (Test-Path $output) { Remove-Item $output }
if (Test-Path $tempZip) { Remove-Item $tempZip }

Compress-Archive -Path @(
    (Join-Path $root "manifest.json"),
    (Join-Path $root "assets")
) -DestinationPath $tempZip

Move-Item -Path $tempZip -Destination $output

Write-Host "Created $output"
