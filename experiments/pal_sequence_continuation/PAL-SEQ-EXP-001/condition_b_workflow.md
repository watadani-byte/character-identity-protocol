# PAL-SEQ-EXP-001 — Condition B Workflow

## Condition

Condition B — Combined PAL-Supported Delta Continuation

## Attribution

> Condition B evaluates a combined PAL-supported sequence workflow consisting of structured delta preparation, model-assisted diagnostic review, human-governed approval, and reduced delta-only execution.

The experiment does not isolate the causal effect of Prompt Layer alone, Claude audit alone, supplementary GPT review alone, or reduced delta-only execution alone.

## Review Frequency

For every primary step:

- GPT compilation is required
- Claude direct diagnostic audit is required
- separate GPT supplementary review is required
- human pre-execution decision is required

For a recovery attempt:

- a revised package is required
- Claude delta review is required
- a repeat supplementary GPT review is required only when Claude introduces a new revision or the human operator requests it
- a new human pre-execution decision is required

## Per-Step Workflow

```text
Current Approved Sequence Reference
+ inherited-state record
+ registered permitted delta
        ↓
GPT Initial Execution Package
        ↓
Claude direct diagnostic audit
        ↓
Separate GPT over-reconstruction review
        ↓
Human-Governed Pre-Execution Decision
  ├─ PROCEED
  │    → Final Execution Package
  │    → Reduced delta-only execution
  │    → Generated Candidate
  ├─ REVISE
  │    → Revision
  │    → Second human-governed review
  │       ├─ PROCEED → Final Execution Package → Generation
  │       ├─ REVISE  → Further action under the registered review policy
  │       └─ STOP    → No generation; record outcome
  └─ STOP
       → No generation; record outcome
```

Only a human-recorded PROCEED decision authorizes the applicable Condition B Execution Package for generation.

Condition B recovery attempts use the same combined review workflow described above (GPT compilation, Claude direct audit, separate GPT supplementary review, human decision) regardless of whether the attempt is primary or recovery. This is distinct from Condition A, which does not use the combined review workflow for recovery.

## Required Per-Step Records

- Initial Execution Package
- Claude original audit
- Claude revision proposal, if any
- separate GPT supplementary findings
- human decision
- revision instruction, if any
- revised Execution Package, if any
- Final Execution Package
- exact reduced model-facing prompt
- generated candidate
- candidate decision
- branch status

Every review attempt remains in sequence. A later PROCEED does not erase an earlier REVISE or STOP.

## Prompt-Layer Record Fields

- inherited identity state
- inherited costume state
- inherited background state
- inherited pose and hand state
- inherited emotional and lighting state
- permitted delta
- prohibited simultaneous changes
- predicted drift
- selective re-injection, if any
- source traceability

## Execution Rule

The model-facing prompt may be reduced and delta-only. Full inherited state remains in the record.

## Selective Re-Injection

Selective re-injection is permitted only:
- after observed drift
- under the pre-registered rule
- with exact added text recorded before execution
- with human authorization

It may not silently alter the registered permitted delta.

## Human Authority

AI reviews provide diagnostic evidence only.

Human pre-execution decisions:
- PROCEED
- REVISE
- STOP

Candidate-level sequence decisions:
- APPROVE FOR SEQUENCE CONTINUATION
- REJECT FOR SEQUENCE CONTINUATION

Branch-level terminal state:
- STOP SEQUENCE BRANCH
