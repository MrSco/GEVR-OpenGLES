# GEVR — GoldenEye in VR (public Beta)

GEVR lets you play **GoldenEye 007 in VR** on PC (OpenXR). It is a **native** port track — not an emulator and not a ROM dump.

**What “Beta” means here:** we are inviting outside testers and Issues. Maturity is still **early** (think **Beta 0 / public alpha**): the game **works** and is fun enough to play, but it **crashes**, has unfinished corners, and we are actively optimizing. That is expected — please **[open a GitHub Issue](https://github.com/no6969el/GEVR/issues)** when something breaks.

You must already own a legal GoldenEye ROM. **We never provide ROMs.**

---

## Report bugs (please do this)

→ **[Issues](https://github.com/no6969el/GEVR/issues)** for crashes and bugs  
→ **[Discussions](https://github.com/no6969el/GEVR/discussions)** for questions, ideas, and setup chat ([welcome post](https://github.com/no6969el/GEVR/discussions/1))

A useful bug report is short:
- Flat screen or VR? Which headset?
- What were you doing?
- Crash, freeze, missing characters, wrong graphics, aim off, etc.?
- Can you do it again?

Screenshots or a short clip help. No need for huge log dumps unless we ask.

---

## How to play (when a build is published)

Playable builds will appear under **[Releases](https://github.com/no6969el/GEVR/releases)** when we publish one. **Right now this page is ready for testers and Issues; a downloadable zip is not attached yet.**

The first public zip will be tagged as an early **Beta 0** build (alpha-level stability, Beta-style tester invite). Later zips stay under the Beta label as things firm up.

When a Release zip is up:

1. Download the latest **Beta** zip from Releases and unzip it.
2. Put **your own** GoldenEye ROM where the app asks (or drop it on the launcher — follow the Release notes).
3. Launch the game.
4. **VR is the default** (OpenXR headset). You can also run **flat on a monitor** for quick checks.

That is the whole loop: **your ROM → this program → play / report Issues.**

More detail for testers: [`docs/BETA.md`](docs/BETA.md).

---

## What works / what's rough (plain English)

**In good shape for testing (private wear, mid-September 2026):**
- VR headset play (OpenXR) with head look and controller aiming
- Walking / turning feel usable
- Gun aim and on-gun sight when you squeeze ADS
- Explosions / fire and bullet sparks look much better than earlier builds
- Flat (non-VR) desktop play still works for testing

**Still rough — please report if you hit them:**
- **Crashes** (we are sorting these while we optimize)
- Some **guards / objects missing** until you turn to face them (hallway visibility)
- Full body + hands in the world not finished
- Quest / Virtual Desktop attach is not a supported test path yet (Pimax / proper PC VR first)

A fuller snapshot lives in [`docs/FEATURES-CURRENT.md`](docs/FEATURES-CURRENT.md).

---

## For developers / deep dive

This GitHub repo is also the **public textbook** (plans, measurements, architecture notes). The full playable workshop tree stays private until release. See [`docs/RELEASE-POLICY.md`](docs/RELEASE-POLICY.md), [`docs/00-START-HERE.md`](docs/00-START-HERE.md), [`PRIOR-ART.md`](PRIOR-ART.md), and [`LICENSE`](LICENSE).

---

## Licence

MIT for this public docs/tools tree. **No ROM or game assets.** We do not claim ownership of GoldenEye.
