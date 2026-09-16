# ROM starter (sources + binaries)

## Sources (committed)

| File | Role |
|------|------|
| `gevr_cache_ship.h` / `gevr_cache_ship.c` | Ship stamp read/write and stale-cache invalidation |
| `gevr_prepare.c` | Reference prepare CLI; merge extract logic from GoldenEyeVR |

Copy into the **GoldenEyeVR** product tree and build. See `packaging/RESULT/GoldenEyeVR-cache-ship-stamp-APPLY.md`.

## Binaries (not committed)

Git ignores `*.exe` here. Before running `_pack-vr441.ps1` (or the matching `_pack-vrNNN.ps1` for the tag you are cutting), copy from the product tree build output:

- `GevrRomStarter.exe`
- `gevr_prepare.exe`

`EXPECTED-ROM.txt` ships in the zip and documents the USA `.z64` the player must provide.

**`filelist.gevr-images.csv` must sit beside `gevr_prepare.exe`.** Without it, prepare exits **3**
and RomStarter surfaces `ROM prepare failed (exit 3). Use a USA GoldenEye .z64.` - which blames the
cart even when the ROM is fine. RomStarter runs prepare with `CreateNoWindow=true`, so that message
is often the only clue. Ship the CSV in every Beta zip (public vr438+ zips include it; some local
unpack folders forgot it until backfilled).

These tools must **not** embed ROM data - only read the player-supplied file at runtime.
