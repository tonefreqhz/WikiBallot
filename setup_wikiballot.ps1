# ============================================================
# WikiBallot Hugo Setup Script
# Run from: C:\Users\peewe\Documents\DoughForge\WikiBallot\
# ============================================================

$ErrorActionPreference = "Stop"
$WikiBallot = "C:\Users\peewe\Documents\DoughForge\WikiBallot"
$HugoSource = "$WikiBallot\hugo_source"

Write-Host "`n=== WikiBallot Hugo Setup ===" -ForegroundColor Cyan

# ── Step 1: Find the zip ──────────────────────────────────────
$zip = Get-ChildItem "$env:USERPROFILE\Downloads\WikiBallot_DoughForge_06jun2026.zip" `
       -ErrorAction SilentlyContinue | Select-Object -First 1

if (-not $zip) {
    # Try current directory
    $zip = Get-ChildItem "$WikiBallot\WikiBallot_DoughForge_06jun2026.zip" `
           -ErrorAction SilentlyContinue | Select-Object -First 1
}

if ($zip) {
    Write-Host "Found zip: $($zip.FullName)" -ForegroundColor Green
    Write-Host "Extracting..."

    # Extract to a temp folder then move contents up
    $temp = "$env:TEMP\wikiballot_extract"
    if (Test-Path $temp) { Remove-Item $temp -Recurse -Force }
    Expand-Archive -Path $zip.FullName -DestinationPath $temp -Force

    # The zip contains a 'wikiballot' subfolder — move its contents here
    $inner = Get-ChildItem $temp -Directory | Select-Object -First 1
    if ($inner) {
        Write-Host "Moving files from $($inner.Name) to WikiBallot root..."
        Get-ChildItem $inner.FullName | ForEach-Object {
            $dest = "$WikiBallot\$($_.Name)"
            if (-not (Test-Path $dest)) {
                Copy-Item $_.FullName $dest -Recurse -Force
                Write-Host "  Copied: $($_.Name)" -ForegroundColor Gray
            } else {
                Write-Host "  Skipped (exists): $($_.Name)" -ForegroundColor DarkGray
            }
        }
    }
    Remove-Item $temp -Recurse -Force
} else {
    Write-Host "Zip not found in Downloads or WikiBallot folder." -ForegroundColor Yellow
    Write-Host "Will check if hugo_source already exists..."
}

# ── Step 2: Verify hugo_source exists ────────────────────────
if (-not (Test-Path $HugoSource)) {
    Write-Host "`nhugo_source not found. Creating minimal structure..." -ForegroundColor Yellow

    # Create directory tree
    @(
        "hugo_source\content\manifesto",
        "hugo_source\content\evidence",
        "hugo_source\content\constituency",
        "hugo_source\content\doctrine",
        "hugo_source\content\duplicate",
        "hugo_source\content\bourgeois-resolution",
        "hugo_source\themes\withholding\layouts\_default",
        "hugo_source\themes\withholding\layouts\partials",
        "hugo_source\themes\withholding\static\css",
        "hugo_source\static\admin",
        "hugo_source\static\bourgeois-resolution",
        ".github\workflows",
        "tools"
    ) | ForEach-Object {
        New-Item -ItemType Directory -Force -Path "$WikiBallot\$_" | Out-Null
    }
    Write-Host "Directory structure created." -ForegroundColor Green
}

# ── Step 3: Verify config.toml ───────────────────────────────
$config = "$HugoSource\config.toml"
if (-not (Test-Path $config)) {
    Write-Host "Writing config.toml..." -ForegroundColor Yellow
    @'
baseURL       = "https://tonefreqhz.github.io/"
relativeURLs  = false
languageCode  = "en-gb"
title         = "The Great Withholding"
theme         = "withholding"
enableRobotsTXT = true

[params]
  anchor   = "c9ced1a"
  tagline  = "Every copy is a node. Every node is sovereign."
  author   = "Roger G. Lewis"
  wikiballot  = "https://wikitacticalvoting.miraheze.org"
  doughforge  = "https://www.doughforge.org"
  github      = "https://github.com/tonefreqhz/WikiBallot"
  weebly      = "https://wikiballot.weebly.com"
  substack    = "https://substack.com/@rogerglewis"

[menu]
  [[menu.main]]
    name = "Manifesto"
    url  = "/manifesto/"
    weight = 1
  [[menu.main]]
    name = "Evidence"
    url  = "/evidence/"
    weight = 2
  [[menu.main]]
    name = "Bourgeois Resolution"
    url  = "/bourgeois-resolution/"
    weight = 3
  [[menu.main]]
    name = "Constituency"
    url  = "/constituency/"
    weight = 4
  [[menu.main]]
    name = "Doctrine"
    url  = "/doctrine/"
    weight = 5
  [[menu.main]]
    name = "Duplicate Dongle"
    url  = "/duplicate/"
    weight = 6

[markup.goldmark.renderer]
  unsafe = true
'@ | Set-Content $config -Encoding UTF8
    Write-Host "config.toml written." -ForegroundColor Green
}

