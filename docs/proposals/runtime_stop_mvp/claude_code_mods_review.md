# Claude Code Mods — v0.6 Review Input

> Status: **Non-normative Review Candidate — Not an Adopted Change or Test Result**.
> Prepared: 2026-10-04. Baseline: Proposal v0.6 Producer Approved, repository commit `c84844069e15db751898dd77ca10c1f134f82632` (v5.107).
> T1–T7 are labels from the supplied Handover, not allocated NT, AC, CHG, or PD identifiers. No tests were executed.

## Conclusion and scope

The documented Mods mechanisms provide concrete threat and test cases for existing v0.6 controls. Their existence alone does not demonstrate a missing normative requirement or require immediate revision of v0.6. Existing requirements address action binding, human approval provenance, independent enforcement, continuity, evidence, and fail-closed behavior. Whether an implementation satisfies them remains untested.

```text
A → (A + C) → A′ → B′ ≠ B
```

A Mod is not automatically C merely because it exists. Its mediation that transforms A into A′ can be mapped to C; governance decisions and rejection themselves are not redefined as C. This is a CIP/PAL mapping, not a claim to have invented Mods or their mechanisms.

## Primary-source check

The sources below were checked on 2026-10-04. They are living documentation, not immutable release evidence; an actual test must pin the installed build and emitted type declarations. No installed Claude Code build was tested here.

