# PAL-SEQ-EXP-001 — Source and Condition Lock

## Status

- Record status: draft pre-execution lock
- Experiment status: not yet executed
- Lock status: pending
- Human lock decision: pending
- Locked by: pending
- Lock date: pending

## Fixed Sources

| Source | Name | Version | Path |
|---|---|---:|---|
| Character PAL | `Character PAL V2.0` | `V2.0` | `experiments/pal_sequence_continuation/PAL-SEQ-EXP-001/source_modules/character_pal_v2.0.pdf` |
| Costume PAL | `Costume PAL v2` | `v2` | `experiments/pal_sequence_continuation/PAL-SEQ-EXP-001/source_modules/costume_pal_v2.pdf` |
| Background PAL | `Background PAL v2` | `v2` | `experiments/pal_sequence_continuation/PAL-SEQ-EXP-001/source_modules/background_pal_v2.pdf` |
| Sequence PAL | `Sequence PAL v2` | `v2` | `experiments/pal_sequence_continuation/PAL-SEQ-EXP-001/source_modules/sequence_pal_v2.pdf` |
| Primary Identity Anchor | — | `rieko_primary_identity_anchor_01` | `docs/assets/images/rieko_primary_identity_anchor_01.jpeg` |

**PAL Source Modules — Record Role**

- Record role: `frozen_experiment_source_snapshot` for all four PAL source files above.
- These four files are frozen experiment source snapshots used by PAL-SEQ-EXP-001. They are not a new shared PAL master, a replacement of any shared PAL master, or a determination of the standard shared-PAL storage location.
- The shared PAL master structure, standard format, and versioning rules remain a separate repository design decision to be considered later, outside this experiment's Human Lock.
- Original file formats are preserved (PDF in all four cases); no conversion to YAML or Markdown was performed.

**Primary Identity Anchor — Role and Scope**

- Registration basis: This Primary Identity Anchor is registered as a new entry for this experiment. No identity match or comparison against any prior anchor (including PAL-PL-EXP-001's `rieko_anchor_candidate_02`) is performed or claimed. Resemblance to any prior anchor, if present, is not used as a basis for identifier reuse, validation, or status promotion.
- Identifier: `rieko_primary_identity_anchor_01` (resolved and recorded)
- Path: `docs/assets/images/rieko_primary_identity_anchor_01.jpeg` (resolved — shared asset location; original JPEG format preserved, not renamed to .png)
- Validation status: provisional
- This image is a reusable Primary Identity Anchor supporting Rieko's character identity in general, not a PAL-SEQ-EXP-001-specific sequence reference. Placement in the shared asset area does not constitute promotion to a Validated Identity Anchor; validation_status remains provisional.
- Neutral Phase 1 Shared Base Frame and candidate images for this experiment are stored separately under the experiment directory, not under `docs/assets/images/`.
- Maintained distinction: Primary Identity Anchor ≠ Shared Human-Approved Base Frame ≠ Current Approved Sequence Reference ≠ Validated Identity Anchor
- Role: identity_establishment, identity_reproduction_check, re_binding_after_identity_drift
- Excluded transfer attributes (not carried into this Neutral Base State): silver_glitter_evening_dress, candlelit_luxury_venue, red_roses_and_event_decoration, cinematic_amber_lighting, event_specific_atmosphere
- Permitted compositional carryover (this Neutral Base State only, not a permanent PAL condition or Validated Identity Anchor attribute): overall_framing, general_body_orientation, facial_visibility

## Required Distinctions

```text
Primary Identity Anchor
≠ Current Approved Sequence Reference
≠ Validated Identity Anchor
```

A candidate approved for sequence continuation is not automatically adopted for final use and is not validated as a new identity anchor.

## Shared Base Frame

- source type: newly generated neutral base state
- condition affiliation: neutral
- selected before condition execution: true
- counted as condition candidate: false
- must pass all registered Base-State Checks

## Locked Delta Sequence

### Step 1
- element: gaze
- permitted change: slight gaze shift toward the viewer
- change scale: subtle

### Step 2
- element: left hand
- permitted change: raise only the left hand slightly
- change scale: small

### Step 3
- element: gaze
- permitted change: shift only her gaze softly toward the raised left hand
- target fixed as: raised left hand

## General Inherited State

At every step, preserve unless explicitly included in the permitted delta:
- character identity
- age and facial reading
- costume
- background
- composition
- pose
- hand state not selected for change
- expression and emotional baseline
- lighting
- illustration mode
- current sequence state

## Prohibited Simultaneous Changes

- unregistered gaze change
- unregistered head turn
- unregistered body rotation
- unregistered hand movement
- costume change
- background reconstruction
- composition change
- lighting change
- emotional jump
- cut-like discontinuity

## Branch Structure

```text
Shared Human-Approved Base Frame
        ├─ Condition A Step 1 → Step 2 → Step 3
        └─ Condition B Step 1 → Step 2 → Step 3
```

After the shared base frame, branches are independent. Intermediate candidates may not cross between conditions.
