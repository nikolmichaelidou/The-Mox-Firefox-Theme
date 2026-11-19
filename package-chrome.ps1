param([switch]$Alt, [switch]$NewTab)

$ErrorActionPreference = "Stop"

$repo = $PSScriptRoot
$folder = if ($NewTab) { "mox-terminal-alt-newtab" } elseif ($Alt) { "mox-terminal-alt" } else { "mox-terminal" }
$root = Join-Path $repo "chrome\$folder"
$dist = Join-Path $repo "dist"
New-Item -ItemType Directory -Force -Path $dist | Out-Null

$manifest = Get-Content -Raw (Join-Path $root "manifest.json") | ConvertFrom-Json
$output = Join-Path $dist "$folder-chrome-$($manifest.version).zip"

if (Test-Path $output) { Remove-Item $output }

# Compress-Archive in Windows PowerShell 5.1 writes backslash entry names, which Chrome rejects.
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::Open($output, "Create")
try {
    $files = @(Get-ChildItem $root -File | Where-Object { $_.Name -eq "manifest.json" -or $_.Extension -in ".html", ".css", ".js" }) +
        @(Get-ChildItem (Join-Path $root "assets") -Recurse -File)
    foreach ($file in $files) {
        $entry = $file.FullName.Substring($root.Length + 1).Replace("\", "/")
        [void][System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $file.FullName, $entry)
    }
}
finally {
    $zip.Dispose()
}

Write-Host "Created $output"
