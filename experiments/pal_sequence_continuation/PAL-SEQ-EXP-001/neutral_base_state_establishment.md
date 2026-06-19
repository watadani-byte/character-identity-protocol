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
- Model name: ChatGPT Images 2.0 *(frozen for all attempts thereafter)*
- Visible version:
  - Chat model: GPT-5.5 Thinking
  - Image generator label: ChatGPT Images 2.0
  - Backend snapshot: not_exposed *(not visible through the UI; not guessed)*
  *(frozen for all attempts thereafter)*
- Session ID: `PAL-SEQ-EXP-001-neutral-phase-1-chat-01` *(experiment-assigned identifier for record-keeping; does not represent or expose any internal, non-public ChatGPT session identifier)*
- Generation settings: *(frozen for all 3 attempts)*
  - Output count per attempt: 1
  - Aspect ratio: portrait
  - Requested size: 1024x1536
  - Actual output dimensions: 1024 x 1536 *(confirmed from Attempt 1, the approved Shared Human-Approved Base Frame)*
  - Reference image: `rieko_primary_identity_anchor_01` (`docs/assets/images/rieko_primary_identity_anchor_01.jpeg`)
  - Source modules: character_pal_v2.0.pdf, costume_pal_v2.pdf, background_pal_v2.pdf, sequence_pal_v2.pdf
  - Prompt mode: exact_frozen_prompt
  - Maximum total attempts: 3
  - Prompt revision between attempts: false
  - Settings change between attempts: false
  - Seed: unavailable *(not exposed through the UI; not guessed)*

## Required Base-State Check

| Check | Result |
|---|---|
| Character identity | PASS / FAIL |
| Costume state | PASS / FAIL |
| Background state | PASS / FAIL |
| Composition | PASS / FAIL |
| Pose | PASS / FAIL |
| Both hands visible | PASS / FAIL |
| Facial visibility | PASS / FAIL |
| Initial scene state | PASS / FAIL |
| Suitability for registered gaze-shift continuation | PASS / FAIL |
| Suitability for registered left-hand delta continuation | PASS / FAIL |
| Critical identity violation | YES / NO |

All checks must pass (critical identity violation must be NO).

## Decision Terms

- APPROVE AS SHARED HUMAN-APPROVED BASE FRAME
- REJECT AS SHARED SEQUENCE BASE FRAME
- STOP BEFORE CONDITION EXECUTION

## Attempt Records

### Attempt 1
- Candidate ID: attempt_01
- Asset path: experiments/pal_sequence_continuation/PAL-SEQ-EXP-001/neutral_phase_1/attempt_01_shared_base_frame.png
- Actual output dimensions: 1024 x 1536
- Check result:

  | Check | Result |
  |---|---|
  | Character identity | PASS |
  | Costume state | PASS |
  | Background state | PASS |
  | Composition | PASS |
  | Pose | PASS |
  | Both hands visible | PASS |
  | Facial visibility | PASS |
  | Initial scene state | PASS |
  | Suitability for registered gaze-shift continuation | PASS |
  | Suitability for registered left-hand delta continuation | PASS |
  | Critical identity violation | NO |

- Human decision: APPROVE AS SHARED HUMAN-APPROVED BASE FRAME
- Notes: The candidate preserves Rieko's identity sufficiently for the registered follow-up sequence test. The approved white wedding dress and bright indoor photo-wedding studio conditions are present. Both hands are visible in a calm and stable starting pose. The overall framing, body orientation, and facial visibility remain reasonably close to the Primary Identity Anchor without carrying over its silver evening dress, candlelit venue, red roses, amber lighting, or event-specific atmosphere. The left hand is in a clear resting position suitable for the registered Step 2 movement, and the current gaze and pose provide a usable baseline for Step 1.

### Attempt 2
- Candidate ID: null
- Asset path: null
- Check result: null
- Human decision: null
- Notes: not required (Neutral Phase 1 concluded at Attempt 1 under the registered first-passing-candidate rule)

### Attempt 3
- Candidate ID: null
- Asset path: null
- Check result: null
- Human decision: null
- Notes: not required (Neutral Phase 1 concluded at Attempt 1 under the registered first-passing-candidate rule)

## Final Neutral Phase 1 Outcome

- Realized attempts: 1
- Selected base frame: attempt_01 (experiments/pal_sequence_continuation/PAL-SEQ-EXP-001/neutral_phase_1/attempt_01_shared_base_frame.png)
- Approval decision: APPROVE AS SHARED HUMAN-APPROVED BASE FRAME
- Selected before condition execution: true
- Identity-anchor status: unchanged
- Shared Base Frame status: The approved Base Frame is a starting reference for sequence continuation only. It does not constitute promotion to a Validated Identity Anchor or permanent incorporation into the approved source identity.
- This approval authorizes use of the Shared Human-Approved Base Frame as the shared starting reference for the Condition A and Condition B branches. It does not promote the candidate to a Validated Identity Anchor and does not permanently incorporate model-resolved details into the approved PAL Source identity.
- Condition A and Condition B generation have not yet begun.
