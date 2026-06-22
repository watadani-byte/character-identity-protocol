# Sequence PAL Case Analysis: Hana Wedding Series

**Status:** Case analysis and hypothesis support — not a finalized protocol.

---

## 1. Purpose

This document records a case analysis of the archived "Hana" wedding sequence
project from the perspective of Sequence PAL, CIP, and agentic auto-progression
risk.

The purpose of this document is not to define a new protocol, create a future
execution prompt, or prescribe a next experiment. Instead, it preserves
observations from a historical sequence-generation project in order to clarify
several recurring risks:

- the difference between apparent visual continuity and reproducible sequence
  control;
- the limits of context-dependent sequence generation;
- the persistence of drift even when the human operator recognizes the problem;
- the role of Sequence PAL as a support structure for reject, retry, purge,
  recovery, and human approval;
- the risk that agentic auto-progression may continue through near-miss
  candidates while accumulating drift.

This document should be read as case analysis, not as a finalized benchmark or
execution template.

---

## 2. Source Reference

This case analysis refers to the archived "Hana" wedding sequence PDF:

- **Asset name:** Wedding_Series_Hana.pdf
- **Asset location type:** GitHub Release asset
- **Release tag:** v0.1
- **Direct URL:**
  https://github.com/watadani-byte/character-identity-protocol/releases/download/v0.1/Wedding_Series_Hana.pdf
- **Role:** archived visual sequence reference / historical project evidence

The PDF is treated as historical reference material for observed
sequence-continuity drift. It is not treated as a current protocol, finalized
benchmark, or execution template.

> Note: This asset is stored as a GitHub Release attachment, not inside the
> repository tree or under `docs/`.

---

## 3. Case Overview

The "Hana" wedding project was a four-image wedding sequence. The intended fixed
continuity included:

- the same model across the sequence;
- a mermaid-line wedding dress;
- an off-shoulder dress design;
- small earrings;
- a chain necklace;
- a wedding ring;
- no veil;
- no glasses.

The intended sequence progression was:

1. looking downward;
2. extending the hand;
3. viewing the ringed hand from the back-of-hand side;
4. placing both hands against the chest.

The project achieved a degree of visible continuity across the series. However,
the sequence also exposed several reconstruction risks that are important for
later Sequence PAL documentation.

---

## 4. Observed Drift Types

The following drift types were observed or became relevant during the sequence
process.

### 4.1 Wrong-hand drift

A hand movement intended for the foreground or target hand could be applied to
the opposite or background-side hand instead.

This is significant because hand selection is not merely a visual detail. In a
sequence, the identity of the active hand carries continuity information across
steps.

### 4.2 Palm-up / receiving gesture drift

A pose intended to show a controlled hand presentation could drift into a
palm-up, receiving, or "please give me" gesture.

This shows that a hand pose may be reconstructed according to a familiar gesture
pattern rather than the intended sequence-specific pose.

### 4.3 Middle-finger ring drift

The wedding ring could appear on the middle finger rather than the ring finger.

This is a small visual error, but it carries high semantic importance in a
wedding sequence. The error also shows that local detail accuracy cannot be
assumed even when the broader image appears coherent.

### 4.4 Ring-hand reversal

The hand carrying the ring could reverse between left and right.

This matters because the ring hand is a sequence anchor. If the ring shifts to
the wrong hand, later steps may preserve the wrong state or build on an
already-drifted candidate.

### 4.5 Emotion overreaction drift

A quiet recognition moment could drift toward stronger emotional expressions,
such as surprise, delight, or an open-mouth reaction.

This indicates that emotional continuity may be reconstructed toward a more
generic dramatic reading of the scene, even when the intended emotional tone is
restrained.

### 4.6 Color-temperature / tone drift

Repeated local corrections or retries could degrade color temperature, hue
balance, or the overall tone of the image.

This is important because correction attempts may not remain local. A correction
aimed at a hand, ring, or pose can affect global image qualities.

### 4.7 Correction contamination

Attempts to fix one issue could introduce new problems in other areas, such as
the face, hand anatomy, color, costume, or composition.

This case therefore illustrates that local correction is not always locally
contained. A revised candidate may solve the stated problem while degrading
other approved elements.

---

## 5. Human Recognition Was Already Present

This case should not be interpreted as a simple failure of prompt clarity or
human inattention.

