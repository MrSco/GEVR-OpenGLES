# GEVR — VR for GoldenEye 007 (native from-source track)

GEVR is the **native** VR track for GoldenEye 007: decompiled C built as a host
program, plus an OpenXR layer, docs, and measurement tools. **Not** static
recompilation, **not** emulation. You supply your own ROM for assets.

This GitHub repo is the **public textbook** (plans, measured results, architecture,
ORIGIN honesty). The **playable workshop** (full VR product tree, binaries, drop-in
patches) stays private until release. See [`docs/RELEASE-POLICY.md`](docs/RELEASE-POLICY.md).

## Related repositories

| Repo | Role |
|---|---|
| [no6969el/goldeneye-native](https://github.com/no6969el/goldeneye-native) | Early native host + VR architecture / Phase 0 bind plan (MIT). **No playable GEVR workshop on public HEAD.** |
| Playable native port (private / upstream TBD) | Bootable PC port the VR work attaches to — **not redistributed here yet** |
| [cblock85/GoldenEye64Recomp](https://github.com/cblock85/GoldenEye64Recomp) | **Separate / historical** recomp host (GPL-3.0). Early headset experiments only; not the active track; never vendored here |

## What this repo contains

| Path | What |
|---|---|
| `docs/` | Live record — start at `docs/00-START-HERE.md` and `docs/00-STATE.md` |
| `docs/FEATURES-CURRENT.md` | High-level feature snapshot of the private build (ideas trail, not a download) |
| `xr/` | Standalone OpenXR probe / stereo validators |
| `tools/` | Offline stereo / screenshot measurement helpers |
| `historical/recomp/` | Early MIT patches that dropped into GoldenEye64Recomp only |

## Status (honest) — 2026-09-11

**Headset play is real on the private workshop** (OpenXR, seated presence, controller aim).
This public repo still does **not** ship a clone-and-play VR binary.

Recent private progress (see [`docs/FEATURES-CURRENT.md`](docs/FEATURES-CURRENT.md) for the list):

- True per-eye OpenXR present path (SBS game → eye submit)
- Head-tracked locomotion / auto-recenter keepers
- Controller-driven gun aim + reticle-on-ray
- Intro/cinema → gameplay VR handoff
- Texture pool / global-display-list fixes for multi-level sessions
- Flat (non-VR) desktop play still works with the non-XR keepers

**Still open (honest):** Facility bullet sparks / shatter look wrong; explosion VFX color is not fully correct yet; full colocated body + hands is unfinished; FOV-match camera rewrite stays refused; public ROM “Browse → play” UX is designed but Stage B extract-to-AppData is parked.

North star unchanged: **from-source GoldenEye + OpenXR**, Perfect Dark VR as **prior-art map only** (not a design to copy wholesale).

## Licence

MIT (`LICENSE`) for this textbook tree. No ROM or game assets.
Recomp host stays external (GPL-3.0). See `PRIOR-ART.md` and `docs/ORIGIN.md`
for what we do and do not claim. Product delta will carry `LICENSE-GEVR` at release.
