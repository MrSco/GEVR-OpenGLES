# Watch menu: per-eye highlight miss (not text stereo)

Status: filed against watch / #32 family. Separate from text-glued-across-both-eyes.

## Behavior (owner chair)

- Pressing A to move to the next watch line **highlights only on the LEFT eye** and the highlight **flashes**.
- The **words remain visible on BOTH eyes**.
- The **highlight render never appears on the right eye**.

## Not this bug

- Text overlaid / glued across both eyes (center of view) - already logged as a separate stereo-text debt.

## Related

- GitHub #32 (pause/watch confirm rough).
- RESULT-VR-START-MENU-20260918 owner refine (A beeps, Quit Mission does not reach Yes/No).
- Arm-attached watch dig is a separate feature note.

## Dig ask

Find why the highlight draw is eye-0 only (scissor, stereo HUDGATE, menu capture tags, or one-eye DL). Smallest probe, default OFF.
