# Feature snapshot (public) - 2026-09-19

> Player snapshot: [FEATURES.md](../FEATURES.md). Play [vr441](https://github.com/no6969el/GEVR/releases/tag/vr441) (GitHub Latest). This page is not a second Play guide.

High-level status of the playable wear. Current zip is **vr441**. Play steps: [README Play](../README.md#play-vr441---the-one-to-grab). Download: [vr441 release](https://github.com/no6969el/GEVR/releases/tag/vr441).

## Working enough for Beta focus
- OpenXR VR present (true stereo path)
- Head look + locomotion keepers
- Controller gun aim; squeeze ADS mark on the gun ray (not stuck in face centre)
- Hit placement improved on recent wear
- Explosion / fire colour and bullet sparks much improved vs early September
- Flat desktop play still available (`Play-on-monitor.bat`)
- Local / split-screen multiplayer on a monitor

## In the current test wear / coming in the next update
Not tagged as Latest yet. Soft list only:
- Dual-wield fire from each hand and per-hand tracers
- Thrown grenades and rockets following the hand
- Cleaner Magnum drum and ammo HUD digits
- Tank climb after you fidget onto the hatch

## Open / rough
- Crashes under investigation (report with the [issue forms](https://github.com/no6969el/GEVR/issues/new/choose))
- Die / quit / reload same exe can leave the world weird - fully quit and relaunch ([issue #38](https://github.com/no6969el/GEVR/issues/38))
- Grenade launcher can double-spawn or self-blast
- Tank turret pitch on XR is yaw-only so far
- Rocket mesh may still face your head
- Mass explosions can crash
- Full colocated body + fancy hand mesh unfinished (ghost fingers first)

## Refused / not shipping as crutches
- FOV-match camera rewrite stays off unless a measured falsifier reopens it
- Boxy articulated hand mesh was rejected in the chair
- No ROM redistribution (do not upload ROM files)

## Headset / runtime (vr441)

Verified on this Beta (details in README Play):

- Pimax Crystal Super + **SteamVR OpenXR** via [CustomHeadsetOpenVR](https://github.com/sboys3/CustomHeadsetOpenVR)
- Native **PimaxXR**
- **Quest 3 + Virtual Desktop (VDXR)**

When you report: headset, OpenXR runtime, SteamVR on/off, HMD vs monitor, Start-GEVR.bat yes/no (Play-on-monitor.bat if no headset). [CONTRIBUTING.md](../CONTRIBUTING.md).
