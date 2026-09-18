# KEEP ship defaults (graduation to C-default-ON)

Public repo has no getv source. **C defaults in goldeneye.exe** are the source of
truth for shipped KEEP when env is unset. `gevr-*-boot.cmd` may mirror KEEP during
transition; pack must not depend on boot assignments for graduation.

Pack smoke for this rule: `packaging/_smoke-keep-nobat.ps1` (never runs boot.cmd).
Boot mirror gate (today's zip): `packaging/_smoke-ship-zip.ps1`.
Inventory: `packaging/KEEP-DEFAULTS-INVENTORY-vr441.md`.

## Graduation checklist

1. **KEEP PASS** - Headset sit on the staged zip (`Start-GEVR.bat`) passes the live
   feature gates in `docs/ship-feature-checklist.md`.
2. **C unset = ON** - In product getv, each knob in the top-15 list below defaults ON
   (or to the ship value for non-boolean knobs) when the variable is not set.
3. **Smoke** - On SimRig after pack:
   - `_smoke-ship-zip.ps1` until boot.cmd is slimmed, then
   - `_smoke-keep-nobat.ps1` must pass on staging and zip (no boot KEEP allowlist).
4. **Tag** - Bump `GEVR_SHIP_TAG`, publish Beta zip, human release step only after both
   smokes and a clean-machine first launch.

## Top 15 knobs that need C default ON

These are the highest-risk KEEP arms (vr440 boot stub lesson). Unset env must match
the ship value in `KEEP-DEFAULTS-INVENTORY-vr441.md` before boot.cmd drops the assigns.

| Knob | Ship value when ON |
|------|-------------------|
| `GETV_VR` | `1` |
| `GETV_VR_CORPSEKEEP` | `1` |
| `GETV_VR_TEXINVAL` | `1` |
| `GETV_VR_TEXDLRETAG` | `1` |
| `GETV_VR_VFXTMEM` | `1` |
| `GETV_VR_VFXSHIFT` | `1` |
| `GETV_TEX16BE` | `1` |
| `GETV_TEX32BE` | `1` |
| `GETV_VR_VTXGUARD` | `64` |
| `GETV_VR_ADSSIGHT` | `1` |
| `GETV_SUPERSAMPLE` | `3` |
| `GETV_XR_PLAY_SRCFBO` | `1` |
| `GETV_STEREO_SRC` | `xr` |
| `GETV_VR_SKYMESH` | `1` |
| `GETV_VR_PLAYSPACE` | `1` |

`_smoke-keep-nobat.ps1` checks that `goldeneye.exe` embeds each knob **name** and
that launcher wiring is correct. Proving unset-env=ON still requires product tests
and the checklist sit gates above.
