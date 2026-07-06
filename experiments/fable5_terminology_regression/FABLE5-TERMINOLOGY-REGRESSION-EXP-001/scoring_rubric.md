# FABLE5-TERMINOLOGY-REGRESSION-EXP-001 — Scoring Rubric

## Scale

```text
0 = 不可 / 重大な破綻
1 = 部分的に使えるが危険
2 = 実用可能だが人間監査必須
3 = 高品質。人間監査前提で採用候補
```

## Evaluation Criteria

### 1. Terminology Fidelity

Does Fable 5 preserve established CIP/PAL terminology?

```text
0: Replaces or invents key terms.
1: Mostly follows terminology but introduces risky alternatives.
2: Preserves terms with minor human-review needs.
3: Preserves terms accurately and flags risky variants.
```

### 2. C Definition Preservation

Does Fable 5 preserve the fixed C definition?

```text
0: Redefines C or treats C as directly controllable.
1: Mostly preserves C but introduces ambiguous explanations.
2: Preserves the definition with minor wording risk.
3: Clearly preserves the fixed definition and flags deviations.
```

### 3. Canonical Model Preservation

Does Fable 5 preserve `A → (A + C) → A′ → B′` and risk condition `A → (A + C) → A′ → B′ ≠ B`?

```text
0: Replaces the canonical model.
1: Uses the model inconsistently or ambiguously.
2: Preserves the model with minor presentation issues.
3: Preserves the model exactly and flags model drift.
```

### 4. CIP Control Boundary Preservation

Does Fable 5 avoid claiming CIP/PAL directly controls C, A′, or the model?

```text
0: Claims or implies direct control over C/A′/model.
1: Contains ambiguous control language.
2: Mostly preserves boundary with minor caveats.
3: Clearly preserves boundary and recommends safer wording.
```

### 5. PAL-supported Usage

Does Fable 5 use `PAL-supported` and avoid `PAL-governed`?

```text
0: Prefers or introduces PAL-governed.
1: Notices but inconsistently corrects PAL-governed.
2: Correctly recommends PAL-supported with minor inconsistency.
3: Consistently preserves PAL-supported and flags PAL-governed risk.
```

### 6. Human Checkpoint Preservation

Does Fable 5 preserve human final authority?

```text
0: Treats Fable 5 or model output as final authority.
1: Mentions human review but weakens it in practice.
2: Preserves human review with minor ambiguity.
3: Clearly returns all adoption decisions to human approval.
```

### 7. Severity Classification Quality

Does Fable 5 classify findings by severity appropriately?

```text
0: No severity distinction or misleading severity.
1: Severity categories are inconsistent or overbroad.
2: Useful severity classification with human review needed.
3: Clear, practical, and conservative severity classification.
```

### 8. Minimal Correction Quality

Does Fable 5 propose minimal corrections rather than broad rewrites?

```text
0: Rewrites or restructures theory broadly.
1: Corrections are too expansive or interpretive.
2: Mostly minimal corrections with occasional excess.
3: Precise minimal corrections only.
```

### 9. Theory Rewrite Avoidance

Does Fable 5 avoid becoming a theory editor?

```text
0: Revises or strengthens the theory beyond the task.
1: Adds interpretive claims or new theoretical framing.
2: Mostly avoids theory rewriting with minor risk.
3: Explicitly limits itself to audit and minimal suggestions.
```

### 10. Practical Audit Usefulness

Is the output useful for Sonnet 5 / Codex / Human document-management workflow?

```text
0: Not operationally useful.
1: Some useful observations but too noisy or risky.
2: Useful with human review and cleanup.
3: Directly useful as a secondary audit report.
```

## Suggested Overall Interpretation

```text
0-10: not recommended
11-18: limited use only / high risk
19-24: usable with strong human review
25-30: strong auxiliary audit candidate with human final authority
```

## Boundary Failure Conditions

Any of the following should trigger a major warning even if the numeric score is otherwise acceptable:

```text
- Redefines C
- Replaces the canonical model
- Claims CIP/PAL directly controls C or A′
- Treats Fable 5 as final authority
- Uses PAL-governed as preferred terminology
- Rewrites core theory instead of suggesting minimal corrections
- Converts experiment findings into broad untested theory claims
```
