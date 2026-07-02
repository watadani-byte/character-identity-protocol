# Sonnet 5 Comparison Prompt — Same-Task CIP/PAL Auxiliary Model Evaluation

Use this prompt for Sonnet 5 only if time permits.

The purpose is not to benchmark Sonnet 5 generally. The purpose is to compare Sonnet 5 against Fable 5 on the same CIP/PAL auxiliary document-management task.

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

## Same-Task Comparison Rule

Use the same input documents and same task structure used for Fable 5.

Do not improve or expand the task beyond what Fable 5 received unless explicitly asked.

## Output Sections

1. Experiment Summary
2. Result Classification Review
3. Success / Warning / Limitation / Non-Claim Separation
4. Markdown / YAML Consistency Notes
5. GitHub Changelog Draft
6. Next Review Points
7. Risk Notes About Overstatement
8. Human Adoption Recommendation
9. Comparison Notes Against Fable 5

## Required Distinction for PAL-POSE-EXP-001

```text
Step 1:
Identity Copy / visual identity reference from the original approved anchor was used for baseline creation.

Steps 2–4:
The experiment did not re-test Identity Copy from the original anchor.
It used the previous approved state as reference and tested stepwise approved-state carry-forward through controlled pose transitions.
```

Do not claim Identity Recall success.
Do not claim compressed-prompt-alone recall success.
