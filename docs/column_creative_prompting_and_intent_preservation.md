# Creative Prompting and Intent Preservation

**Status:** Operational observation / short column — not a finalized protocol
or benchmark.

---

## 1. Purpose

This note documents an operational observation about creativity-oriented
prompting techniques and their relationship to intent preservation within the
CIP/PAL framework.

The core observation is that creativity-expansion techniques can be useful, but
may also increase model-side mediation C and accelerate the transformation from
A into A′ if used before the protected boundary of A has been defined.

---

## 2. Core Observation

Within the CIP/PAL reconstruction model:

```
A → (A + C) → A′ → B′
```

Where:

- **A** = human original intent, constraints, or approved state
- **C** = model-side or execution-structure mediation that transforms A into A′
- **A′** = task understanding or execution form after C-mediated transformation
- **B′** = generated or adopted output

Creativity-oriented prompt techniques — such as cross-domain analogy, SCAMPER,
reverse prompting, radical reframing, or "avoid the obvious answer" — are
designed to invite associations, reinterpretations, analogies, alternatives,
substitutions, inversions, omissions, and unexpected transformations.

These are expansion tools, not preservation tools.

When applied without first defining what must remain fixed, they may increase
model-side mediation C, moving A′ farther from the original human-approved A.

---

## 3. Expansion Is Not Preservation

Creativity-oriented techniques can be valuable for brainstorming, variation,
reframing, and exploration. This note does not treat them as inherently harmful.

However, the intent of expansion techniques is to move away from the obvious,
expected, or literal interpretation. This is precisely the opposite of what
intent-preservation workflows require.

If A's boundary has not been defined before an expansion technique is applied,
the model may reconstruct A in a direction that the human operator did not
approve. The result may be a creative and coherent B′ that is not A-adherent.

> High-quality B′ is not necessarily A-adherent B′.

---

## 4. Suggested Practical Rule

> **Expand only after preserving.**

Define what must remain fixed before inviting creative transformation. Creativity
should operate inside the approved frame, not rewrite the frame itself.

---

## 5. Suggested Workflow

The following is an operational heuristic only. It is not a finalized protocol
or benchmark.

```
Approved intent A
        ↓
Fixed elements
        ↓
Variable elements
        ↓
Drift boundaries
        ↓
Creativity-oriented technique
        ↓
Human review
        ↓
Adoption or rejection
```

Defining fixed elements, variable elements, and drift boundaries before applying
a creativity technique may help make the acceptable transformation range more
explicit for later human review.

---

## 6. Human Review Remains Required

Even when fixed elements and drift boundaries have been defined in advance,
human review before adoption remains necessary.

Creativity-oriented techniques may produce useful B′ candidates. They do not
guarantee A-adherent B′. The human operator retains final adoption authority.

---

## 7. CIP/PAL Interpretation

From a CIP/PAL perspective, creativity-oriented techniques can be understood as
intentional increases in the invitation range of C. They are useful when
exploration is the goal. When preservation is the goal, they should be applied
only within a frame that has already been fixed by human-approved constraints.

CIP/PAL does not directly control C or A′. It governs the workflow conditions
around the transformation from A to A′, including validation, rejection, purge,
re-binding, re-convergence, and adoption.

In this context, defining fixed elements, variable elements, and drift
boundaries before applying expansion techniques is a workflow-level constraint
on the conditions under which C operates — not a direct control of C itself.

---

## 8. Non-Claims

This note does not claim:

- creativity-oriented prompting is inherently harmful;
- expansion techniques always increase drift;
- CIP/PAL directly controls C or A′;
- prompt techniques guarantee identity or intent preservation;
- preservation-oriented workflows should never use creative techniques;
- this note defines a finalized protocol, benchmark, or standard.

---

## 9. Summary

Creativity-oriented prompt techniques are expansion tools. They may increase
model-side mediation C and accelerate the transformation of A into A′ if
applied before fixed elements, variable elements, and drift boundaries are
defined.

When the task goal is preservation, expansion should follow preservation, not
precede it. Human review before adoption remains necessary regardless of the
technique used.

> Expand only after preserving.

---

*This document is an operational observation and short column.
It is not a finalized protocol, benchmark, or standard.*
