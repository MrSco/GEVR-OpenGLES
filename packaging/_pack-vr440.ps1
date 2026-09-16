# Assemble GEVR Beta vr440 staging folder (BYO-ROM, file-backed images).
# Owner runs on SimRig after build + rom-starter binaries are present.

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$BuildDir,

    [Parameter(Mandatory = $true)]
    [string]$OutDir,

    [string]$PackagingRoot = "",
    [string]$Tag = "vr440",
    [switch]$SkipSmoke,

    [string]$CombinedBin = ""
)

$ErrorActionPreference = "Stop"

if (-not $PackagingRoot) {
    $PackagingRoot = $PSScriptRoot
}

$templates = Join-Path $PackagingRoot "templates"
$romStarter = Join-Path $PackagingRoot "rom-starter"
$bootName = "gevr-$Tag-boot.cmd"
$releaseNotesName = "RELEASE-NOTES-$Tag.txt"

$requiredDlls = @(
    "glew32.dll",
    "SDL2.dll",
    "openxr_loader.dll",
    "libwinpthread-1.dll",
    "libgcc_s_seh-1.dll",
    "libstdc++-6.dll"
)

function Copy-IfExists([string]$src, [string]$destDir) {
    if (-not (Test-Path -LiteralPath $src)) {
        throw "Missing required file: $src"
    }
    Copy-Item -LiteralPath $src -Destination $destDir -Force
}

if (Test-Path -LiteralPath $OutDir) {
    Remove-Item -LiteralPath $OutDir -Recurse -Force
}
New-Item -ItemType Directory -Path $OutDir | Out-Null

$exeSrc = Join-Path $BuildDir "goldeneye.exe"
Copy-IfExists $exeSrc $OutDir

foreach ($dll in $requiredDlls) {
    $dllSrc = Join-Path $BuildDir $dll
    Copy-IfExists $dllSrc $OutDir
}

Get-ChildItem -LiteralPath $BuildDir -Filter "*.dll" | ForEach-Object {
    $dest = Join-Path $OutDir $_.Name
    if (-not (Test-Path -LiteralPath $dest)) {
        Copy-Item -LiteralPath $_.FullName -Destination $OutDir -Force
    }
}

Copy-IfExists (Join-Path $romStarter "GevrRomStarter.exe") $OutDir
Copy-IfExists (Join-Path $romStarter "gevr_prepare.exe") $OutDir
Copy-IfExists (Join-Path $romStarter "EXPECTED-ROM.txt") $OutDir
Copy-IfExists (Join-Path $BuildDir "filelist.gevr-images.csv") $OutDir

Copy-Item -LiteralPath (Join-Path $templates "Start-GEVR.bat") -Destination (Join-Path $OutDir "Start-GEVR.bat") -Force
Copy-IfExists (Join-Path $templates "Play-on-monitor.bat") $OutDir
Copy-IfExists (Join-Path $templates "Clear-GEVR-cache.bat") $OutDir
Copy-Item -LiteralPath (Join-Path $templates $bootName) -Destination (Join-Path $OutDir $bootName) -Force
Copy-Item -LiteralPath (Join-Path $templates $releaseNotesName) -Destination (Join-Path $OutDir "RELEASE-NOTES.txt") -Force

$zipPath = Join-Path (Split-Path -Parent $OutDir) ("GEVR-Beta-{0}-win64.zip" -f $Tag)
if (Test-Path -LiteralPath $zipPath) {
    Remove-Item -LiteralPath $zipPath -Force
}
Compress-Archive -LiteralPath (Join-Path $OutDir "*") -DestinationPath $zipPath -CompressionLevel Optimal

Write-Host "[pack] Staging: $OutDir"
Write-Host "[pack] Zip: $zipPath"

if (-not $SkipSmoke) {
    if (-not $CombinedBin) {
        $guess = Join-Path (Split-Path (Split-Path $BuildDir -Parent) -Parent) "assets\images\combined\combined.bin"
        if (Test-Path -LiteralPath $guess) {
            $CombinedBin = $guess
        }
    }
    if (-not $CombinedBin -or -not (Test-Path -LiteralPath $CombinedBin)) {
        throw "Smoke requires -CombinedBin pointing at assets/images/combined/combined.bin on SimRig"
    }
    $smoke = Join-Path $PackagingRoot "_smoke-ship-zip.ps1"
    & $smoke -StagingDir $OutDir -CombinedBin $CombinedBin -ShipTag $Tag
    & $smoke -ZipPath $zipPath -CombinedBin $CombinedBin -ShipTag $Tag
}

Write-Host "[pack] PASS pack path for $Tag"