| Source | Confirmed scope |
|---|---|
| [Getting started](https://claude.dev/blog/getting-started-with-claude-code-mods/) | Dated October 1, 2026; describes JavaScript/TypeScript modules, event middleware, CLI/Desktop UI and hot reload. Its no-DOM/no-Node sandbox description concerns the module environment; it does not establish least-privilege OS isolation. |
| [Mods reference](https://code.claude.com/docs/en/plugins/mods/reference) | Displayed version v2.1.289; prompt, tool-decision, session-record and UI events. Prefer the installed build's generated types over an older online copy. |
| [Mods overview](https://code.claude.com/docs/en/plugins/mods/overview) | Mods can start processes outside the Bash sandbox. Standard permission prompts cannot be restyled by Mods. Do not infer that arbitrary custom UI is an authenticated approval channel. |
| [Organization controls](https://code.claude.com/docs/en/plugins/mods/admin) | sec-default is conditional on managed settings or Team/Enterprise use. Managed ordering and guard options matter; it is not an unconditional first or external gate. Deny protections for tool calls do not cover every direct Mod filesystem/process operation. |
| [Event failure handling](https://code.claude.com/docs/en/plugins/mods/events) | A failing/timed-out hook can be skipped and processing continued. A catch handler can deny, but does not prove independent enforcement or survival of handler/host failure. |

The announcement URL `https://claude.com/blog/claude-code-mods` was not retrievable through the review tool. The linked repository's full source implementation was not audited. These limitations do not invalidate the narrower documentation checks above.

The Handover's broad UI example must not be reported as demonstrated modification of the standard permission prompt. Test custom/misleading display, approval-source validation and action reuse separately. Existing settings hooks already have blocking capabilities; they are not merely observers.

## Mapping and candidate negative tests

All rows are proposed isolated/mock tests of an explicitly defined, activated high-risk boundary. They do not apply the Safety Profile automatically to ordinary Core use. “Expected” denotes a review/test objective, not a measured outcome or adopted extension.

| Handover case | Failure path | Existing v0.6 coverage | Detection / enforcement point | Expected evidence and unresolved detail | Review classification |
|---|---|---|---|---|---|
| T1 — post-approval rewrite | Mod changes target or arguments after approval. | §§12–13; AC-04, AC-05; provisional AC-25. | Independently normalize and bind the final action before the first effect-capable boundary. | Original/final envelope, hashes, authority decision, boundary observation. Mismatch must not dispatch; a revised action cannot reuse approval. Avoid automatic repeated approval requests under §12. | Test addition candidate; no missing principle established. |
| T2 — misleading UI / reused action | Custom display claims approval, or a click/event is reused for another action. | §13; provisional AC-24; Appendix D NT-01–04, NT-09. | Trusted issuer checks actor, authority, action, nonce, expiry, single-use and preconditions. | Source event plus Gate decision, not screenshot alone. Include a genuine authorized human-event positive control. A valid event does not prove the displayed evidence truthful. Presentation-context binding remains the explicit Appendix D open question. | Test / threat-note candidate. Making presentation-context binding mandatory would be a separate change proposal. |
| T3 — permission bypass | Mod permits a call or performs a direct filesystem/process operation outside the observed tool path. | §§8–9, 12–13; AC-01, AC-14; provisional AC-25. | Inventory and constrain every in-scope effect-capable route at its real effect boundary; tool-chain denial alone is insufficient. | Managed settings/build, route inventory, credentials, actual effect observation and independent Gate evidence. Exercise protected tool denial and direct Mod API paths separately. | Test / threat-note candidate; implementation boundary gap possible, no new principle yet demonstrated. |
| T4 — load-order change | Handler precedence changes after policy/approval binding. | §13 security-relevant configuration fingerprint; AC-05. | Compare effective loaded configuration at approval and dispatch. | Effective order/tier, code and policy identities, before/after fingerprint, refused dispatch. Decide which configuration fields must be included; no universal field list adopted here. | Test candidate; operational specification candidate, classification to be confirmed. |
| T5 — hot reload | Executing Mod code changes while an action remains pending. | §§12.2–14; AC-05, AC-09, AC-18. | Revalidate security-relevant configuration before effect; invalidate stale approval/token where required. | Code identity before/after reload, load event, pending-action state, old-token rejection, lineage-state preservation. If new normative atomicity guarantees are needed, return a concrete gap for human review. | Test candidate; possible later change proposal only on demonstrated gap. |
| T6 — altered/missing logs | Local records conceal transformations, approval events or dispatch. | §§9, 17–17.1; AC-03, AC-11, AC-17, AC-23; provisional AC-25. | Independent audit and effect observation; deny new high-risk dispatch when required evidence fails. | Correlated action evidence with missing/changed/order discrepancies and independent result. Bound retention; do not equate a local transcript with independent evidence or a missing record with proof of no effect. | Test / threat-note candidate. |
| T7 — fail-open | Hook or policy dependency fails and host proceeds. | §§14–16; AC-03, AC-17; provisional AC-25. | Independent control prevents high-risk effect despite skipped hook, failed handler or unavailable monitoring. | Inject throw/timeout/handler or host failure in a mock boundary; compare host continuation with actual boundary outcome. Observe zero unauthorized effects, not merely an error message. | Test candidate; no change needed solely to restate fail-closed. |

## Test prerequisites and limits

Before executing any test, fix the Claude Code version, generated type declarations, OS/user privileges, installed and loaded Mod identities/order, managed settings, sandbox boundaries, trusted approval issuer, Gate and independent observer. Record which direct API, process, filesystem, network and credential paths are inside the declared test boundary. Use isolated substitutes with no real external side effects.

These are proposed evidence fields, not populated parameters or an Activation decision. Preserve original human intent and approved policy, and record transformed prompts/actions separately. Respect retention and access boundaries. Expected timeout values, hash schema, key ownership and enforcement technology remain unassigned.

“Stop and ask again” is not a universal replacement for v0.6 termination. Safe denial/isolation must not wait for approval; renewed human authority is required only where the preserved rules require it. Do not restart an old run, clear lineage state, or loop checkpoints. A stop observed after an effect is not evidence of prevention.

## Decision boundary

Recommended next step: retain this review as a non-normative threat/test candidate. Do not amend the v0.6 originals. Any proposal to mandate a new fingerprint schema, presentation-context binding or stronger enforcement guarantee must identify the missing requirement and be classified under §20.1 by the human. Selecting implementation parameters is distinct from revising normative obligations.

Mods may provide warnings, adapters and supplementary checks. They do not, by their mere presence, establish the independent Runtime Gate, watchdog, authenticated human approval, or audit boundary required by the preserved proposal. No implementation conformance, test pass, adoption, activation or Go is claimed.

## Provenance and version boundaries

Input: `CIP_PAL_v0_6_Claude_Code_Mods_Review_Handover.md`. This document adds a primary-documentation check and assistant-generated mapping; it does not modify the input Handover. v0.6 DOCX was inspected; DOCX/PDF equivalence remains unestablished.

See the [version index](index.md) and [v0.6 DOCX](v0.6/runtime_stop_mvp_v0.6_producer_approved_audit_pending.docx). The repository's Persistent Anchor Layer and the preserved proposal's Conformance Assessment Layer remain distinct as recorded in the index. AC-24/25 remain provisional. No formal identifiers have been allocated.
