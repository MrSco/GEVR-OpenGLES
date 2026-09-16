# Ship feature checklist (public Beta boot)

Source of truth for the live KEEP + PLAY0 allowlist is `$requiredBootKnobs` in
[`packaging/_smoke-ship-zip.ps1`](../packaging/_smoke-ship-zip.ps1). Pack smoke fails if
`gevr-*-boot.cmd` in the zip does not assign every knob below to the exact value shown.

**vr441** ships the full allowlist in `gevr-vr441-boot.cmd`. **vr440** used the same
`goldeneye.exe` but a picture-only boot and failed this gate (23+ knobs missing).

Censuses stay **off** in public boots (`GETV_VR_WALLCENSUS=0`, `GETV_VR_ROOMLOADWHY=0`).
Pause / N64 A confirm is **not** claimed fixed; vr441 keeps the same `GETV_XR_BTN_A` /
`GETV_XR_BTN_B` map vr440 shipped.

## Chair features vr440 never turned on

| Knob | Ship value | Notes |
|------|------------|--------|
| `GETV_VR_CORPSEKEEP` | `1` | Public boot required (off without boot) |
| `GETV_VR_CORPSEKEEP_MAX` | `48` | Public boot required |
| `GETV_VR_CORPSEKEEP_CEIL` | `440` | Public boot required |
| `GETV_VR_TEXINVAL` | `1` | Public boot required |
| `GETV_VR_TEXDLRETAG` | `1` | Public boot required |
| `GETV_VR_VFXTMEM` | `1` | Public boot required |
| `GETV_VR_VFXSHIFT` | `1` | Public boot required |
| `GETV_TEX16BE` | `1` | Public boot required (DECODE path; do not set `GETV_RGBA16BE=1`) |
| `GETV_RGBA16BE` | `0` | Public boot required (pinned off) |
| `GETV_TEX32BE` | `1` | Public boot required |

## PLAY0 arm

| Knob | Ship value | Notes |
|------|------------|--------|
| `GETV_VR_VTXGUARD` | `64` | Public boot required |
| `GETV_VR_ADSSIGHT` | `1` | Public boot required |
| `GETV_VR_HITSNAP` | `2` | Public boot required |
| `GETV_VR_SIGHTPX` | `6` | Public boot required |
| `GETV_VR_ADSCULL` | `1` | Public boot required |

## Aim / hands / gun / playspace

| Knob | Ship value | Notes |
|------|------------|--------|
| `GETV_VR_HEADYAW` | `1` | Public boot required |
| `GETV_VR_HEADFRAME` | `2` | Public boot required |
| `GETV_VR_HANDYAW` | `2` | Public boot required |
| `GETV_VR_LEVELYAW` | `1` | Public boot required |
| `GETV_VR_GUNAIM` | `1` | Public boot required |
| `GETV_VR_GUNMOUNT` | `1` | Public boot required |
| `GETV_VR_GUNARM` | `1` | Public boot required |
| `GETV_VR_PLAYSPACE` | `1` | Public boot required |
| `GETV_VR_BODY_NOARMS` | `1` | Public boot required |
| `GETV_XR_FLOOR_M` | `-0.200` | Public boot required |
| `GETV_VR_HANDCUBES` | `1` | Public boot required |
| `GETV_VR_RETICLE` | `1` | Public boot required |
| `GETV_VR_TOUCHUSE` | `1` | Public boot required |
| `GETV_VR_HANDMELEE` | `1` | Public boot required |
| `GETV_VR_CASINGS` | `1` | Public boot required |

## Picture KEEP

| Knob | Ship value | Notes |
|------|------------|--------|
| `GETV_SUPERSAMPLE` | `3` | Public boot required |
| `GETV_XR_PLAY_SRCFBO` | `1` | Public boot required (not the dead name `GETV_SRCFBO`) |
| `GETV_XR_PLAY_EYERECT` | `1` | Public boot required |
| `GETV_VR_SKYMESH` | `1` | Public boot required |
| `GETV_VR_SKYSCISSOR` | `1` | Public boot required |

## Core VR

| Knob | Ship value | Notes |
|------|------------|--------|
| `GETV_VR` | `1` | Public boot required (`geVrXrEnabled`; unset means off) |
| `GETV_FPS` | `90` | Public boot required |
| `GETV_STEREO_SRC` | `xr` | Public boot required |
| `GE_VR_XR` | `1` | Set in boot; **known no-op** in this binary (VR arm is `GETV_VR`). Kept for `Play-on-monitor.bat` gate compatibility. |

Also required in boot (not in the 39-knob table): `GEVR_SHIP_TAG=vr441` for the current cut.

## Forbidden in a public boot

These must not be assigned a non-empty, non-`0` value in `gevr-*-boot.cmd` (clears and `=0` are fine):

- `GETV_XR_FOVMATCH`
- `GETV_VR_WALLCENSUS`
- `GETV_VR_ROOMLOADWHY`
- `GETV_FIREDUMP`
- `GETV_STAGE`
- `GETV_CHR_DEBUG`
- `GETV_INPUT_DEBUG`
- `GETV_FRONTTRACE`
- `GETV_CINETRACE`
- `GETV_LOGFLUSH`
- `GETV_SKYTRACE`
- `GETV_ROOMTRACE`
- `GETV_CULLWHY`
- `GETV_XR_SHARPLOG`

## Dead knob names (fail smoke if present in boot)

Silent no-ops in `goldeneye.exe` - do not use in ship boots:

- `GETV_SRCFBO` (use `GETV_XR_PLAY_SRCFBO`)
- `GETV_MSGSCALE` (use `GETV_VR_MSGSCALE` if you ever need it; default 50 matches chair KEEP)

## Pack smoke (owner)

Run [`packaging/_pack-vr441.ps1`](../packaging/_pack-vr441.ps1) without `-SkipSmoke`. Expect
`[smoke] PASS all gates` on staging and on the zip. See [`packaging/README.md`](../packaging/README.md).
