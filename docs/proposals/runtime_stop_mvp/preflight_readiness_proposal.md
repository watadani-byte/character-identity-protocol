# Preflight Readiness — Change Proposal

> Status: **Proposal / Not Yet Adopted — Producer Review Pending**.
> Prepared: 2026-10-04. Review baseline: v0.6 Producer Approved at repository commit `c84844069e15db751898dd77ca10c1f134f82632` (v5.107).
> Change identifiers: unassigned. Recording this proposal does not amend the baseline or authorize execution.

## Purpose and scope

This proposal addresses readiness of the human-provided input and intended target before further exploration or processing. It is not a test of an already generated result. Its proposed scope is not restricted to high-risk execution. Placement alongside the Runtime Stop MVP proposal identifies a review target, not a decision to make every Core use subject to the Safety Profile.

The following paragraph is reproduced unchanged from the supplied Preflight Handover. Its normative wording is proposed, not effective repository policy.

## Proposed text

> Before further exploration or processing, the AI must check whether the human-provided Canonical A and the human-specified intended/expected output B are present and can be identified, and whether the supplied inputs and requirements contain an unresolved contradiction. If A or B is absent or cannot be established, or an unresolved contradiction is detected, the AI must stop further exploration or processing, identify the missing or conflicting information, and request human clarification. The AI must not silently supply missing content, select between conflicting requirements, or revise Canonical A or B. The human decides how to resolve the issue.

## Unchanged sequence and authority

```text
A → (A + C) → A′ → B′ ≠ B
```

The proposed start condition does not replace this sequence or redefine its inequality as generic failure. Canonical A remains human-selected, organized, and approved Context. A′, B′, and model-derived execution state do not acquire that authority automatically. C does not excuse alteration of A; unnecessary mediation should be reduced or avoided.

In the proposed paragraph, B denotes the human-specified intended/expected output or target, not B′. The relationship of this wording to the preserved v0.6 definition requires the decision below; this proposal does not silently redefine B.

The Handover also offers the following discussion notation:

```text
¬Ready_H(A,B) → ERROR / STOP
```

It is not adopted. Any definition of Ready_H must be independent of A′ and B′. No executable predicate, new state-machine state, or universal contradiction-detection guarantee is established here.

## Focused impact review

| Preserved v0.6 location | Existing treatment | Proposed distinction / decision needed |
|---|---|---|
| §2, B definition | B is an ideal/intended reference under the counterfactual absence of mediation, not necessarily directly observable. | Decide how an identifiable human target relates to that reference. Identifying a target need not mean predicting or observing its exact realization, but that relationship requires an explicit human decision. Do not equate unavailable B′ with absent B. |
| §4, before generation/processing | Human fixes Canonical A before the Producer starts processing. | Candidate insertion location: a readiness paragraph between the current first and second lifecycle steps. No numbering or text has been changed. |
| §5.1 | Finite evidence acquisition and one new assessment may be allowed within the specified budget. | Decide how initial A/B readiness differs from later evidentiary insufficiency; do not silently prohibit the existing acquisition rule or use it to invent missing human intent. |
| §5.2 | Human Checkpoint has limited reserved-authority triggers; uncertainty alone does not trigger it. | Distinguish a clarification request about A/B from a recurring PAL checkpoint. A request must not reopen a closed assessment automatically. Formal adoption needs the finite interaction/termination treatment specified. |
| §12.1 / AC-19 | High-risk transmission preflight checks delivered input against an already established Canonical A and policy. | Initial readiness is a different stage. Keep the two checks separate; neither replaces the other. |
| §20.1 | Material changes and uncertain classifications return to the human. | A new universal stop/request condition can alter workflow obligations. Do not classify adoption as merely Editorial without human determination. Publishing an explicitly unadopted proposal is separate from adoption. |

## Decisions reserved for the Producer

- Confirm the applicability and relationship of B to §2 before inserting the proposed rule into normative text.
- Define the operational boundary of an unresolved contradiction and the minimal inspection needed to identify it. The model must not silently choose a winning requirement or resolve human intent itself. Do not silently weaken the proposed stop on further exploration.
- Specify clarification, waiting, and termination behavior consistent with §§5.1–5.2; no automatic repeated checkpoint or resumed processing is assumed.
- Decide whether to adopt the optional notation at all. It is unnecessary to publish the prose proposal.
- If adopting a substantive requirement, decide the change classification and version process. Preserve the current approved v0.6 originals; do not overwrite them or allocate CHG/AC/PD numbers here.

No proposal adoption, audit approval, final ADOPT, Profile Activation, Approved P_A effectiveness, execution permission, Go, or B′ adoption follows from this document.

## Provenance

Review input: `CIP_PAL_Preflight_Handover_GitHub_and_v0_6.md`, supplied by the human. Proposed paragraph transcribed without editing; the impact review and placement are assistant-generated review candidates.

Baseline: [version index](index.md), [preserved v0.6 DOCX](v0.6/runtime_stop_mvp_v0.6_producer_approved_audit_pending.docx), [version change record](changelog.md). DOCX was inspected for this review; equivalence with the preserved PDF is not asserted.
