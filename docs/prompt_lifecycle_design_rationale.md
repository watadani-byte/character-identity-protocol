# Prompt Lifecycle Design Rationale

**Status:** Practical Guide / Design Rationale — not a finalized protocol,
benchmark, or experiment template.

---

## 1. Purpose

This document explains why each prompt form in the CIP/PAL workflow exists,
what problem it was designed to solve, and where in the Identity Lifecycle it
belongs.

The prompts described here are not a linear improvement series. Each emerged
from a different operational problem encountered at a different stage of
image-generation and sequence-generation practice. They should be understood
as distinct artifacts with distinct roles, preconditions, and constraints.

> Prompts are not ranked by quality or power.
> Each exists because a different problem required a different solution.

---

## 2. CIP/PAL Framing

Within the CIP/PAL reconstruction model:

```
A → (A + C) → A′ → B′ ≠ B
```

Where:

- **A** = human original intent, constraints, or approved state
- **C** = model-side or execution-structure mediation that transforms A into A′
- **A′** = task understanding or execution form after C-mediated transformation
- **B′** = generated output or candidate output subject to adoption
- **B** = intended or human-expected result

This is a risk-condition expression. It does not claim that every output
necessarily diverges from B. It keeps the observation structure visible: C may
mediate A into A′, and B′ may differ from the intended B.

CIP/PAL does not directly control C or A′. It supports governance of the
workflow conditions around the transformation from A to A′, including
validation, rejection, purge, re-binding, re-convergence, and adoption.

---

## 3. Prompt Lifecycle

The Identity Lifecycle proceeds through the following prompt sequence:

```
Source A
↓
Minimum Requirements
↓
YAML Prompt (Source of Truth)
↓
Minimal Prompt (Character Exploration)
↓
Long Prompt (Identity Establishment)
↓
Optimization Prompt (Convergence Adjustment)
↓
Ultra-Compressed Prompt (Identity Recall)
```

After convergence is established, series generation uses a repeating state
transition:

```
Converged State
↓
Transition Prompt
↓
Next Approved State
```

Each stage is described below with its design rationale, problem context,
phase, and constraints.

---

## 4. Minimum Requirements

### Problem it solves

Before any prompt is written, there must be a clear definition of what is
required. Without this, prompts may reflect the writer's assumptions rather
than the human operator's approved intent.

### Design Rationale

Minimum Requirements establishes the human-approved source state A. It is the
authoritative baseline against which all derived prompts and generated outputs
are compared. Without it, there is no stable A to drift from.

### Phase

Pre-prompt. The starting point of the entire lifecycle.

### What it does not replace

Nothing. It is the source, not a derived artifact.

### Prerequisites

None.

---

## 5. YAML Prompt (Source of Truth)

### Problem it solves

Natural-language prompts are lossy. When a character definition is translated
into English prose, useful redundancy is removed, prohibitions are weakened,
priority relationships collapse, and structural separation disappears. Each
editing cycle degrades the original intent further.

### Design Rationale

The YAML Prompt preserves the structured source state in a human-reviewable,
diffable, and comment-supporting format. It separates immutable identity
elements, controlled variables, scene variables, reference image policies, and
workflow governance into named sections. Natural-language prompts are derived
projections of the YAML, not equivalents.

The YAML Prompt is not a generation prompt by default. It is a reviewable
master specification.

> YAML = human-approved source state.
> Natural-language prompts = derived artifacts.

### Phase

Source state management. Parallel to all other prompt forms.

### What it does not replace

The YAML Prompt does not replace the Long Prompt, Minimal Prompt, or any other
derived form. It is the source from which those forms are derived.

### Prerequisites

Human-approved Minimum Requirements.

---

## 6. Minimal Prompt (Character Exploration)

### Problem it solves

Long prompts activate more C-mediated transformation, increasing the risk of
unintended A′. Observing how much identity can be recovered from minimal input
reveals which attributes are load-bearing.

### Design Rationale

The Minimal Prompt reduces prompt surface area to reduce optimization pressure
from the model's training priors. It is used to explore reconstruction
behavior, not to establish identity for production use.

A minimal prompt is not merely a short prompt. It is a controlled projection
from a structured source state.

> Minimality without source-of-truth becomes accidental compression.

### Phase

Character exploration. Pre-convergence.

### What it does not replace

The Minimal Prompt is not a substitute for the Long Prompt in
identity-establishment workflows. It is not sufficient for first-generation
use when identity continuity matters.

### Prerequisites

Human-approved Minimum Requirements. Preferably a YAML source state. Convergence is not required.

---

## 7. Long Prompt (Identity Establishment)

### Problem it solves

Without a sufficiently detailed initial prompt, C-mediated transformation
fills missing information with distributional defaults, producing a B′ that
diverges from the intended B. Identity attributes that are not explicitly
stated may be reconstructed in an unintended direction.

### Design Rationale

The Long Prompt makes A dense and explicit before the model forms A′. It
re-injects context, identity conditions, constraints, priorities, prohibited
transformations, and decision boundaries. It is the primary tool for initial
convergence and for re-convergence after drift.

The Long Prompt does not eliminate C. The model may still compress,
summarize, reprioritize, or reinterpret the instruction before producing B′.
However, it reduces the missing information that C might otherwise fill in
freely.

In practical use, the Long Prompt functions more like a convergence-stage
prompt for re-establishing the intended context, constraints, identity
conditions, and decision boundaries before compressed prompts can safely be
used for re-binding or recall.