The historical working process already included recognition of issues such as:

- left/right reversal;
- ring placement on the middle finger;
- the need to move the ring to the ring finger;
- worsening color or tonal quality;
- the possibility that further correction might not converge;
- the need to purge contaminated context;
- the decision to abandon or discard a chat state.

Therefore, the case does not support the simple claim that a more explicit
prompt would automatically solve the problem.

A safer interpretation is that even when the human operator recognizes the
problem and issues corrective instructions, model-side or execution-structure
mediation can produce further reconstruction of local details such as hands,
fingers, left/right orientation, gaze, emotion, and color.

---

## 6. CIP / PAL Interpretation

Within the CIP / PAL framework, the fixed model framing is:

> **A → (A + C) → A′ → B′**

Where C represents model-side or execution-structure mediation that transforms A
into A′. CIP does not directly control C or A′. Sequence PAL does not directly
eliminate C.

Instead, CIP / PAL governs workflow conditions around the transformation from A
to A′, including:

- validation;
- rejection;
- purge;
- re-binding;
- re-convergence;
- adoption.

In this case, the relevant lesson is not that Sequence PAL can fully control
hands, rings, left/right orientation, or emotional expression. The lesson is
that Sequence PAL can help define:

- what must remain stable;
- what is allowed to change;
- which changes invalidate a candidate;
- where human approval is required;
- when a candidate must be rejected;
- when contaminated context should be purged;
- where recovery should resume from.

Sequence PAL is therefore best understood as a continuity-support and
decision-boundary layer, not as a guarantee of fully automatic sequence
generation.

---

## 7. Agentic Auto-Progression Risk

This case also illustrates a risk relevant to agentic workflows.

If human approval checkpoints are removed, an agentic process may continue
through candidates that appear close enough at a superficial level. In doing so,
it may preserve or compound drift across later steps.

For example, a candidate with an incorrect hand, incorrect ring placement, or
exaggerated emotional expression may still appear visually coherent. An
automated process may treat such a candidate as progress unless the rejection
boundary is explicit.

The risk is not that agentic workflows are inherently unusable. The risk is that
auto-progression without human approval checkpoints may normalize near-miss
candidates and carry their drift forward.

This is especially relevant in sequence work because each accepted candidate
becomes the reference state for later steps.

---

## 8. Distinction Between Continuity and Reproducibility

The "Hana" wedding sequence demonstrates that visual continuity and
reproducibility are not the same thing.

A series may look coherent as a set of images while still failing to preserve
specific target constraints across steps. Conversely, an individual image may
look successful while containing a sequence-breaking error.

Sequence PAL should therefore evaluate not only whether a candidate looks good,
but whether it preserves the approved state required for the next step.

This distinction is central to sequence continuation work.

---

## 9. Documentation Boundary

This document does not define:

- a new PAL-SEQ experiment;
- a Step Prompt Template;
- a generation order;
- candidate counts;
- recovery limits;
- evaluation sheets;
- execution prompts for future image generation.

Those items should be handled in a separate experiment-preparation document or
chat.

This document is limited to documenting the "Hana" wedding project as a
historical case analysis that supports later discussion of Sequence PAL and
agentic risk.

---

## 10. Working Classification

The "Hana" wedding project should be classified as:

- a historical visual sequence reference;
- a case analysis for observed sequence drift;
- supporting evidence for Sequence PAL decision-boundary design;
- a cautionary example for agentic auto-progression risk.

It should not be classified as:

- a failed project only;
- a finalized protocol;
- a benchmark;
- a current execution template;
- proof that Sequence PAL eliminates drift;
- proof that agentic workflows should be rejected entirely.

---

## 11. Summary

The "Hana" wedding sequence is useful because it shows both the promise and the
limitation of context-dependent image sequence generation.

It demonstrates that visual continuity can be achieved to a meaningful degree,
while also showing that hands, rings, left/right orientation, emotion, and color
can continue to drift even under human corrective supervision.

For CIP / PAL, the core lesson is that the value of Sequence PAL is not full
automation. Its value is the explicit definition of continuity constraints,
rejection boundaries, recovery points, purge decisions, and human approval
checkpoints.

This case therefore supports the need for human-controlled sequence governance
rather than unchecked agentic auto-progression.

---

*This document is a case analysis and hypothesis support record.
It is not a finalized protocol, benchmark, or execution template.*
