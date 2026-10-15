# Early Idea: Human-Reviewed Iterative AI-Assisted Improvement

> **Status: Early Idea / Discussion Note — Not Adopted / Not Verified.**
> This is independent v0.8 discussion material. It does not amend or
> replace the v0.7 Final ADOPT text, approval record, status, or criteria.

## The idea

Could CIP/PAL's way of distinguishing human-approved intent from
model-mediated changes also help people review iterative AI-assisted
improvement?

The idea is to examine each proposed change individually using the
existing sequence:

A → (A + C) → A′ → B′ ≠ B

Canonical A remains the context and intent selected, organized, and
approved by the human. Model interpretations, proposed changes, and
generated results do not automatically inherit that approval or authority.

Possible subjects include revisions to prompts, procedures, or evaluation
criteria. Calling a change an “improvement” does not establish that it
improves the outcome intended by the human.

## A possible review cycle

For each iteration, retain the current human-approved baseline and make
the proposed change, its rationale, and its differences available for
review. Consider the proposal and any available results against the
intended B, while keeping uncertainty and missing evidence visible.

Only changes explicitly adopted by the human would be incorporated into
the baseline that the human selects, organizes, and approves as A for the
next iteration. Neither A′ nor B′ automatically becomes the next A.

If a change is not adopted, it is not incorporated into the next baseline.
Keeping a proposal or review record does not make it an approved source
condition. Adoption of a document change also does not automatically
authorize tool use or external execution.

For example, an AI could suggest adding an evaluation criterion to a
prompt. The human would consider whether the criterion serves the
original purpose or changes it, and decide whether to incorporate it.
The AI's recommendation alone would not change the approved baseline.

## Questions for discussion

- Could this make unintended changes easier to notice across iterations?
- What minimal record would help a human distinguish an adopted change
  from an unreviewed suggestion?
- How could review remain practical without silently transferring
  approval to later changes?

## Limits and relationship to existing versions

This note introduces an early idea, not a formal validation study or an
implementation proposal. It does not demonstrate recursive
self-improvement, effectiveness, safety, or priority over other work.
Prior-work comparison remains a possible future discussion.

Both this idea and the v0.8 discussion materials remain unadopted and
unverified. Publication does not grant normative adoption, audit approval,
Safety Profile Activation, individual execution Go, or final adoption of
B′. Those decisions remain with the relevant human authority.

The v0.7 Final ADOPT text and its recorded approval state remain unchanged.

See the [proposal versions and review-material index](../index.md).
