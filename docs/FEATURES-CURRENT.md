# FEATURES-CURRENT — private workshop snapshot (public textbook)

**Currency:** 2026-09-11  
**Audience:** curious engineers following the ideas trail  
**Not a download.** The playable tree, binaries, and VR glue stay private per
[`RELEASE-POLICY.md`](RELEASE-POLICY.md). This page names *what exists* and *what
was measured*, so someone could re-derive the path — not `clone && play`.

## North star

- Native / from-source GoldenEye (GETV lineage), **not** an emulator and **not** the recomp track
- OpenXR headset play with ownership of the game loop (fix N64-era gaps for VR)
- OpenGL measured native path (`fast3d` → OpenGL + OpenXR graphics binding)
- Perfect Dark VR = evidence / prior-art **map only**

## What works on the private headset build (chair-proven keepers)

### Presence and display
- OpenXR session in-process; true per-eye SBS present (game renders side-by-side; each eye submitted)
- Head translation (lean/peek) available
- Auto-recenter at first-person entry; yaw-follow locomotion options
- Eye blit / scissor keepers so each eye gets a square, untilted picture
- Intro / cinema can run as a big-screen style view, then hand off into VR gameplay

### Aim and interaction
- Controller aim drives the fired ray and drawn gun from one helper (eye-origin shot path in the current wear)
- Reticle can sit on the gun ray at a fixed distance (depth-adaptive U06 still future)
- Touch / grip use and per-round haptics on the wear path
- Empty-hand melee slap against guards (measured latch / cooldown behavior)

### World and performance policy
- Prefer drawing the whole level / props for presence; aggressive open-area cull treated as a problem to widen or disable rather than “optimize first”
- Standing refusal: do **not** “fix” VR by rewriting the game camera FOV description (FOV-match class stays off)
- No MSAA / FXAA / supersample as a VR comfort crutch on the wear path

### Texture / VFX engineering (partial)
- Texture pool re-init forgets stale fast3d address cache (walls no longer show the previous level’s pixels after a level change)
- Global display lists that baked pool addresses get re-tagged into the **current** pool on level load
- Explosion two-texture TMEM bind is under active fix: smoke can appear, but **color is still wrong** on chair (grey / blue-purple residual) — not claimed done
- Bullet sparks / gun shatter on later Facility hits still look wrong — open defect

### Flat (non-VR) desktop
- Same from-source binary can run with OpenXR play **off**: mouse/keyboard window, classic first-person Bond arms/gun (VR body knobs off)
- Non-XR keepers (texture pool / retag / melee policy, etc.) still apply
- Useful for friends without a headset and for debugging without SteamVR

## Designed, not product-wired yet

| Idea | State |
|---|---|
| LAN auto-find (UDP beacon → discovery spec → later lockstep) | Side packet + offline gate PASS on loopback; **no product call site**; Windows link needs `ws2_32` before first net init; target **4 players** (native GE slots) |
| Quest 3 / Android OpenXR | Feasible long-term; GLES/Vulkan cliff; parked until PC wear is trusted |
| Public ROM picker (Browse / Start / Forget) | UX written; honest gap that today’s port still links extracted assets — Stage B extract-to-AppData parked |
| Full Bond body + arms colocated with you | Experiments exist; not the wear default; classic FP remains the flat/OG look |

## Explicit non-goals (for now)

- Shipping a public playable binary from this repo
- Claiming Evan/GETV upstream, ROM data, OpenXR/SteamVR, or Perfect Dark VR as ours
- Using commercial remake audio assets in the tree
- Re-opening refused FOV-match camera rewrites as a “presence fix”

## How to read the older docs

Early `docs/00-STATE.md` / session writeups are a dense measurement log from the stereo
instrument era. They are kept (delete-nothing culture) but are **not** a current feature
brochure — use **this file** + `RELEASE-POLICY.md` + `ORIGIN.md` for orientation, then dive
into dated sessions when you care about a specific falsifier.

## What “release” will add

When the workshop opens: chosen license on the GEVR delta, ORIGIN honesty unchanged,
ROM-supplied assets only, and a front door that does not pretend the binary contains the cart.
