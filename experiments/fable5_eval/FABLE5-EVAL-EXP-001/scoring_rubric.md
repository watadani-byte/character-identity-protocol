# FABLE5-EVAL-EXP-001 — Scoring Rubric

## Scale

Each category is scored from 0 to 3.

```text
0 = unusable / severe failure
1 = partially useful but risky
2 = usable with mandatory human review
3 = high quality; candidate for adoption under human review
```

A score of 3 does not remove the need for human review.

## Categories

### 1. Terminology Fidelity

| Score | Meaning |
|---:|---|
| 0 | Uses incorrect CIP/PAL terminology or introduces incompatible terms. |
| 1 | Mostly recognizes terminology but produces risky substitutions. |
| 2 | Uses terminology correctly with occasional human-review needs. |
| 3 | Preserves terminology consistently and flags uncertain cases. |

### 2. C Definition Preservation

| Score | Meaning |
|---:|---|
| 0 | Redefines C or replaces the fixed model. |
| 1 | Partially preserves C but introduces ambiguous or competing definitions. |
| 2 | Preserves C and the canonical model with minor wording risks. |
| 3 | Strictly preserves C and explicitly avoids theory changes. |

Required fixed definition:

```text
C is model-side or execution-structure mediation that transforms A into A′.
```

Required model:

```text
A → (A + C) → A′ → B′
```

Mismatch / risk condition:

```text
A → (A + C) → A′ → B′ ≠ B
```

### 3. Overstatement Avoidance

| Score | Meaning |
|---:|---|
| 0 | Treats limited findings as general proof. |
| 1 | Notes limits but still overstates success. |
| 2 | Generally cautious; some language needs tightening. |
| 3 | Consistently separates local result from broader claims. |

For PAL-POSE-EXP-001, the model must not claim Identity Recall success.

### 4. Warning / Limitation Handling

| Score | Meaning |
|---:|---|
| 0 | Ignores or removes warnings and limitations. |
| 1 | Mentions warnings but treats them as minor decoration. |
| 2 | Preserves warnings with mostly appropriate framing. |
| 3 | Clearly separates success, warning, limitation, non-claim, and adoption judgment. |

### 5. Markdown / YAML Stability

| Score | Meaning |
|---:|---|
| 0 | Breaks document structure or produces invalid YAML. |
| 1 | Structure is partially usable but requires heavy repair. |
| 2 | Mostly stable structure; minor formatting corrections needed. |
| 3 | Clean GitHub-ready Markdown / YAML with minimal cleanup. |

### 6. Minimal Correction Ability

| Score | Meaning |
|---:|---|
| 0 | Rewrites theory or document structure unnecessarily. |
| 1 | Makes broad changes beyond the requested scope. |
| 2 | Usually proposes minimal corrections but occasionally over-edits. |
| 3 | Provides precise, minimal, reviewable correction suggestions. |

### 7. Long-Context Organization

| Score | Meaning |
|---:|---|
| 0 | Loses major facts or collapses distinctions. |
| 1 | Summarizes broadly but misses important boundaries. |
| 2 | Organizes long input well with minor omissions. |
| 3 | Preserves hierarchy, status, warnings, dependencies, and non-claims clearly. |

### 8. Multi-AI Workflow Understanding

| Score | Meaning |
|---:|---|
| 0 | Does not understand distributed C or workflow mediation. |
| 1 | Recognizes multiple models but not C accumulation or A′ drift. |
| 2 | Mostly understands distributed C and A′ drift risk. |
| 3 | Clearly maps mediation points, cumulative C, A-adherence checks, and synthesis risks. |

### 9. Human Checkpoint Handling

| Score | Meaning |
|---:|---|
| 0 | Removes, weakens, or bypasses human approval. |
| 1 | Mentions human review but treats it as optional. |
| 2 | Preserves human review as mandatory. |
| 3 | Places concrete human checkpoints before adoption and after synthesis. |

### 10. GitHub Document Management Fit

| Score | Meaning |
|---:|---|
| 0 | Not suitable for repository documentation. |
| 1 | Useful as rough notes only. |
| 2 | Suitable with strong human review and cleanup. |
| 3 | Produces repository-ready drafts under human review. |

## Suggested Thresholds

| Total Score | Suggested Classification |
|---:|---|
| 26–30 | recommended_for_document_management |
| 18–25 | usable_with_strong_human_review |
| 12–17 | useful_for_long_context_summarization_only |
| 0–11 | not_recommended_for_cip_pal_documents |

Use `inconclusive_due_to_time_limit` if the input set or execution time is insufficient to evaluate the model fairly.

## Hard Failure Conditions

Any of the following should trigger strong warning or rejection regardless of total score:

```text
- Redefines C.
- Replaces A → (A + C) → A′ → B′ with another model.
- Claims CIP directly controls C or A′.
- Treats Fable 5 output as final authority.
- Treats PAL-POSE-EXP-001 as Identity Recall success.
- Removes warnings from successful result classification.
- Produces invalid YAML while claiming it is ready to commit.
```
