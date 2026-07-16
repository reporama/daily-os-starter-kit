# day-status.ps1 — SessionStart hook: summary of open tails in the last 7 day files.
# Reads-only. No writes to vault. No AI. UTF-8 with BOM (PS 5.1 compatible).
$ErrorActionPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$vault = $PSScriptRoot -replace '\\\.claude\\hooks$', ''   # Get parent folder
$files = @(Get-ChildItem -Path $vault -Filter '20??-??-??.md' -File -ErrorAction SilentlyContinue | Sort-Object Name | Select-Object -Last 7)

if ($files.Count -eq 0) {
    Write-Output '[status]: no day files yet'
    exit 0
}

$openEvenings = @()   # Evening review missing
$emptyDone = @()      # "Done" section empty
$emptyEmotions = 0    # Emotional background empty

foreach ($f in $files) {
    $day = $f.BaseName.Substring(5)   # MM-DD
    $t = Get-Content -Path $f.FullName -Raw -Encoding utf8 -ErrorAction SilentlyContinue

    # Skip anchor entries (minimal catch-up files, base.md 16.14) - marked by a literal first line
    if ($t -match '(?m)^_anchor entry_') { continue }

    # Check for Evening review section
    if ($t -notmatch '(?m)^##\s+Evening review') {
        $openEvenings += $day
        continue   # No evening → skip Done/Emotions checks
    }

    # Check Done section
    if ($t -match '(?ms)^###\s*1\.\s*Done.*?\n(.*?)(?=^###\s|\z)') {
        $body = ($matches[1] -replace '[-*\s—\[\]\.\—]', '')
        if ($body.Length -lt 3) { $emptyDone += $day }
    }

    # Check Emotional background (5 fields)
    if ($t -match '(?ms)^###\s*Emotional background.*?\n(.*?)(?=^###\s|^##\s|\z)') {
        $emo = $matches[1] -replace '(?m)^\*\*.*$', '' -replace '[-*\s—\[\]]', ''
        if ($emo.Length -lt 5) { $emptyEmotions++ }
    }
}

$parts = @()
if ($openEvenings.Count -gt 0) { $parts += 'evening not closed: ' + ($openEvenings -join ', ') }
if ($emptyDone.Count -gt 0)    { $parts += '"Done" empty: ' + ($emptyDone -join ', ') }
if ($emptyEmotions -gt 0)      { $parts += "emotions empty $emptyEmotions of $($files.Count)" }

# Cycle end check: parse current-plan.md header for end date (DD.MM–DD.MM.YYYY)
$plan = Join-Path $vault 'current-plan.md'
if (Test-Path $plan -ErrorAction SilentlyContinue) {
    $planText = Get-Content -Path $plan -Raw -Encoding utf8 -ErrorAction SilentlyContinue
    if ($planText -match '(\d{1,2})\.(\d{1,2})\s*[–\-—]\s*(\d{1,2})\.(\d{1,2})\.(\d{4})') {
        try {
            $end = Get-Date -Year ([int]$matches[5]) -Month ([int]$matches[4]) -Day ([int]$matches[3]) -Hour 0 -Minute 0 -Second 0 -ErrorAction Stop
            if ((Get-Date).Date -ge $end.Date) {
                $parts += ('cycle ends {0:D2}.{1:D2} — run /cycle' -f [int]$matches[3], [int]$matches[4])
            }
        } catch {}
    }
}

if ($parts.Count -eq 0) {
    Write-Output '[status]: no open tails'
} else {
    Write-Output ('[status]: ' + ($parts -join '; '))
}
