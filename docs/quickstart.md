# Quickstart — Character Identity Protocol (CIP)

This guide explains the minimal workflow required to run CIP.

CIP treats character identity as an inference-time adoption-governance problem.

CIP does not attempt to control the model.
It governs the workflow conditions under which reconstructed outputs are validated, adopted, rejected, purged, or re-bound.

CIP operates entirely at inference time and requires no model modification.

The protocol uses three elements:

- Anchor Image
- Minimal Prompt
- Identity Gates

> This guide assumes you are working in an image generation environment with anchor image support (e.g., ChatGPT with GPT Image 1, Gemini, or equivalent).

-----

## Step 1 — Select an Anchor

Choose a **validated identity reference image** that represents the correct character identity.

The anchor should be:

- visually stable
- clearly identifiable
- not a draft or exploratory result

This image becomes the **validated anchor**.

*Anchor selection is operator-owned: the anchor is the target image the operator wants to reproduce. CIP governs the process after anchor selection.*

-----

## Step 2 — Write a Minimal Prompt

The prompt should describe **only invariant attributes**.

Avoid precise numeric constraints.

**Example (unstable):**

- 8-head body ratio
- exact height specification
- precise numeric constraints

**Example (stable):**

- small head relative to height
- long limbs
- modest chest
- full thighs

The goal is **not precise control**.
The goal is to reduce unnecessary reconstruction pressure while the anchor remains the primary identity reference.

Assign a **UID (Unique Identifier)** — a name or label for the character. Used as a stable recall token across cycles and sessions.

-----

## One-Turn Example

```
[Attach anchor image]

Call Model "Hana". Generate.
```

"Hana" is the UID used for recall, not a descriptive prompt.

That's it. The image does the work. The prompt confirms identity, not describes it.

-----

## Step 3 — Generate Iterations

Generate a small batch of outputs (3–5 outputs per turn is typical in demonstrations).

Evaluate each output against the validated anchor using Face Gate, Skeleton Gate, and Proportion Gate.

Apply only one change per turn (pose OR lighting OR outfit — not combined).
Evaluate gate criteria every turn.

-----

## Step 4 — Apply Identity Gates

The protocol defines the validation gates. The exact similarity threshold is an operational parameter.

Identity must pass three checks:

```
PASS ⇔ Face Gate ∧ Skeleton Gate ∧ Proportion Gate
```

If any gate fails, generation must stop immediately.

**Abort the session immediately if:**

- Face identity fails (different person)
- Skeletal proportions shift significantly
- Identity similarity drops below the operational threshold (operator-defined; the ~90% figure is a demonstration value, not a protocol standard)

Do **not** attempt progressive correction after failure.
Reject the failed output, purge contaminated outputs/states, and re-bind to the last validated anchor before re-convergence.

-----

## Step 5 — Hard Abort & Re-Binding

If drift occurs:

```
1. Stop generation immediately
2. Reject the failed output
3. Purge contaminated outputs/states from the failed turn onward
4. Reset the context or environment, including opening a new session if needed
5. Re-bind to the last validated anchor, UID, and minimal prompt
6. Re-converge under full gate enforcement
7. Apply gate validation before adoption
```

This restores the conditions under which adoptable outputs can be produced.

-----

## Common Mistakes

|Mistake                                    |Effect                       |Fix                                  |
|-------------------------------------------|-----------------------------|-------------------------------------|
|Verbose prompt with anchor                 |Optimization overrides anchor|Reduce to minimal prompt             |
|Changing multiple conditions in one turn   |Compound drift               |One change per turn only             |
|Continuing after identity failure          |Contamination accumulates    |Hard abort, purge, re-bind           |
|Using a draft image as anchor              |Weak convergence baseline    |Use highest-purity validated output  |
|Not evaluating gate criteria every turn    |Silent drift undetected      |Evaluate gate criteria every turn    |

-----

## Summary

CIP stabilizes identity through a simple operational loop:

```
Anchor → Minimal Prompt → Generation → Identity Gates
```

If drift occurs:

```
Hard Abort → Reject → Purge → Re-bind → Re-converge → Gate validation before adoption
```

Identity is not generated.
Identity is **recovered**.

-----

*For the full technical explanation, see [Technical Mechanism](technical_mechanism.md).*  
*For stop-condition logic, see [Identity Gates (Quality Gate Addendum)](quality_gate_addendum.md).*
