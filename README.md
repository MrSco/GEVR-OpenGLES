<p align="center">
  <img src="GEVR-box-cover.png" alt="GoldenEye 007 VR - GEVR box art" width="480" />
</p>

# GEVR

**GoldenEye, native, in VR - bring your own ROM.**

GEVR is a from-source PC port of *GoldenEye 007* built for real VR (OpenXR). Not | emulator overlay. Not a flat game with a 3D wrapper. You drop in a **USA GoldenEye ROM you legally own**, hit Start, and play in the headset (or on a monitor).

```
================================================================================
  WAIT FOR THE NEXT UPDATE
================================================================================
```

**Wait for the next update** before downloading or expecting a clean public play path — a follow-up cut is coming soon with the bat/runtime fixes. **Star** this repo and **Watch -> Releases** so you catch it: [Releases](https://github.com/no6969el/GEVR/releases).

**VR on the verified cut:** Pimax Crystal Super with **SteamVR as OpenXR** via [CustomHeadsetOpenVR](https://github.com/sboys3/CustomHeadsetOpenVR) (sboys3). **90 Hz only** on that path for now. Native PimaxXR and Quest+Virtual Desktop are **not** solid yet — we are on those; please report with runtime + HMD vs monitor. Details: [CONTROLS.md](docs/CONTROLS.md).

Reference zip (rough Beta — not the clean public play path yet): [GEVR Beta vr420](https://github.com/no6969el/GEVR/releases/tag/vr420). See [Coming soon](docs/COMING-SOON.md).

[Watch Releases](https://github.com/no6969el/GEVR/releases) | [Coming soon](docs/COMING-SOON.md) | [Report a bug](https://github.com/no6969el/GEVR/issues/new/choose) | [Roadmap](docs/ROADMAP.md) | [Discussions](https://github.com/no6969el/GEVR/discussions) | [Credits](CREDITS.md) | [Features](FEATURES.md) | [Controls](docs/CONTROLS.md)

---

## Play (next Release cut — wait for it)

**Do not chase the current public zip as the main play path.** Hold for the next update (bat/runtime fixes). **Star + Watch -> [Releases](https://github.com/no6969el/GEVR/releases)**.

When the follow-up cut lands:

1. Download that **Release** zip (full build — not a script-only patch).
2. Unzip anywhere.
3. Put your **USA GoldenEye `.z64` ROM** where the starter asks (or drop it on the app).
4. Launch with **`Start-GEVR.bat`**. Default is **VR**; flat/monitor works too.
5. Put on the headset. Recenter. Enjoy GEVR!

No ROM in the download. You bring yours.

**Reference only (rough Beta):** [GEVR Beta vr420](https://github.com/no6969el/GEVR/releases/tag/vr420). The story and [roadmap](docs/ROADMAP.md) below are already real.

---

## Why this exists

The pitch, cover, and VR highlights: [FEATURES.md](FEATURES.md).

GoldenEye is one of the most-wanted "I wish I could stand inside it" games. GEVR's north star is simple:

- **Native / from-source** - full ownership of the game loop for proper VR
- **OpenXR** - Pimax, Quest via PC link, SteamVR-class headsets
- **Your ROM** - legal ownership stays with you
- **Feel first** - 6DOF, aiming, presence; then polish, then extras

We publish the **thinking and measurements** in `docs/` so others can learn. The **playable workshop binary** ships | GitHub Releases when each Beta cut is ready.

---

## Roadmap (honest, not a promise calendar)

**Now - enjoy the Beta**
- Solo VR campaign feel (Facility and friends)
- Comfort and aiming polish
- "It boots, it shoots, it sometimes crashes" honesty

**Next**
- Fewer freezes and softer landings when a level ends
- Clearer first-run (ROM drop-in, saves that survive updates)
- Visual and HUD comfort for long sits

**Later - the fun extras**
- **Multiplayer** - we want people in the same Bond world together (design + net still ahead; calling it early so you know where this is pointed)
- More levels / modes | the base stays stable
- Optional quality and accessibility knobs without breaking the classic feel

Fuller list: [`docs/ROADMAP.md`](docs/ROADMAP.md). Star + Watch if you want the multiplayer and Beta drops without refreshing every day.

---

## For press / curious readers

One-liner: *Native from-source GoldenEye VR for PC OpenXR - bring your own ROM.*

Longer: GEVR rebuilds GoldenEye on PC so VR can be done properly (stereo, 6DOF, controller aim), instead of stretching an emulator. Beta means it is playable and imperfect on purpose while we clear crashes and comfort. Multiplayer and bigger social features are on the roadmap after the solo VR base is something we are proud to hand strangers.

Credits (who / what for): see [CREDITS.md](CREDITS.md). Boundaries: [PRIOR-ART.md](PRIOR-ART.md), [LICENSE](LICENSE). We do not claim Nintendo's game data, Rare's assets, or third-party engines we did not write.

---

## Docs (secondary)

Deep technical trail (build notes, measured digs): start | [`docs/00-START-HERE.md`](docs/00-START-HERE.md).  
Release policy: [`docs/RELEASE-POLICY.md`](docs/RELEASE-POLICY.md).
Credits: [`CREDITS.md`](CREDITS.md) | [`docs/ORIGIN.md`](docs/ORIGIN.md).
Tester snapshot: [`docs/BETA.md`](docs/BETA.md) | [`docs/FEATURES-CURRENT.md`](docs/FEATURES-CURRENT.md).

Most players never need those. Play first. File [Issues](https://github.com/no6969el/GEVR/issues) when something weird happens. Chat in [Discussions](https://github.com/no6969el/GEVR/discussions) if you prefer.

---

## Status strip

| |---|---| Next public cut | **Wait for the next update** — Watch [Releases](https://github.com/no6969el/GEVR/releases) / [Coming soon](docs/COMING-SOON.md) | Your ROM | USA GoldenEye `.z64` you own | Report | [GitHub Issues](https://github.com/no6969el/GEVR/issues) | Multiplayer | [Roadmap](docs/ROADMAP.md) - not in this Beta cut |

## Licence

MIT for this public docs/tools tree. See also [CREDITS.md](CREDITS.md). **No ROM or game assets.** We do not claim ownership of GoldenEye, Nintendo, or Rare.

**Wait for the next update** — then enjoy it. The bigger stuff is coming; the headset is already waiting.


