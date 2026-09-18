# KEEP graduation smoke for GEVR Beta zips - does NOT depend on gevr-*-boot.cmd
# assigning the live KEEP allowlist.
#
# Product goal: unset env = ON for shipped KEEP arms in goldeneye.exe (C defaults).
# Until boot.cmd is slimmed to wipe + stamp only, run BOTH:
#   _smoke-ship-zip.ps1   (boot mirror must match today)
#   _smoke-keep-nobat.ps1 (binary must carry KEEP knob names; wiring only on bat)
#
# This script never invokes gevr-*-boot.cmd. C defaults in getv are the source of
# truth for whether unset env arms KEEP; boot.cmd may mirror KEEP for transition.
#
# Checklist and top-15 C-default-ON knobs: packaging/KEEP-SHIP-DEFAULTS.md
[CmdletBinding()]
param(
    [string]$ZipPath = "",
    [string]$StagingDir = "",
    [string]$ShipTag = "vr441"
)

$ErrorActionPreference = "Stop"

if (-not $ZipPath -and -not $StagingDir) {
    throw "Pass -ZipPath and/or -StagingDir"
}
if ($ZipPath -and $StagingDir) {
    throw "Pass only one of -ZipPath or -StagingDir per invocation"
}

# Top 15 KEEP arms that must be ON at C default when env is unset (see KEEP-SHIP-DEFAULTS.md).
$cDefaultOnKnobs = @(
    "GETV_VR",
    "GETV_VR_CORPSEKEEP",
    "GETV_VR_TEXINVAL",
    "GETV_VR_TEXDLRETAG",
    "GETV_VR_VFXTMEM",
    "GETV_VR_VFXSHIFT",
    "GETV_TEX16BE",
    "GETV_TEX32BE",
    "GETV_VR_VTXGUARD",
    "GETV_VR_ADSSIGHT",
    "GETV_SUPERSAMPLE",
    "GETV_XR_PLAY_SRCFBO",
    "GETV_STEREO_SRC",
    "GETV_VR_SKYMESH",
    "GETV_VR_PLAYSPACE"
)

function Fail([string]$msg) {
    Write-Error "[keep-nobat] FAIL: $msg"
    exit 1
}

function Pass([string]$msg) {
    Write-Host "[keep-nobat] OK: $msg"
}

function Get-BootCmd([string]$root) {
    $boot = Get-ChildItem -LiteralPath $root -Filter "gevr-*-boot.cmd" | Select-Object -First 1
    if (-not $boot) {
        Fail "Missing gevr-*-boot.cmd in ship tree (wipe + stamp path for Start-GEVR.bat)"
    }
    return $boot
}

function Test-BootCmdPresent($boot, [string]$expectedTag) {
    $text = Get-Content -LiteralPath $boot.FullName -Raw
    if ($text -notmatch "`n") {
        Fail "$($boot.Name) has no line breaks - cmd cannot read a one-line file"
    }
    $pattern = '(?im)^\s*set\s+GEVR_SHIP_TAG\s*=\s*' + [regex]::Escape($expectedTag) + '\s*$'
    if ($text -notmatch $pattern) {
        Fail "$($boot.Name) must set GEVR_SHIP_TAG=$expectedTag (cache stamp; not a KEEP allowlist gate here)"
    }
    Pass "$($boot.Name) exists with GEVR_SHIP_TAG=$expectedTag (KEEP assignments not checked - C defaults are source of truth)"
}

function Test-StartBatCallsBoot([string]$batPath, $boot) {
    if (-not (Test-Path -LiteralPath $batPath)) {
        Fail "Missing Start-GEVR.bat"
    }
    $lines = Get-Content -LiteralPath $batPath
    $nonRem = @($lines | Where-Object { $_ -notmatch '^\s*rem\b' -and $_ -notmatch '^\s*REM\b' -and $_.Trim() -ne '' })
    $text = $nonRem -join "`n"
    if ($text -notmatch '(?i)GevrRomStarter\.exe') {
        Fail "Start-GEVR.bat must launch GevrRomStarter.exe"
    }
    if ($text -notmatch [regex]::Escape($boot.Name)) {
        Fail "Start-GEVR.bat must call $($boot.Name) before GevrRomStarter (boot may mirror KEEP during transition)"
    }
    foreach ($line in $nonRem) {
        if ($line -match '(?i)goldeneye\.exe') {
            Fail "Start-GEVR.bat must not invoke goldeneye.exe directly"
        }
    }
    Pass "Start-GEVR.bat calls $($boot.Name) then GevrRomStarter.exe (nobat smoke does not run the boot cmd)"
}

