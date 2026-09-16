<p align="center">
  <img src="GEVR-box-cover.png" alt="GoldenEye 007 VR - GEVR box art" width="480" />
</p>

# GEVR

**GoldenEye. Native. In VR. Bring your own ROM.**

The N64 classic you can finally *stand inside*. Not an emulator overlay. Not a flat game with a headset stuck on. GEVR is a from-source PC port of *GoldenEye 007* for real OpenXR. You supply a **USA GoldenEye ROM you legally own**. We never ship the cart.

**Play this cut:** [**GEVR Beta vr440**](https://github.com/no6969el/GEVR/releases/tag/vr440) (GitHub **Latest**). Download **`GEVR-Beta-vr440-win64.zip`** on that page. It is the **only** tag with a zip right now. Unzip, pick a bat, point at your `.z64`.

Star the repo if this brings you back. Watch -> Releases if you want a ping when the next cut ships.

[Releases](https://github.com/no6969el/GEVR/releases) · [Beta notes](docs/BETA.md) · [Controls](docs/CONTROLS.md) · [Roadmap](docs/ROADMAP.md) · [Features](FEATURES.md) · [Credits](CREDITS.md)

---

## Play (vr440)

| Step | What to do |
|------|------------|
| 1 | Open **[vr440 on GitHub Releases](https://github.com/no6969el/GEVR/releases/tag/vr440)** and download **`GEVR-Beta-vr440-win64.zip`**. **No ROM in the zip.** |
| 2 | Unzip anywhere. Keep the files together. |
| 3 | **Headset:** double-click **`Start-GEVR.bat`** (KEEP picture: XR stereo source, SrcFbo sharpness, supersample 3, sky / playspace). **Monitor / no headset:** **`Play-on-monitor.bat`** (VR off, no stereo eyes). |
| 4 | When asked, point at your **USA GoldenEye `.z64`**. |
| 5 | In VR, recenter with **both thumbstick clicks**. Enjoy. |

Please use those bats. They lock in the settings this cut was worn with. **Do not** double-click `goldeneye.exe`.

### Where your data lives

| What | Where |
|------|--------|
| Prepared ROM images (cache) | `%LOCALAPPDATA%\GEVR\cache\<your-ROM-SHA-256>\` |
| Save-game progress | Under `%LOCALAPPDATA%\GEVR`, **outside** the `cache` folder |
| Your ROM | Wherever **you** keep it. GEVR never copies the `.z64` into the zip folder. |

### First time

The first launch waits once while images prepare into `%LOCALAPPDATA%\GEVR\cache`. Then you play.

### Updating from an older Beta (keep your saves)

1. Download the **vr440** zip from the link above. Do **not** hunt old tag zips (see **Older tags** below).
2. Keep the **same** `.z64` path you already use.
3. Unzip the new folder (or replace your old unzip folder - your choice).
4. Run **`Start-GEVR.bat`** or **`Play-on-monitor.bat`** again.

Each cut carries a **ship stamp** (`GEVR_SHIP_TAG=vr440`). The **first** launch after you move to vr440 rebuilds the **image cache** once automatically. **Save progress is kept.** You do not wipe anything by hand for a normal update.

**If the picture still looks wrong after that one re-prepare:** run **`Clear-GEVR-cache.bat`** from the zip (type **YES**). It deletes **only** **`%LOCALAPPDATA%\GEVR\cache`** - not your saves (they live outside `cache`), not your `.z64`. Then run **`Start-GEVR.bat`** or **`Play-on-monitor.bat`** again.

You can also delete that **`cache`** folder yourself in File Explorer or with `Win+R` if you prefer.

**Optional nuclear clean slate (manual only):** delete the whole **`%LOCALAPPDATA%\GEVR`** folder if you want to wipe cache **and** saves. Not the default update path.

### What is new in vr440

- **Auto-Aim defaults OFF** in this build (`GETV_AUTOAIM` in the shipped exe).
- **Pause watch:** **left stick** moves the highlight in VR (look-stick steal fixed).
- **B/Y** opens pause and options in headset. **Tab** still works on keyboard / monitor.

Menu confirm with face buttons is still rough in places. If pause select misbehaves, say so in an Issue - do not assume every binding is finished.

---

## Older tags (history, not play)

These release **pages** stay on GitHub for the record. **Only vr440 has a zip.** Do not download from older tags.

| Tag | Notes |
|-----|--------|
| [vr420](https://github.com/no6969el/GEVR/releases/tag/vr420) / [vr434](https://github.com/no6969el/GEVR/releases/tag/vr434) / [vr438](https://github.com/no6969el/GEVR/releases/tag/vr438) | History only. Zips removed. **vr438** had a stub VR boot - do not resurrect it. |
| [vr439](https://github.com/no6969el/GEVR/releases/tag/vr439) | Tag page stays. **Zip removed** when vr440 shipped. Play **[vr440](https://github.com/no6969el/GEVR/releases/tag/vr440)**. |
| **vr434** (detail) | Pulled. ROM images were baked into `goldeneye.exe`. |

---

## What we tested

These paths are what this Beta was built and worn on:

| Path | Notes |
|------|--------|
| **Pimax Crystal Super + SteamVR OpenXR** via [CustomHeadsetOpenVR](https://github.com/sboys3/CustomHeadsetOpenVR) (sboys3) | Primary wear path. We do not maintain that driver. We do support this experience. |
| **Native PimaxXR** | Verified attach / play |
| **Meta Quest 3 + Virtual Desktop OpenXR** | Verified attach / play |

**Refresh rates:** 72 Hz, 80 Hz, and **90 Hz** should work. Headset default is **90**. Anything **over 90** (120 / 144 and friends) is still beta-test territory. Try it, and [file an Issue](https://github.com/no6969el/GEVR/issues/new/choose) if something feels off.

When you report a bug or crash, please include: **headset**, **OpenXR runtime**, **SteamVR on/off**, **HMD vs monitor**, and whether you used **`Start-GEVR.bat`**. Do not upload your ROM.

---

## Known quirks (honest Beta)

We would rather tell you than surprise you:

- Expect occasional **crashes**. That is why it is Beta.
- Mid-range **crates / props on Dam** can still pop in and out.
- **Dam water** can look murky.
- **Glass bullet holes** can still show in one eye in places.

Still worth playing. Facility at 6DOF is the whole point.

**Multiplayer:** local split-screen still works on a monitor. A **LAN / same-network add-on** is later. Online play is later than that. We are calling it an **add-on**, not a mod.

---

## Why this exists

GoldenEye is one of the most-wanted "I wish I could stand inside it" games on Earth. GEVR is a fan port for that feeling:

- **Native / from-source** so VR can be real stereo, not a stretch
- **OpenXR** so Crystal, Quest via PC, and SteamVR-class headsets can attach
- **Your ROM** so legal ownership stays with you
- **Feel first** - 6DOF, aiming, presence. Then polish. Then extras.

More of that pitch: [FEATURES.md](FEATURES.md). Who we thank: [CREDITS.md](CREDITS.md). Boundaries: [PRIOR-ART.md](PRIOR-ART.md), [LICENSE](LICENSE). We do not claim Nintendo's game data, Rare's assets, or third-party engines we did not write.

---

## Roadmap (honest, not a calendar)

**Now:** solo VR, monitor fallback, local split-screen on a couch.

**Next:** fewer crashes, those Dam / glass quirks, comfort for long sits.

**Later:** LAN add-on, then online, then extra modes once the base stays up.

Fuller list: [docs/ROADMAP.md](docs/ROADMAP.md).

---

## Player docs

- [Start here](docs/00-START-HERE.md) - short door for players and testers
- [Beta testing](docs/BETA.md)
- [Controls](docs/CONTROLS.md)
- [Roadmap](docs/ROADMAP.md)
- [Features](FEATURES.md)
- [Coming soon](docs/COMING-SOON.md)
- [Credits](CREDITS.md)

Jump in and enjoy finally being Bond in GoldenEye VR.
