# Quickstart: Character Identity Protocol

> This guide assumes you are working in an image generation environment with anchor image support (e.g., ChatGPT with GPT Image 1.5, Gemini, or equivalent).

-----

## What You Need

1. **Anchor image** — the best output you have of the character. One image only. High identity, not a draft.
   
   *Anchor selection is operator-owned: the anchor is simply the target image the operator wants to reproduce; CIP governs the process after anchor selection.*
1. **Minimal prompt** — factual attributes only. No adjectives, no mood words. Aim for under 30 words.
1. **UID (Unique Identifier)** — a name or label for the character. Used as a stable recall token across cycles and sessions.

-----

## One-Turn Example

```
[Attach anchor image]

Call Model "Hana". Generate.
```

“Hana” is the UID used for recall, not a descriptive prompt.

That’s it. The image does the work. The prompt confirms identity, not describes it.

-----

## Basic Session Flow

1. Attach anchor image + minimal prompt → Generate
1. Verify match rate (human judgment: face, skeleton, proportions — relative to anchor; “match rate” refers to identity similarity relative to the anchor image).
1. If confirmed → proceed with instructions
1. If drift detected → re-anchor immediately (attach anchor image again)
1. One change per turn (pose OR lighting OR outfit — not combined)
1. Check match rate every turn

-----

## When to Abort

**Abort the session immediately if:**

- Face identity fails (different person)
- Skeletal proportions shift significantly
- Match rate drops below operational threshold (typically ~90%)

Do **not** attempt progressive correction after failure.  
Discard contaminated outputs. Re-anchor in a new cycle.

-----

## Hard Abort & Re-binding Procedure

```
1. Abort generation
2. Discard outputs from the failed turn onward
3. Open new cycle (new session or re-bound context)
4. Re-inject anchor image + minimal prompt
5. Verify identity before proceeding
```

-----

## Common Mistakes

|Mistake                                 |Effect                       |Fix                           |
|----------------------------------------|-----------------------------|------------------------------|
|Verbose prompt with anchor              |Optimization overrides anchor|Reduce to minimal prompt      |
|Changing multiple conditions in one turn|Compound drift               |One change per turn only      |
|Continuing after identity failure       |Contamination accumulates    |Hard abort, re-anchor         |
|Using a draft image as anchor           |Weak convergence baseline    |Use highest-purity output only|
|Not checking match rate every turn      |Silent drift undetected      |Verify every turn             |

-----

*For the full technical explanation, see [Technical Mechanism](technical_mechanism.md).*  
*For stop-condition logic, see [Identity Gates (Quality Gate Addendum)](quality_gate_addendum.md).*