# ── Step 4: Check theme layouts exist ────────────────────────
$baseof = "$HugoSource\themes\withholding\layouts\_default\baseof.html"
if (-not (Test-Path $baseof)) {
    Write-Host "`nTheme layouts missing. You need the files from the zip." -ForegroundColor Red
    Write-Host "Download WikiBallot_DoughForge_06jun2026.zip from Claude and place in Downloads,"
    Write-Host "then re-run this script."
    Write-Host "`nFor now, creating a minimal baseof.html so hugo server starts..."

    @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{{ if .IsHome }}{{ .Site.Title }}{{ else }}{{ .Title }} — {{ .Site.Title }}{{ end }}</title>
<style>
  body { font-family: Georgia, serif; max-width: 800px; margin: 40px auto;
         padding: 20px; background: #faf7f2; color: #1a1a1a; }
  header { border-bottom: 3px solid #8b0000; margin-bottom: 30px; padding-bottom: 10px; }
  header a { color: #8b0000; text-decoration: none; font-size: 1.3em; font-weight: bold; }
  nav a { margin-right: 16px; color: #8b0000; text-decoration: none; font-size: 0.9em; }
  footer { border-top: 1px solid #ccc; margin-top: 40px; padding-top: 14px;
           font-size: 0.8em; color: #888; }
</style>
</head>
<body>
<header>
  <a href="{{ "/" | relURL }}">THE GREAT WITHHOLDING</a>
  <nav>
    {{ range .Site.Menus.main }}
    <a href="{{ .URL }}">{{ .Name }}</a>
    {{ end }}
  </nav>
</header>
<main>{{ block "main" . }}{{ end }}</main>
<footer>W-Anchor: c9ced1a &nbsp;|&nbsp; CC BY-SA 4.0 &nbsp;|&nbsp; Every copy is a node. Every node is sovereign.</footer>
</body>
</html>
'@ | Set-Content $baseof -Encoding UTF8

    # Minimal single.html
    @'
{{ define "main" }}
<h1>{{ .Title }}</h1>
{{ .Content }}
{{ end }}
'@ | Set-Content "$HugoSource\themes\withholding\layouts\_default\single.html" -Encoding UTF8

    # Minimal list.html
    @'
{{ define "main" }}
<h1>{{ .Title }}</h1>
{{ .Content }}
{{ range .Pages }}<p><a href="{{ .RelPermalink }}">{{ .Title }}</a></p>{{ end }}
{{ end }}
'@ | Set-Content "$HugoSource\themes\withholding\layouts\_default\list.html" -Encoding UTF8

    # Minimal index.html
    @'
{{ define "main" }}
<h1>The Great Withholding</h1>
<p><a href="/manifesto/">Read the Manifesto</a></p>
<p><a href="/evidence/">Evidence Appendix</a></p>
<p><a href="/bourgeois-resolution/">Bourgeois Resolution</a></p>
<p><a href="/constituency/">Find Your Constituency</a></p>
<p><a href="/duplicate/">Duplicate This Dongle</a></p>
{{ end }}
'@ | Set-Content "$HugoSource\themes\withholding\layouts\index.html" -Encoding UTF8

    Write-Host "Minimal theme written. Replace with full theme from zip when available." -ForegroundColor Yellow
}

# ── Step 5: Ensure _index.md exists ──────────────────────────
if (-not (Test-Path "$HugoSource\content\_index.md")) {
    @'
---
title: "The Great Withholding"
---
'@ | Set-Content "$HugoSource\content\_index.md" -Encoding UTF8
    Write-Host "content/_index.md created." -ForegroundColor Green
}

# ── Step 6: Show what we have ─────────────────────────────────
Write-Host "`n=== Directory structure ===" -ForegroundColor Cyan
Get-ChildItem $HugoSource -Recurse -File | ForEach-Object {
    Write-Host "  $($_.FullName.Replace($HugoSource, ''))" -ForegroundColor Gray
}

# ── Step 7: Run hugo server ───────────────────────────────────
Write-Host "`n=== Starting Hugo server ===" -ForegroundColor Cyan
Write-Host "Open your browser at: http://localhost:1313" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop.`n" -ForegroundColor Yellow

Set-Location $HugoSource
hugo server -D
