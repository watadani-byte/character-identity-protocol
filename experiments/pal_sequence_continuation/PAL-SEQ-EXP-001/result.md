# PAL-SEQ-EXP-001 — Result Record

## Status

- Experiment status: not yet executed
- Research record status: draft
- Result classification: pending
- Lock status at template creation: pending human confirmation

## Candidate Counts

```yaml
planned_primary_candidates: 6
realized_primary_candidates: null
maximum_permitted_recovery_candidates: 6
realized_recovery_candidates: null
maximum_possible_generated_candidates: 12
realized_total_generated_candidates: null
unrealized_primary_candidates_due_to_upstream_stop: null
unrealized_recovery_capacity: null
```

## Field Mapping to manifest.yaml

### Candidate-Level Rates

| result.md field | numerator | denominator (manifest.yaml) |
|---|---|---|
| Primary delta-execution success rate | primary candidates with successful delta execution | candidate_counts.realized_primary_candidates |
| Recovery success rate | recovery candidates approved for sequence continuation | candidate_counts.realized_recovery_candidates |

### Branch-Level Rate

| result.md field | numerator | denominator (manifest.yaml) |
|---|---|---|
| Branch completion rate | branch_counts.completed_branches | branch_counts.registered_branches |

### Branch Completion Detail (per condition)

| Condition | Status | Highest Approved Step | Approved Steps / Planned Steps |
|---|---|---|---|
| A | complete / partial / stopped | null | null / 3 |
| B | complete / partial / stopped | null | null / 3 |

### Reporting Rule for Zero-Denominator Cases

If a rate's denominator is 0 (for example, no recovery candidates were realized), the rate must be reported as `N/A`, not as `0%`. A 0% value would imply that the rate was measured and failed, which is not the same as the rate being undefined due to no applicable cases.

## Neutral Phase 1 Evidence

- status: pending
- realized attempts: null
- rejected neutral candidates retained: null
- selected base frame: null
- approval decision: null
- stopped before condition execution: null
- identity-anchor status: unchanged

## Condition A Per-Step Results

### Step 1
- primary result: null
- recovery history: null
- candidate decision: null
- branch status: null

### Step 2
- primary result: null
- recovery history: null
- candidate decision: null
- branch status: null

### Step 3
- primary result: null
- recovery history: null
- candidate decision: null
- branch status: null

## Condition B Per-Step Results

### Step 1
- primary result: null
- pre-execution review history: null
- recovery history: null
- candidate decision: null
- branch status: null

### Step 2
- primary result: null
- pre-execution review history: null
- recovery history: null
- candidate decision: null
- branch status: null

### Step 3
- primary result: null
- pre-execution review history: null
- recovery history: null
- candidate decision: null
- branch status: null

## Planned but Unrealized Steps

- Condition A unrealized steps due to upstream stop: null
- Condition B unrealized steps due to upstream stop: null
- Backfilled steps: prohibited

## Branch Completion Depth

- Condition A deepest approved step: null
- Condition B deepest approved step: null
- Condition A sequence completed: null
- Condition B sequence completed: null

## Condition Comparison

Pending execution.

## Adverse Effects

Record at least:

- excessive rigidity
- suppression of valid expression
- scene reconstruction
- cumulative drift
- selective-reinjection side effects
- increased identity instability
- branch-chat contamination effects

## Residual Conversation-History Confounder

Rejected candidates may remain in each branch chat history even though they are not designated, attached, or reused as Current Approved Sequence References.

Observed influence: null

## Quantitative Outcome Status

- sequence-step approval rate: null
- primary delta-execution success rate: null
- recovery success rate: null
- background-continuity rate: null
- composition-continuity rate: null
- pose-continuity rate: null
- critical identity violation rate: null
- branch completion rate: null

## Human Visual Assessment

Pending execution.

## Final-Use Adoption Status

- Condition A candidates finally adopted for external use: null
- Condition B candidates finally adopted for external use: null

Sequence approval does not itself constitute final-use adoption.

## Identity-Anchor Status

- Primary Identity Anchor changed: false
- Any generated candidate validated as a new identity anchor: null

## Primary Questions

1. Was character identity preserved across linked steps?
2. Was inherited background, composition, pose, and hand state preserved?
3. Was one permitted delta isolated at each step?
4. Did reduced delta-only execution reduce scene reconstruction?
5. Did Condition B show an operational advantage over Condition A?
6. Did selective re-injection recover drift without broader reconstruction?

## Human Conclusion

Pending execution.

## Interpretation Boundaries

Do not claim:
- universal superiority of delta-only execution
- universal harm from full condition disclosure
- causal superiority of Condition B without per-step evidence
- identity-anchor validation from sequence approval
- sequence success from identity retention alone
