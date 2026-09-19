<p align="center">
  <img src="GEVR-box-cover.png" alt="GoldenEye 007 VR - GEVR box art" width="480" />
</p>

# GEVR

**GoldenEye. Native. In VR. Bring your own ROM.**

The N64 classic you can finally *stand inside* - not an emulator overlay, not a flat game with a headset stuck on. GEVR is a from-source PC port of *GoldenEye 007* built for real OpenXR VR. You supply a **USA GoldenEye ROM you legally own**; the starter prepares a local cache and **`Start-GEVR.bat`** launches through **GevrRomStarter** (not bare `goldeneye.exe`).

**Latest playable cut:** [**GEVR Beta vr441**](https://github.com/no6969el/GEVR/releases/tag/vr441) - public Beta (BYO-ROM, file-backed images from your cart). Download it, unzip, play.

**vr440** is still on Releases for comparison, but it is **not** Latest - same `goldeneye.exe` as vr441, picture-only boot. Grab **vr441** unless you are deliberately comparing boots (see **What went wrong in vr440** below).

If this brings you back, **Star** the repo so you can catch the next drops. **Watch -> Releases** if you want a ping when we ship. Play **vr441** until then. Between cuts, we keep a [living status on Reddit](https://www.reddit.com/r/QuietWindows/comments/1whmk8l/gevr_living_status_goldeneye_in_native_openxr_vr/) - honest fan wear notes, not a second readme. Want to fund the next cuts? [Patreon](https://www.patreon.com/cw/GEVR) - the zip stays free.

[Releases](https://github.com/no6969el/GEVR/releases) · [Report a bug](https://github.com/no6969el/GEVR/issues/new/choose) · [Roadmap](docs/ROADMAP.md) · [Controls](docs/CONTROLS.md) · [Credits](CREDITS.md) · [Features](FEATURES.md) · [Support](https://www.patreon.com/cw/GEVR)

---

## Play (vr441 - the one to grab)

1. Download the **[vr441 Release zip](https://github.com/no6969el/GEVR/releases/tag/vr441)** (exe, `glew32.dll`, other runtime DLLs, ROM starter, launcher, notes). **No ROM inside the zip.**
2. Unzip anywhere.
3. Run **`Start-GEVR.bat`** - it sets VR boot knobs and starts **GevrRomStarter.exe**.
4. Point at your **USA GoldenEye `.z64`** when asked. Images extract to `%LOCALAPPDATA%\\GEVR\\cache\\<ROM-hash>\\`. Each Beta tag bumps a **ship stamp** so the first launch after an update rebuilds that cache once from your ROM.
5. Put the headset on. Recenter with **both thumbstick clicks**. Enjoy.

**Please use the bat** - it locks in the good VR settings and runs the ROM starter we ship for this cut (not bare `goldeneye.exe`).

Default is **VR**. Flat / monitor works too if you just want a look.

No ROM in the download. You bring yours.

---

## What went wrong in vr440

- **vr440** shipped the same `goldeneye.exe` as **vr441**, but **`Start-GEVR.bat`** only ran the **picture KEEP** boot - the visual stack we chaired (stereo, SrcFbo sharpness, supersample, sky / playspace).
- The **chair features** were already in the binary; the public boot **never turned them on**. Bodies could vanish after kills, explosion textures could look wrong, and aim / the gun arm were not on the tuned **PLAY0** path we wear in the chair.
- **vr441** is that same binary with the **full PLAY0 KEEP boot** in `gevr-vr441-boot.cmd`. The **vr440** tag stays published so you can compare - it is not Latest.

**Older tag (history):** **vr434** was pulled because ROM-derived images were still linked into `goldeneye.exe` and that zip could boot without your ROM. The tag page stays; do not use an old vr434 download.

---

## What is new in vr441

- **Full chair boot** - same `goldeneye.exe` as vr440, but `Start-GEVR.bat` now runs `gevr-vr441-boot.cmd`, which turns on bodies-stay, explosion/fire byte-order fixes, and the tuned aim / ADS path. Those code paths existed in the binary from vr438 onward; **vr440 never armed them in the public boot** (picture KEEP only).
- **vr440** is still on Releases for comparison but is not Latest.

---

## What's coming (stay on vr441 until Latest moves)

There is **no newer public tag** yet. Keep playing [**vr441**](https://github.com/no6969el/GEVR/releases/tag/vr441). **Watch -> Releases** for the ping.

**In the current test wear / coming in the next update** (not shipped until a new Latest tag):

- Dual-wield fire from each hand, not a right-hand mirror
- Per-hand tracers that stay on their own beam
- Thrown grenades and rockets that follow the hand (the rocket body may still face your head)
- Magnum drum no longer warped; ammo HUD digits spaced cleaner
- Tank climb after you fidget onto the hatch
- Orange hand cubes hide when you dual-wield

**Cooking - do not treat these as fixed on vr441:**

- See-through ghost fingers for the empty hand (not a boxy mesh)
- Hands and guns stopping at walls instead of painting through them
- Touch the tank hatch to climb in
- Rocket model pointing where it flies
- Grenade-launcher double-spawn and self-blast
- Tank turret pitch on the right stick (yaw already works)
- Die / quit / reload a mission without restarting the whole game ([issue #38](https://github.com/no6969el/GEVR/issues/38))
- Fewer hard crashes when you blow everything, plus better crash logs

Ideas filed for later: hold weapon-change for a spin wheel; left X for dual different guns. Not this drop.

Keep shooting. When Latest moves, grab that zip.

---

## What vr438 introduced (still true)

- **BYO-ROM enforced** - `Start-GEVR.bat` -> **GevrRomStarter**; you must supply a USA GoldenEye `.z64` you own.
- **File-backed images** - in-game textures and UI art come from your ROM on disk; the zip does not ship Nintendo cart data.
- **Full runtime in the zip** - includes `glew32.dll` and the other Windows DLLs the build needs.
- **Sharper VR** (carried forward) - supersample 3 with the SrcFbo path we chaired and kept.
- **Boot that actually hands over** - the bat sets FPS + stereo / view-restore so eyes fuse.
- **Movement feel** locked to the 90 Hz loco reference we preferred in the chair.
- **Smaller popup / instruction text** so the big lines are easier to read in the headset.
- Same playspace / aiming keepers from earlier Beta.

Full player notes ship inside the zip as `RELEASE-NOTES.txt`.

---

## What we tested

These paths are what this Beta was built and stared on:

| Path | Notes |
|------|--------|
| **Pimax Crystal Super + SteamVR OpenXR** via [CustomHeadsetOpenVR](https://github.com/sboys3/CustomHeadsetOpenVR) (sboys3) | Primary wear path - we do not maintain that driver; we *do* support this experience |
| **Native PimaxXR** | Verified attach / play |
| **Meta Quest 3 + Virtual Desktop OpenXR** | Verified attach / play |
| **RTX 5060 laptop + Quest 3 + Virtual Desktop VDXR** | BarZ wear **vr441**, 2026-09-17; ran surprisingly well (one data point, not a minimum spec) |

**Refresh rates:** 72 Hz and 80 Hz should work. Wear recommendation is **90**. Anything **over 90** (120 / 144 and friends) is still beta-test territory - try it, and [file an Issue](https://github.com/no6969el/GEVR/issues/new/choose) if something feels off. We do not call 120 / 144 signed off.

When you report a bug or crash, please include: **headset**, **OpenXR runtime**, **SteamVR on/off**, **HMD vs monitor**, whether you used **`Start-GEVR.bat`**, your **`gevr-*-boot.cmd`** filename from the zip folder, and any log next to the zip or in the console. Do **not** upload your ROM. [Open an Issue](https://github.com/no6969el/GEVR/issues/new/choose).

---

## Known quirks (honest Beta)

We would rather tell you than surprise you. These are **vr441 today**.

- After you **finish a level** or die, sit on the **character / folder screen**, then load again, the world can go weird (junk spawn, floating doors, wrong props) - [issue #38](https://github.com/no6969el/GEVR/issues/38). **Fully quit `goldeneye.exe` and run `Start-GEVR.bat` again.** Loading another mission in the same process often stays broken. A reload-without-restart fix is cooking for a later tag.
- Alarm can keep ringing after a death or stage return.
- **Grenade launcher** can spit two rounds or blast your own feet when you aim off-flat.
- **Tank turret** on XR is yaw-only for now. Pitch on the right stick is cooking.
- **Rockets** fly with the hand; the mesh may still face your head.
- **Mass explosions** can crash. We are raising pools and adding better crash logs - not tagged yet.
- Mid-range **crates / props on Dam** can still pop in and out.
- **Dam water** can look flat or murky.
- **Glass bullet holes** can still show in one eye.
- **HUD text** can sit too close or hard to read in depth.
- **Headset refresh:** some Virtual Desktop / runtime setups only enter VR at 90 Hz - [issue #49](https://github.com/no6969el/GEVR/issues/49).
- Expect occasional **crashes** while we keep optimizing.
- We are **not** promising full-body Bond or fancy glove meshes yet. Ghost fingers first, nicer mesh later.

Still worth playing - absolutely. Facility, Dam, that first-person Bond feeling. Stay on **vr441** until Latest moves.

On a **flat / monitor** setup, classic **local / split-screen multiplayer** is still there - couch chaos, same as you remember. Next social step is a **LAN / local-network multiplayer add-on** (not a mod). True online is further after that.

---

## Why this exists

GoldenEye is one of the most-wanted "I wish I could stand inside it" games on Earth. GEVR's north star:

- **Native / from-source** - full ownership of the game loop for proper VR
- **OpenXR** - Crystal, Quest via PC, SteamVR-class HMDs
- **Your ROM** - legal ownership stays with you
- **Feel first** - 6DOF, aiming, presence; then polish; then extras

More pitch and cover energy: [FEATURES.md](FEATURES.md).

---

## Roadmap (honest, not a calendar promise)

**Now - enjoy the Beta**
- Solo VR campaign feel
- Comfort, aim, and picture quality
- "It boots, it shoots, it sometimes crashes" honesty
- Local / split-screen multiplayer on a monitor

**In the current test wear / next update** (not tagged yet)
- Dual-wield fire, per-hand tracers, thrown / rocket aim
- Cleaner Magnum drum and ammo HUD digits
- Tank climb after you get onto the hatch

**Cooking**
- Ghost empty hand, wall-solid hands / guns, touch-to-enter tank
- Rocket model facing flight, grenade-launcher double-spawn, tank stick pitch
- Reload-without-restart ([issue #38](https://github.com/no6969el/GEVR/issues/38))
- Softer landings when explosions go loud

**Later**
- **LAN / local-network multiplayer add-on** (not a mod; not this polish pack)
- True online after that
- Nicer hand mesh after ghost fingers
- Dam water / glass / HUD-depth polish

Fuller list: [`docs/ROADMAP.md`](docs/ROADMAP.md). Star + **Watch -> Releases** if you want the next zip without refreshing every day.

---

## For press / curious readers

**One-liner:** Native from-source GoldenEye VR for PC OpenXR - bring your own ROM.

**Longer:** GEVR rebuilds GoldenEye on PC so VR can be done properly (stereo, 6DOF, controller aim), instead of stretching an emulator. Beta means playable and imperfect on purpose while we clear crashes and comfort. Multiplayer and bigger social features sit on the roadmap after the solo VR base is something we are proud to hand strangers.

Credits: [CREDITS.md](CREDITS.md). Boundaries: [PRIOR-ART.md](PRIOR-ART.md), [LICENSE](LICENSE). We do not claim Nintendo's game data, Rare's assets, or third-party engines we did not write.

---

## Docs (secondary)

Deep technical trail: [`docs/00-START-HERE.md`](docs/00-START-HERE.md)  
Controls: [`docs/CONTROLS.md`](docs/CONTROLS.md)  
Beta snapshot: [`docs/BETA.md`](docs/BETA.md) · [`docs/FEATURES-CURRENT.md`](docs/FEATURES-CURRENT.md)  
Coming soon / release policy: [`docs/COMING-SOON.md`](docs/COMING-SOON.md) · [`docs/RELEASE-POLICY.md`](docs/RELEASE-POLICY.md)  
Pack / smoke: [`packaging/README.md`](packaging/README.md) · ship boot allowlist: [`docs/ship-feature-checklist.md`](docs/ship-feature-checklist.md)

---

Jump in and enjoy finally being Bond in GoldenEye VR.
