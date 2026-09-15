# Controls (Beta)

How to move, aim, and **reset your position** in the current GEVR Beta.

Use **`Start-GEVR.bat`** from the Release zip. That bat turns on the VR input knobs this sheet describes. Running `goldeneye.exe` alone may leave recenter / stick-turn off.

## Reset position (recenter)

When things feel offset, or after you move your playspace setup:

**Click both thumbsticks at the same time** (press both sticks in like L3+R3).

Also works:

- **Xbox pad:** L3 + R3 together
- **Keyboard:** `Home` while the game window has focus

One stick click alone does nothing. This is the same recenter the game uses when you enter gameplay from the cinema/menu (auto-recenter).

After recenter, standing still and turning your head should not slide the world. Walking in your room should move you in Bond-world.

## Move and look

| Input | What it does |
|---|---|
| **Left stick** | Walk |
| **Right stick** | Turn |
| **Head / 6DOF** | Look around; move in the playspace to translate in-world |
| **Controllers** | Gun aim follows the controller |

## Fire and aim

| Input | What it does |
|---|---|
| **Trigger** | Fire |
| **Squeeze / grip** | ADS / aim mark on the gun ray (not stuck in face centre) |

Face buttons (A/B style) are only partly wired in this Beta cut. Menu / folder navigation is more reliable with the stick and trigger path; if a face button does nothing, that is a known gap (held work), not you.

## Cinema / menus

While the flat cinema or frontend menus are up, you are in a small hub room looking at a **world-locked** screen: turn your head and the screen stays put in the room.

## Headset testing (honest)

**Tested on:** Pimax Crystal Super (Micro OLED) only, so far.

GEVR talks **OpenXR**, so other PC VR headsets (SteamVR-class, other Pimax, Quest via PC link, etc.) may work. They are **not** verified on this Beta cut yet. If you try one, please say which headset + runtime in an [Issue](https://github.com/no6969el/GEVR/issues) (no ROM uploads).

## If controls feel dead

1. Confirm you launched with **`Start-GEVR.bat`**, not bare `goldeneye.exe`
2. Confirm your OpenXR runtime is active (SteamVR / Pimax client / etc.)
3. Recenter with **both** stick clicks
4. File an Issue with headset + runtime name