function Test-MonitorBatFlat([string]$batPath) {
    if (-not (Test-Path -LiteralPath $batPath)) {
        Fail "Missing Play-on-monitor.bat"
    }
    $lines = Get-Content -LiteralPath $batPath
    $nonRem = @($lines | Where-Object { $_ -notmatch '^\s*rem\b' -and $_ -notmatch '^\s*REM\b' -and $_.Trim() -ne '' })
    $text = $nonRem -join "`n"
    if ($text -notmatch '(?im)^\s*set\s+GE_VR_XR\s*=\s*0\s*$') {
        Fail "Play-on-monitor.bat must set GE_VR_XR=0"
    }
    if ($text -notmatch '(?im)^\s*set\s+GETV_STEREO\s*=\s*0\s*$') {
        Fail "Play-on-monitor.bat must set GETV_STEREO=0"
    }
    if ($text -match '(?i)gevr-vr\d+-boot\.cmd') {
        Fail "Play-on-monitor.bat must not call any gevr-*-boot.cmd"
    }
    Pass "Play-on-monitor.bat forces flat play (GE_VR_XR=0, GETV_STEREO=0, no boot cmd)"
}

function Test-ExeKnobNames([string]$exePath) {
    if (-not (Test-Path -LiteralPath $exePath)) {
        Fail "Missing goldeneye.exe in ship tree"
    }
    $exeBytes = [System.IO.File]::ReadAllBytes($exePath)
    $ascii = [System.Text.Encoding]::ASCII.GetString($exeBytes)
    $missing = @()
    foreach ($name in $cDefaultOnKnobs) {
        if ($ascii.IndexOf($name) -lt 0) {
            $missing += $name
        }
    }
    if ($missing.Count -gt 0) {
        Fail ("goldeneye.exe missing KEEP knob name(s) needed for C-default-ON graduation: {0}" -f ($missing -join ", "))
    }
    Pass ("goldeneye.exe contains all {0} top KEEP knob names (unset-env=ON must be proven in product getv)" -f $cDefaultOnKnobs.Count)
}

function Test-KeepShipDefaultsDoc() {
    $doc = Join-Path $PSScriptRoot "KEEP-SHIP-DEFAULTS.md"
    if (-not (Test-Path -LiteralPath $doc)) {
        Fail "Missing packaging/KEEP-SHIP-DEFAULTS.md beside this script"
    }
    $text = Get-Content -LiteralPath $doc -Raw
    if ($text -notmatch 'Graduation checklist') {
        Fail "KEEP-SHIP-DEFAULTS.md must document the graduation checklist"
    }
    Pass "KEEP-SHIP-DEFAULTS.md present (graduation rule for maintainers)"
}

function Test-Tree([string]$root) {
    $boot = Get-BootCmd $root
    Test-BootCmdPresent $boot $ShipTag
    Test-StartBatCallsBoot (Join-Path $root "Start-GEVR.bat") $boot
    Test-MonitorBatFlat (Join-Path $root "Play-on-monitor.bat")
    Test-ExeKnobNames (Join-Path $root "goldeneye.exe")
}

Test-KeepShipDefaultsDoc

if ($StagingDir) {
    if (-not (Test-Path -LiteralPath $StagingDir)) {
        Fail "StagingDir not found: $StagingDir"
    }
    Write-Host "[keep-nobat] Checking staging: $StagingDir (ShipTag=$ShipTag)"
    Test-Tree $StagingDir
}

if ($ZipPath) {
    if (-not (Test-Path -LiteralPath $ZipPath)) {
        Fail "ZipPath not found: $ZipPath"
    }
    $temp = Join-Path ([System.IO.Path]::GetTempPath()) ("gevr-keep-nobat-" + [Guid]::NewGuid().ToString("n"))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        Expand-Archive -LiteralPath $ZipPath -DestinationPath $temp -Force
        Write-Host "[keep-nobat] Checking zip: $ZipPath (ShipTag=$ShipTag)"
        Test-Tree $temp
    }
    finally {
        Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "[keep-nobat] PASS all gates (KEEP not gated on boot.cmd assignments)"
exit 0
