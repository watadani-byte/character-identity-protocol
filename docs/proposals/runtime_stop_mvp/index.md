# CIP/PAL Runtime Stop MVP — Proposal Versions

> Latest proposal: **Proposal v0.5 — Producer Approved — Audit Approval and Final ADOPT Pending**.
> Reference date: 2026-09-19. Publication or a repository tag does not grant final adoption or activation.

## Version register

| Version | Document date | Status | Documents |
|---|---|---|---|
| v0.4 | 2026-08-19 | Proposal v0.4 Fixed; Producer Approved; Audit Pending. Historical authoritative baseline for v0.5. | [Preserved PDF](v0.4/runtime_stop_mvp_v0.4_fixed.pdf) |
| v0.5 | 2026-09-19 | Proposal v0.5 — Producer Approved — Audit Approval and Final ADOPT Pending | [Supplied DOCX](v0.5/runtime_stop_mvp_v0.5_producer_approved.docx) · [Supplied PDF](v0.5/runtime_stop_mvp_v0.5_producer_approved.pdf) |

v0.5 incorporates Producer-approved Material changes CHG-027–032 against v0.4. It does not delete, overwrite, or retrospectively alter v0.4. See the [version change record](changelog.md).

## Approval boundary

Producer approval covers the proposal text only. Approval by the three human auditors and final ADOPT remain pending. Safety Profile Activation, effectiveness of Approved P_A, adoption of B′, and an environment-specific Go decision have not been granted by this publication.

The proposal separates Part I (CIP/PAL Core), Part II (High-Risk Execution Safety Profile), and Part III (Governance, Approval & Transition). Runtime enforcement controls belong to the conditionally activated Safety Profile; they are not mandatory for every Core use.

The primary sequence remains:

```text
A → (A + C) → A′ → B′ ≠ B
```

Only human-selected, organized, and approved Context is Canonical A. The proposal document, derived execution state, policy candidates, Approved P_A, evidence, tests, and logs must not automatically be treated as Canonical A or Runtime Gate inputs.

## Terminology boundary

The existing repository uses PAL for **Persistent Anchor Layer**, with persistence and continuity support. Both preserved proposals use PAL for **Conformance Assessment Layer**, an assessment role. This index records that difference; it does not resolve it, redefine the repository's existing PAL, or authorize replacement of existing definitions. Read each version in its stated proposal context.

## Source and viewing formats

The versioned files preserve the supplied bytes; filename normalization is the only packaging change. The v0.4 PDF is the preserved baseline copy. The v0.5 DOCX and PDF are both supplied originals; this index does not establish priority between them if a discrepancy is found. The PDF provides a fixed-layout reading option. Neither this index nor the change record replaces the proposal text.

No full-text Markdown conversion is included. Any later conversion is a derived reading format and must be checked against the human-designated source before publication. A conflict between original formats requires human determination and must not be silently reconciled.
