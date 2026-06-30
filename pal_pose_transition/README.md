# PAL-POSE-EXP-001 — Identity Copy Across Full-Body Pose Changes

## Status

Draft preparation.

## Purpose

This experiment tests whether an approved converged identity can be preserved while applying clearly specified full-body pose changes.

This experiment does **not** test Minimal Prompt exploration.

It does **not** repeat the previous sequence:

```text
Anchor → Eye Direction → Hand Movement → Gaze Shift
```

Instead, it tests identity preservation across controlled full-body pose transitions.

## Core Question

Can the approved character identity be copied from an anchor image and maintained while the full-body pose changes?

## Fixed Model

Do not redefine C.

```text
C is model-side or execution-structure mediation that transforms A into A′.
```

Canonical model:

```text
A → (A + C) → A′ → B′
```

When mismatch is being discussed:

```text
A → (A + C) → A′ → B′ ≠ B
```

CIP does not directly control C, A′, or the generative model.

CIP/PAL governs workflow conditions such as validation, rejection, purge, re-binding, re-convergence, and adoption.

## Experiment Type

PAL-supported pose transition experiment.

This is not a new character creation experiment.
This is not a Prompt Lifecycle document experiment.
This is not an SD comparison experiment.

## Source State

Use an approved anchor / converged identity state.

Current operating term:

```text
Identity Copy
```

Do not frame this as Identity Recall unless specifically testing recall degradation.

Identity Copy means: copy the approved identity from the anchor / approved image / converged state, rather than relying on a compressed prompt alone to recall the identity.

## Pose Set

Use a small pose set only.

### Baseline Pose

```text
Front-facing neutral standing pose.
Weight evenly distributed.
Legs straight.
Arms relaxed at sides.
Upper body facing camera.
Head upright.
Neutral or restrained soft expression.
```

**Purpose:**

Establish the baseline full-body identity copy state.

### Pose 1 — One Hand in Pocket

```text
Standing pose.
Weight on one leg.
One hand in pocket.
Other arm relaxed.
Torso slightly angled.
Head facing camera.
Relaxed but restrained expression.
```

**Purpose:**

Test whether identity, hair, face, body proportion, outfit, and atmosphere remain stable when the pose introduces arm, shoulder, torso, and weight-shift changes.

### Pose 2 — Legs Crossed at Ankles

```text
Standing pose.
Legs lightly crossed at ankles.
Weight on back leg.
Arms relaxed.
Upper body upright.
Head slightly tilted.
Soft restrained expression.
```

**Purpose:**

Test whether identity remains stable when the lower-body pose and weight distribution change while the upper body is mostly preserved.

### Optional Challenge Pose — Hand on Hip / Contrapposto

```text
Contrapposto standing pose.
One hand on hip.
Legs apart.
Torso slightly angled.
Expression restrained.
```

**Purpose:**

Use only if Baseline, Pose 1, and Pose 2 are stable.

This pose is higher risk because it may affect body proportion, mood, confidence level, torso curve, and expression intensity.

## Step Flow

```text
Step 0 — Source / Anchor Confirmation
↓
Step 1 — Identity Copy Baseline
↓
Human Review
↓
Step 2 — Pose 1: One Hand in Pocket
↓
Human Review
↓
Step 3 — Pose 2: Legs Crossed at Ankles
↓
Human Review
↓
Optional Step 4 — Hand on Hip / Contrapposto
↓
Human Review
↓
Final Evaluation
↓
Fix accepted prompt / purge rejected outputs
```

## Human Checkpoints

Every generated output must be reviewed before proceeding.

Use the following decisions:

```text
APPROVE
APPROVE WITH WARNING
REJECT
STOP / RESET
```

## Review Criteria

### Identity

- Face identity preserved?
- Age impression preserved?
- Hair shape and flow preserved?
- Eye shape and expression preserved?
- Body proportion preserved?
- Outfit preserved?

### Pose

- Approved pose change applied?
- Pose is anatomically plausible?
- Hands and fingers acceptable?
- Legs and weight distribution match the requested pose?
- Torso and shoulders changed only as needed for the pose?

### Drift

- Unapproved facial reconstruction?
- Unapproved body proportion change?
- Unapproved hairstyle change?
- Unapproved expression escalation?
- Unapproved outfit change?
- Unapproved background or lighting drift?
- Scene or mood adoption beyond the approved pose?

### Next-Step Usability

- Can this output become the approved state for the next step?
- If not, reject or optimize before continuing.

## Optimization Prompt Use

Do not use Optimization Prompt as the initial generation method.

Use it only after Human Review identifies a specific deviation from Source A or the approved anchor state.

Examples:

- Face became slightly different.
- Hair flow changed.
- Body proportion drifted.
- Expression became too strong.
- Outfit changed.
- Pose was correct but identity weakened.
- Lighting or background drifted without approval.

Optimization Prompt should restore only the deviation.

It should not add beauty, drama, mood, or scene adoption.

## Purge Rule

Rejected generations must not become the next state.

If an output introduces identity drift, unapproved pose drift, or scene contamination:

```text
REJECT
PURGE
RESET TO LAST APPROVED STATE
RE-BIND TO ANCHOR
RE-CONVERGE IF NEEDED
```

## What This Experiment Does Not Do

- It does not create a new character.
- It does not test Minimal Prompt as an identity anchor.
- It does not repeat eye-direction / hand-movement / gaze-shift sequence testing.
- It does not add new glossary terms.
- It does not compare SD-style workflows.
- It does not treat pose prompts as standalone identity anchors.
- It does not treat Optimization Prompt as a universal replacement for Long Prompt or Identity Copy.

## One-Sentence Summary

PAL-POSE-EXP-001 tests whether an approved identity can be copied from an anchor and preserved across controlled full-body pose changes such as neutral standing, one hand in pocket, and legs crossed at ankles.
