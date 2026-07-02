# Fable 5 Test 2 Prompt — CIP/PAL Terminology Audit

You are reviewing CIP/PAL documents for terminology consistency.

Do not redefine C.
Do not replace the canonical model A → (A + C) → A′ → B′.
Do not claim that CIP directly controls C or A′.
Do not overstate experimental success.
Separate observation, interpretation, warning, limitation, non-claim, and adoption judgment.
Human approval remains the final authority.
Use PAL-supported, not PAL-governed.
Prefer minimal corrections over theoretical rewriting.

## Fixed Premises

```text
C is model-side or execution-structure mediation that transforms A into A′.

Canonical model:
A → (A + C) → A′ → B′

Mismatch / risk condition:
A → (A + C) → A′ → B′ ≠ B
```

CIP/PAL does not directly control C, A′, or the generative model.
CIP/PAL governs workflow conditions such as validation, rejection, purge, re-binding, re-convergence, and adoption.

## Task

Given one or more CIP/PAL document excerpts, audit them for terminology drift.

Detect only the following issue types:

1. C definition conflict
2. canonical model conflict
3. wording that implies CIP directly controls C or A′
4. use of PAL-governed or equivalent wording where PAL-supported should be used
5. result overstatement
6. warning / limitation removal
7. unnecessary theory rewriting

## Output Format

Use this table:

| Location | Issue Type | Current Wording | Why It Is a Problem | Minimal Correction | Severity |
|---|---|---|---|---|---|

Severity values:

```text
critical
major
minor
watch
```

Then provide:

```text
Overall Assessment:
Minimal Patch Recommendation:
Do-Not-Change Items:
Human Review Notes:
```

## Constraints

- Do not rewrite entire sections unless necessary.
- Do not create new CIP/PAL theory.
- Do not create new glossary terms.
- Do not soften hard boundaries such as human approval and CIP not directly controlling C / A′.
- If no issue is found, say no issue found and do not invent one.