### Phase

Identity establishment. First generation and re-convergence after drift.

### What it does not replace

The Long Prompt is a derived artifact — a controlled projection of the YAML
source state into natural language. It does not replace the YAML master.

### Prerequisites

Human-approved YAML master or equivalent source state.

---

## 8. Optimization Prompt (Convergence Adjustment)

### Problem it solves

After observing the first generation result, specific drift points become
visible. A general-purpose correction may improve image quality while
introducing new drift. What is needed is a targeted correction that addresses
only the observed deviation from A.

### Design Rationale

The Optimization Prompt targets specific observed drift. Correction must be
aimed at returning to A, not simply improving image quality. It is not a
general optimization of the prompt. It is a drift-correction instrument.

Used before convergence exists, the Optimization Prompt may fill missing
information through C and produce a coherent B′ that is not sufficiently
bound to A.

### Phase

Convergence adjustment. After first generation review, not before.

### What it does not replace

The Optimization Prompt must not be used for first generation. It must not
replace the Long Prompt or the YAML master.

### Prerequisites

Observed B′ and specific drift points must exist. The human-approved source state remains authoritative. Not for first-generation identity establishment.

---

## 9. Ultra-Compressed Prompt (Identity Recall)

### Problem it solves

After convergence is established, re-generating from the full Long Prompt for
every subsequent generation is unnecessary and risks introducing new C at each
step. A lighter recall mechanism is needed that leverages the existing
convergence state.

### Design Rationale

The Ultra-Compressed Prompt works because a human-approved state, effective
constraints, and rejected-drift history already exist. Without those
preconditions, it is insufficient for identity establishment.

> Compressed prompts are not initialization substitutes.
> Compress only after converging.

The Ultra-Compressed Prompt preserves only the identity core, essential fixed
features, allowed variation range, critical drift warnings, and major rejection
boundaries. It is a lightweight key for returning toward a human-approved
anchor, not a complete definition of A.

### Phase

Identity recall after stabilization. Post-convergence only.

### What it does not replace

The Ultra-Compressed Prompt must not be used for first generation, identity
recovery, new character creation, or unapproved scene change. It must not
replace the YAML master or the Long Prompt.

### Prerequisites

Human-approved convergence state. Anchor image. Established convergence
history. Compression safety review passed.

---

## 10. Transition Prompt (Sequence Continuation)

### Problem it solves

In sequence-generation workflows, a character must move through a series of
scenes without losing identity continuity. The Long Prompt is designed for
identity establishment, not for controlled scene-to-scene transition within an
established sequence.

### Design Rationale

The Transition Prompt assumes convergence already exists and focuses on the
state change from one approved scene to the next. It preserves the established
identity while allowing controlled variation in scene, pose, or context.

The Transition Prompt is the tool used when the problem is not "who is this
character" but "how does this character move to the next state."

### Phase

Sequence continuation. After convergence is established.

### What it does not replace

The Transition Prompt must not be used before convergence exists. It does not
replace the Long Prompt for initial identity establishment. It does not
replace the YAML master.

### Prerequisites

Established and human-approved convergence state. Approved anchor image.
Defined target scene or sequence state.

---

## 11. Key Distinctions

### Prompt compression is not initialization

The compressed prompt works partly because a human-approved state, effective
constraints, and rejected-drift history already exist. A short prompt is not
a replacement for that convergence history.

| Prompt type | Operational role |
|---|---|
| Long Prompt | Initial convergence / task-frame re-establishment |
| Optimization Prompt | Drift correction after first generation |
| Ultra-Compressed Prompt | Lightweight recall after stabilization |
| Transition Prompt | Scene or state change within established sequence |

### Identity Establishment vs Identity Recall

Identity Establishment is the governed process of creating a first
human-approved convergence state. It requires the Long Prompt and human
approval at each step.

Identity Recall is the process of re-invoking an already-established identity
state using a lighter mechanism. It requires the convergence state, anchor
image, and Ultra-Compressed Prompt — none of which can substitute for each
other.

Identity Recall is not identity recovery. If the convergence state has been
lost or contaminated, recovery requires re-establishment, not recall.

### YAML is the source, not the prompt

The YAML Prompt is the human-approved master specification. All natural-
language prompts are derived projections. When generation quality degrades,
return to the YAML source — not to the English prompt.

---

## 12. Non-Claims

This document does not claim:

- any prompt form eliminates C;
- any prompt form guarantees identity preservation;
- any prompt form directly controls A′ or model behavior;
- prompts are ranked by quality, power, or version number;
- CIP/PAL directly controls C, A′, or the generative model;
- this document defines a finalized protocol, benchmark, or standard.

---

## 13. Summary

Each prompt form in the CIP/PAL lifecycle exists because a different problem
required a different solution at a different stage of identity-governed
generation work. They are not a linear improvement series.

Understanding why each prompt exists — what problem it solves, what it does
not replace, and what preconditions it requires — is more important than
knowing which is "shorter" or "stronger."

Human approval remains the control point at every stage.

---

*This document is a Practical Guide and Design Rationale record.
It is not a finalized protocol, benchmark, or experiment template.*

*See also: [YAML Prompt Source-of-Truth Pattern](yaml_prompt_source_of_truth_pattern.md) —
[Prompt Compression After Human-Approved Convergence](prompt_compression_after_human_approved_convergence.md) —
[Translation Loss and the YAML-First Principle](column_translation_loss.md) —
[Glossary](glossary.md)*