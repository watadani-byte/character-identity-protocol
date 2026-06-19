# PAL-SEQ-EXP-001 — Neutral Base-State Establishment Record

## Status

- Phase: Neutral Phase 1
- Status: pending
- Condition affiliation: neutral
- Counted as Condition A/B candidate: no
- Identity-anchor status change: none

## Purpose

Create one Shared Human-Approved Base Frame for both Condition A and Condition B.

The process is not a best-of-N beauty selection. The first candidate passing every required Base-State Check is selected.

## Fixed Procedure

- maximum total attempts: 3
- prompt revision between attempts: prohibited
- generation-settings change between attempts: prohibited
- same Primary identity anchor across attempts
- same PAL Source Modules across attempts
- same exact prompt across attempts
- same scene request across attempts
- rejected candidates retained as evidence

If no candidate passes all checks within three attempts:

```text
Neutral Phase 1: STOP
Condition A execution: not started
Condition B execution: not started
```

## Inputs

- Primary identity anchor: `<path or identifier>`
- Character PAL: `<reference>`
- Costume PAL: `<reference>`
- Background PAL: `<reference>`
- Sequence PAL: `<reference>`
- Neutral base-state scene request:

  > Establish a Shared Human-Approved Base Frame of Rieko using the approved Character PAL, Costume PAL, Background PAL, and Sequence PAL conditions, referencing the attached Primary Identity Anchor for character identity.
  > Keep the overall framing, general body orientation, and facial visibility reasonably close to the Primary Identity Anchor, while replacing the anchor-specific silver evening dress, candlelit luxury venue, red roses and event decoration, cinematic amber lighting, and event-specific atmosphere with the approved white wedding dress and bright indoor photo-wedding studio conditions.
  > Keep both hands clearly visible in a calm and stable starting pose suitable for the registered gaze-shift and left-hand delta-continuation steps. Where close compositional resemblance to the Primary Identity Anchor conflicts with clear visibility of both hands or suitability for the registered sequence deltas, sequence-test suitability takes priority.
  > Visual details not explicitly fixed by the approved PAL Source Modules or this request may be resolved naturally by the generative model. Model-resolved details do not automatically become approved PAL conditions, part of the approved source identity, or attributes of a Validated Identity Anchor.

- Exact frozen prompt: (same text as the Neutral base-state scene request above — Scene Request and Exact Frozen Prompt are identical for this experiment)
- Model name: null  *(recorded before first Neutral Phase 1 generation; frozen for all attempts thereafter)*
- Visible version: null  *(recorded before first Neutral Phase 1 generation; frozen for all attempts thereafter)*
- Session ID: null
- Generation settings: `<record before execution>` *(frozen for all 3 attempts once recorded)*

## Required Base-State Check

| Check | Result |
|---|---|
| Character identity | PASS / FAIL |
| Age and facial reading | PASS / FAIL |
| Costume state | PASS / FAIL |
| Background state | PASS / FAIL |
| Composition | PASS / FAIL |
| Initial pose | PASS / FAIL |
| Hand position | PASS / FAIL |
| Expression and emotional baseline | PASS / FAIL |
| Lighting | PASS / FAIL |
| Suitable for Step 1 gaze delta | PASS / FAIL |

All checks must pass.

## Decision Terms

- APPROVE AS SHARED SEQUENCE BASE FRAME
- REJECT AS SHARED SEQUENCE BASE FRAME
- STOP BEFORE CONDITION EXECUTION

## Attempt Records

### Attempt 1
- Candidate ID: null
- Asset path: null
- Check result: null
- Human decision: null
- Notes: null

### Attempt 2
- Candidate ID: null
- Asset path: null
- Check result: null
- Human decision: null
- Notes: null

### Attempt 3
- Candidate ID: null
- Asset path: null
- Check result: null
- Human decision: null
- Notes: null

## Final Neutral Phase 1 Outcome

- Realized attempts: null
- Selected base frame: null
- Approval decision: null
- Selected before condition execution: true
- Identity-anchor status: unchanged
- Shared Base Frame status: The approved Base Frame is a starting reference for sequence continuation only. It does not constitute promotion to a Validated Identity Anchor or permanent incorporation into the approved source identity.
