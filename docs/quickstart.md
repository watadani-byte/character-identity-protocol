# Quickstart — Character Identity Protocol (CIP)

This guide explains the minimal workflow required to run CIP.

CIP treats character identity as a convergence control problem.

CIP does not attempt to control the model.
It controls the operational conditions under which identity converges.

CIP operates entirely at inference time and requires no model modification.

The protocol uses three elements:

- Anchor Image
- Minimal Prompt
- Identity Gates

> This guide assumes you are working in an image generation environment with anchor image support (e.g., ChatGPT with GPT Image 1, Gemini, or equivalent).

-----

## Step 1 — Select an Anchor

Choose a **converged image** that represents the correct character identity.

The anchor should be:

- visually stable
- clearly identifiable
- not a draft or exploratory result

This image becomes the **identity reference**.

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
The goal is to allow the model to explore its distribution while the anchor attracts convergence.

Assign a **UID (Unique Identifier)** — a name or label for the character. Used as a stable recall token across cycles and sessions.

-----

## One-Turn Example

```
[Attach anchor image]

Call Model "Hana". Generate.
```

“Hana” is the UID used for recall, not a descriptive prompt.

That’s it. The image does the work. The prompt confirms identity, not describes it.

-----

## Step 3 — Generate Iterations

Generate a small batch of outputs (3–5 outputs per turn is typical in demonstrations).

Compare them to the anchor.

Verify identity similarity against the anchor (human evaluation of Face Gate, Skeleton Gate, and Proportion Gate).

Apply only one change per turn (pose OR lighting OR outfit — not combined).
Verify identity similarity every turn.

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
Discard contaminated outputs. Re-anchor in a new cycle.

-----

## Step 5 — Hard Abort & Re-Binding

If drift occurs:

```
1. Abort generation
2. Discard outputs from the failed turn onward
3. Treat the current generation process as contaminated
4. Open new cycle (new session or re-bound context)
5. Re-inject anchor image + minimal prompt
6. Verify identity before proceeding
```

This restores identity convergence.

-----

## Common Mistakes

|Mistake                                    |Effect                       |Fix                                  |
|-------------------------------------------|-----------------------------|-------------------------------------|
|Verbose prompt with anchor                 |Optimization overrides anchor|Reduce to minimal prompt             |
|Changing multiple conditions in one turn   |Compound drift               |One change per turn only             |
|Continuing after identity failure          |Contamination accumulates    |Hard abort, re-anchor                |
|Using a draft image as anchor              |Weak convergence baseline    |Use highest-purity output only       |
|Not checking identity similarity every turn|Silent drift undetected      |Verify identity similarity every turn|

-----

## Summary

CIP stabilizes identity through a simple operational loop:

```
Anchor → Minimal Prompt → Generation → Identity Gates
```

If drift occurs:

```
Hard Abort → Re-bind → Re-converge
```

Identity is not generated.
Identity is **recovered**.

-----

*For the full technical explanation, see [Technical Mechanism](technical_mechanism.md).*  
*For stop-condition logic, see [Identity Gates (Quality Gate Addendum)](quality_gate_addendum.md).*