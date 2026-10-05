# CIP/PAL Runtime Stop MVP — Proposal Versions

> Latest proposal: **Proposal v0.7 — Final ADOPT**. CR-07 (Ready_H) is included.
> Reference date: 2026-10-05. Publication or a repository tag does not grant Safety Profile Activation, Approved P_A effectiveness, individual execution Go, or B′ adoption.

## Version register

| Version | Document date | Status | Documents |
|---|---|---|---|
| v0.7 | 2026-10-05 | Proposal v0.7 — Final ADOPT. CR-07 (Ready_H) included; Producer re-approved and, per §23, unanimously approved by the three human auditors. Safety Profile Activation, Approved P_A effectiveness, Go, and B′ adoption remain separate, pending decisions. | [v0.7 Final ADOPT text](v0.7/runtime_stop_mvp_v0.7_final_adopt.md) · [Local Harness Validation Addendum](v0.7/CIP_PAL_v0.7_Local_Harness_Validation_Addendum_2026-10-05.md) · [Documentation Package Preflight Record](v0.7/CIP_PAL_v0.7_Documentation_Package_Preflight_Record_2026-10-05.md) |
| v0.4 | 2026-08-19 | Proposal v0.4 Fixed; Producer Approved; Audit Pending. Historical authoritative baseline for v0.5. | [Preserved PDF](v0.4/runtime_stop_mvp_v0.4_fixed.pdf) |
| v0.5 | 2026-09-19 | Proposal v0.5 — Producer Approved — Audit Approval and Final ADOPT Pending | [Supplied DOCX](v0.5/runtime_stop_mvp_v0.5_producer_approved.docx) · [Supplied PDF](v0.5/runtime_stop_mvp_v0.5_producer_approved.pdf) |
| v0.6 | 2026-09-27 | Proposal v0.6 — Producer Approved — Audit Approval and Final ADOPT Pending. Producer ADOPT decision recorded; final ADOPT not yet effective. | [Supplied DOCX](v0.6/runtime_stop_mvp_v0.6_producer_approved_audit_pending.docx) · [Supplied PDF](v0.6/runtime_stop_mvp_v0.6_producer_approved_audit_pending.pdf) |

v0.5 incorporates Producer-approved Material changes CHG-027–032 against v0.4. It does not delete, overwrite, or retrospectively alter v0.4. See the [version change record](changelog.md).

v0.6 is a separately preserved revision of v0.5. Its Appendix A records the Producer’s 2026-09-27 ADOPT decision on the reviewed draft; Section 23 retains the audit prerequisite for final ADOPT. The earlier versions and their historical status records remain unchanged.

v0.7 is a separately preserved revision of v0.6, incorporating Producer-approved Material change CR-07 (Ready_H) and recording, in its §23 and Appendix F, a unanimous audit approval and the resulting Final ADOPT. It does not delete, overwrite, or retrospectively alter v0.6, v0.5, or v0.4, and their recorded statuses above are unchanged. For this publication, v0.7 is supplied as Markdown; no separate v0.7 DOCX or PDF is included in the received package. The linked Local Harness Validation Addendum and Documentation Package Preflight Record are Editorial/Evidence records under §20.1; they support v0.7 but are not themselves normative text and do not extend Final ADOPT to Safety Profile Activation, Approved P_A effectiveness, Go, or B′ adoption.

## Approval boundary

Producer approval covers the proposal text only. For v0.4, v0.5, and v0.6, approval by the three human auditors and final ADOPT remain pending. For v0.7, Producer re-approval and unanimous approval by the three human auditors are both recorded per §23 and Appendix F; this index does not itself independently verify that audit record beyond what is recorded in the document. For every version, Safety Profile Activation, effectiveness of Approved P_A, adoption of B′, and an environment-specific Go decision have not been granted by this publication.

The proposal separates Part I (CIP/PAL Core), Part II (High-Risk Execution Safety Profile), and Part III (Governance, Approval & Transition). Runtime enforcement controls belong to the conditionally activated Safety Profile; they are not mandatory for every Core use.

The primary sequence remains:

```text
A → (A + C) → A′ → B′ ≠ B
```

Only human-selected, organized, and approved Context is Canonical A. The proposal document, derived execution state, policy candidates, Approved P_A, evidence, tests, and logs must not automatically be treated as Canonical A or Runtime Gate inputs.

## Terminology boundary

The existing repository uses PAL for **Persistent Anchor Layer**, with persistence and continuity support. The preserved v0.4, v0.5, v0.6, and v0.7 proposals use PAL for **Conformance Assessment Layer**, an assessment role. This index records that difference; it does not resolve it, redefine the repository's existing PAL, or authorize replacement of existing definitions. Read each version in its stated proposal context.

## Source and viewing formats

The versioned files preserve the supplied bytes; filename normalization is the only packaging change. The v0.4 PDF is the preserved baseline copy. The v0.5 DOCX and PDF are both supplied originals; this index does not establish priority between them if a discrepancy is found. The PDF provides a fixed-layout reading option. Neither this index nor the change record replaces the proposal text.

The supplied v0.6 DOCX and user-provided PDF are also retained without alteration. The revision-preparation handover designated a v0.5 DOCX as the baseline for that review; this does not silently establish format precedence for the new v0.6 pair or change the earlier v0.5 archive policy. Full textual equivalence of the v0.6 formats has not been established. Appendix A identifies the reviewed draft hash, not the hash of these final supplied files.

The supplied v0.7 Markdown is published as received. This index does not establish whether other source formats exist.

No full-text Markdown conversion is included for v0.4–v0.6. Any later conversion is a derived reading format and must be checked against the human-designated source before publication. A conflict between original formats requires human determination and must not be silently reconciled.

## Review inputs — not adopted amendments

The following documents are review material, not incorporated changes to the preserved v0.6 proposal. Publication does not grant adoption, audit approval, activation, execution permission or Go. The v0.6 record above remains unchanged by them, and they are distinct from v0.7's own CR-07 (Ready_H), which is adopted normative text in v0.7 itself.

- [Preflight Governance — RFC Draft](preflight_readiness_proposal.md): proposed initial A/B readiness rule, including a later Ready_H procedure-review and 3 Chat Method elaboration, separate from transmission preflight and result evaluation; Producer decisions remain pending.
- [Claude Code Mods — v0.6 Review Input](claude_code_mods_review.md): primary-source review and candidate mappings/tests; no test results or immediate normative revision claimed.
