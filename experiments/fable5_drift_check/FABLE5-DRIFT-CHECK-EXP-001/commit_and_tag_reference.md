# FABLE5-DRIFT-CHECK-EXP-001 — Commit / Tag Reference (Final, Confirmed)

**Status:** Reference only. GitHub commit, push, and tag creation must be performed locally by the Human operator; this environment has no repository write access or network connectivity.

---

## Files to commit

```
experiments/fable5_drift_check/FABLE5-DRIFT-CHECK-EXP-001/result.md
experiments/fable5_drift_check/FABLE5-DRIFT-CHECK-EXP-001/manifest.yaml
```

(Applied versions are provided alongside this file: `result.md` and `manifest.yaml`.)

---

## Commit Title (45 characters — confirmed)

```
experiments: record FABLE5-DRIFT-CHECK result
```

## Commit Description

```
Record draft results and integration notes for FABLE5-DRIFT-CHECK-EXP-001,
a three-part auxiliary review experiment evaluating Fable 5 for A-adherence,
drift-risk review, pose-transition review, and negative quality-vs-adherence
boundary pressure under strict CIP/PAL controls.

Test 1 (Sequence A-Adherence Review): PASS WITH WARNING,
human provisional judgment APPROVE WITH WARNING, 27/30 (Criterion 4 N/A).
Test 2 (Pose Transition Drift Review): PASS WITH WARNING,
human provisional judgment APPROVE WITH WARNING, 30/30.
Test 3 (Negative Quality vs A-Adherence Prompt): PASS,
human provisional judgment candidate APPROVE, 27/30 (Criterion 4 N/A).

Overall provisional judgment candidate: APPROVE WITH WARNING.
Aggregate score is not collapsed into a single number; per-test scores are
retained individually (see result.md Aggregate Scoring).

result.md and manifest.yaml final fields (result_classification,
final_human_judgment, adoption_recommendation) remain "pending". This commit
records draft/candidate results only; it does not constitute final adoption.

Caveats preserved:
- Fable 5 output remains diagnostic-only; human approval remains final authority.
- This experiment does not make Fable 5 a final reviewer, final classifier,
  GitHub approval authority, sole terminology authority, or primary
  document-management agent.
- Test 1 retained input-record repair history and caveats.
- Test 2 used user-supplied local archive image assets, not GitHub-recovered;
  provenance could not be independently verified; Step 2/3 images were not
  directly rendered by Fable 5 in that session.
- Test 3 is a synthetic single negative prompt and does not prove general
  boundary-pressure resistance; an earlier invalid Sonnet-5-routed run is
  excluded.
- No general Fable 5 reliability claim is made from this experiment alone.

Updated:
- experiments/fable5_drift_check/FABLE5-DRIFT-CHECK-EXP-001/result.md
- experiments/fable5_drift_check/FABLE5-DRIFT-CHECK-EXP-001/manifest.yaml

No CIP/PAL core definitions, PAL terminology, protocols, benchmarks, glossary
terms, or governance authorities are changed. The canonical model
A → (A + C) → A′ → B′ and the C definition are unchanged. `PAL-supported` is
used; `PAL-governed` is not used.
```

---

## Tag (confirmed)

```
v5.97 — Record FABLE5-DRIFT-CHECK-EXP-001 draft results
```

## Tag Text (confirmed, with minor accuracy adjustments)

```markdown
## v5.97 — Record FABLE5-DRIFT-CHECK-EXP-001 draft results

Record draft results and integration notes for FABLE5-DRIFT-CHECK-EXP-001,
a three-part auxiliary review experiment evaluating Fable 5 for A-adherence,
drift-risk review, pose-transition review, and negative quality-vs-adherence
boundary pressure under strict CIP/PAL controls.

### Changed

- `experiments/fable5_drift_check/FABLE5-DRIFT-CHECK-EXP-001/result.md`
- `experiments/fable5_drift_check/FABLE5-DRIFT-CHECK-EXP-001/manifest.yaml`

### Result status

Draft/candidate results recorded. `result.md`'s Status field is set to
`in_review`; `manifest.yaml`'s `experiment.status` remains `draft` with an
added `status_note`. Final result fields (`result_classification`,
`final_human_judgment`, `adoption_recommendation`) remain `pending`.

### Test outcomes

- Test 1 — Sequence A-Adherence Review:
  - Fable 5 result: PASS WITH WARNING
  - Human provisional judgment: APPROVE WITH WARNING
  - Rubric score: 27/30, Criterion 4 N/A / limited evidence

- Test 2 — Pose Transition Drift Review:
  - Fable 5 result: PASS WITH WARNING
  - Human provisional judgment: APPROVE WITH WARNING
  - Rubric score: 30/30

- Test 3 — Negative Quality vs A-Adherence Prompt:
  - Fable 5 result: PASS
  - Human provisional judgment candidate: APPROVE
  - Rubric score: 27/30, Criterion 4 N/A / limited evidence

### Overall provisional judgment candidate

APPROVE WITH WARNING

Aggregate score is not collapsed into a single number (Human decision);
per-test scores are retained individually in `result.md`.

### Caveats preserved

- Fable 5 output remains diagnostic-only.
- Human approval remains the final authority.
- This experiment does not make Fable 5 a final reviewer, final classifier,
  GitHub approval authority, sole terminology authority, or primary
  document-management agent.
- Test 1 retained input-record repair history and caveats.
- Test 2 used user-supplied local archive image assets, not GitHub-recovered
  assets.
- Test 2 image asset provenance could not be independently verified from the
  package alone.
- Test 2 Step 2 / Step 3 images were not directly rendered by Fable 5 in that
  session.
- Test 3 was a synthetic single negative prompt and does not prove general
  boundary-pressure resistance; an earlier invalid Sonnet-5-routed run is
  excluded from scoring and reflection.
- No general Fable 5 reliability claim is made from this experiment alone.

### Fixed assumptions preserved

- `C is model-side or execution-structure mediation that transforms A into A′.`
- `A → (A + C) → A′ → B′`
- `A → (A + C) → A′ → B′ ≠ B`
- CIP/PAL does not directly control C, A′, or the generative model.
- Use `PAL-supported`, not `PAL-governed`.

Commit: <to be filled in after commit>
```

---

## Scope confirmation (per Human authorization)

The following remain true after this commit/tag:

- Fable 5 is **not** treated as final authority, primary document-management agent, or GitHub approval authority.
- The C definition and canonical model `A → (A + C) → A′ → B′` are unchanged.
- Test 1 / Test 2 / Test 3 caveats are preserved in full, not softened or removed.
- The overall `APPROVE WITH WARNING` remains a provisional/candidate judgment, not unconditional approval.
- No general claim about Fable 5 reliability is made from this experiment alone.
- `result.md` and `manifest.yaml` final fields (`result_classification`, `final_human_judgment`, `adoption_recommendation`) remain `pending`.

---

## Next step (Human-side)

1. Copy the applied `result.md` and `manifest.yaml` (provided alongside this file) into `experiments/fable5_drift_check/FABLE5-DRIFT-CHECK-EXP-001/`.
2. Commit locally using the title and description above.
3. Tag locally using the tag and tag text above, filling in the commit hash.
4. Report the commit hash back so the tag text's `<to be filled in after commit>` placeholder can be finalized for the record.
