# CIP/PAL Development History

> **Status: Approved for repository inclusion.**
>
> **Repository:** [character-identity-protocol](https://github.com/watadani-byte/character-identity-protocol)  
> **Historical baseline:** `5ba8e69af03d9e5d86daee27a9bdb8491caf26cc`  
> **Prepared:** 2026-09-07

## 1. Purpose and scope

This document traces the recorded development of Character Identity Protocol (CIP) and Persistent Anchor Layer (PAL). It distinguishes early observations, later terminology, formal statements, and operational proposals.

The purpose is to make the development record traceable. It is not a claim of worldwide priority, patentability, scientific validation, or implementation completeness. Later definitions are not presumed to have existed in the earliest records.

This is a selected development timeline, not a complete commit log. Milestones describe what particular documents recorded. They do not independently establish that the documents' technical claims were demonstrated in practice.

## 2. Evidence and dating policy

Three dates must remain distinct:

| Category | Meaning | Required evidence |
|---|---|---|
| Conceptual Origin | A private formulation or recorded observation | Original message or manuscript, with its own timestamp and provenance |
| First Public Record | A record becoming accessible to others | Evidence of public availability at the relevant time |
| Formalization Milestone | A formulation appearing in a recorded document | The document at a fixed commit, its metadata, and the relevant change |

The timeline below uses **Git-recorded dates**, not independently verified publication dates. Author and committer timestamps are reported separately in the supporting audit. For the milestone commits listed here, they match. Their original `+09:00` offset is preserved.

A root commit, a tag, or a statement such as “Initial public release” does not by itself establish when the repository became publicly accessible. Dates written inside documents are also distinct from the commits that introduced those documents.

“Earliest located” means earliest within the reported search scope, not earliest anywhere. A term's first located occurrence is not automatically the first occurrence of the underlying idea. Conversely, an earlier related idea does not establish that the later name or complete definition already existed.

### Evidence scope and document provenance

This document draws on the read-only **CIP/PAL commit.history.md history audit**, dated 2026-09-07T20:53:14+09:00, and the preceding handover and preliminary investigation.

The audit reports examination of 1,011 commits reachable from the baseline `main`, with 941 distinct changed-file blobs: 891 UTF-8 text blobs and 50 non-text blobs. Four PDFs were additionally searched using extracted text; image text and PDF rendering/OCR were not exhaustively examined. The audit reports no merge commits and a non-shallow history. Deleted refs, history preceding a force-push, private conversations, and records outside the inspected history are not guaranteed to be covered.

The auditing environment could not refresh remote refs during that audit because of a DNS failure. This baseline therefore identifies the inspected history, not a claim that the remote repository remains unchanged.

The audit's accompanying search scripts, JSON ledgers, extracted evidence, and verification file were not supplied with the report used to prepare this document. Its exhaustive-search claims have not been independently reproduced during drafting. Fixed-commit references below identify the evidence to inspect; they are not a substitute for reviewing it.

## 3. Genesis Statement candidate

The handover supplies the following Japanese statement as a candidate record of the original problem formulation. Its wording and symbols are preserved:

> 「B という出力が欲しくて A と言う入力を入力したとする。A → B の経路探索は最適化と言えるが A に C を足して A ‘ とし、A’ → B’ とする事を最適化とは言わない」

The statement distinguishes pursuing an intended output from changing the input through an added C and obtaining a different output. It is relevant to the history of the problem being addressed.

**Provenance status:** The original message and its message-level timestamp have not been supplied. The quotation is currently supported by the handover, not by an independently inspected original conversation export.

This quotation alone does not establish when the complete present-day sequence, Canonical A, the PAL extensions, or runtime control proposals were formulated.

## 4. Conceptual origin and first public record

| Question | Current evidence | Status |
|---|---|---|
| When was the Genesis Statement written? | Quotation in the handover; original message not supplied | Pending |
| What is the root of the inspected Git history? | `e9341ed4b1a9cf19f8f14746b5a650a35869fa63`, recorded 2026-02-10T18:50:54+09:00 | Identified in the inspected history |
| What did the root README say about release status? | It described February 2026 as an initial public release | Document self-description |
| When did that record first become publicly accessible? | Contemporaneous visibility evidence not supplied | Pending |

The root README contained the repository title, an anchor-based reconstruction claim, a minimal-prompt/converged-image formulation, and statements about identity preservation and production cases. Documentation was marked as forthcoming. This establishes the content of an early repository record; it does not independently verify the case outcomes or the exact publication time. [Root README](https://github.com/watadani-byte/character-identity-protocol/blob/e9341ed4b1a9cf19f8f14746b5a650a35869fa63/README.md)

## 5. Selected development timeline

All times below are Git author and committer times, matching in the cited records. Each source link is fixed to the relevant full commit hash.

| Git-recorded timestamp | What the record contains | What this evidence does not establish | Evidence |
|---|---|---|---|
| 2026-02-10T18:50:54+09:00 | Root README: anchor-based reconstruction, minimal prompts with converged images, and identity-preservation claims | The complete current formulation, independently validated case outcomes, or exact public availability | [E01 — README](https://github.com/watadani-byte/character-identity-protocol/blob/e9341ed4b1a9cf19f8f14746b5a650a35869fa63/README.md) |
| 2026-02-11T16:54:36+09:00 | Internal reconstruction using A-prime notation, plus Face/Skeleton/Proportion validation gates and failure-triggered stopping | The complete C-mediated sequence or the later adoption-governance architecture | [B01/B02 — Early README](https://github.com/watadani-byte/character-identity-protocol/blob/d0ab6332cce6a2059bce021ecad9e7a6d3b9ecb5/README_with_case7.md) |
| 2026-02-22T02:20:33+09:00 | Explicit rejection after a failed identity gate; human-validated primary gates; auxiliary logs separated from the decision | Completion of every later approval or adoption rule, or technical enforcement of those rules | [B04/B05 — Quality Gate Addendum](https://github.com/watadani-byte/character-identity-protocol/blob/482ffb6e4ed6bb8296d0b080df6afcbc27b80393/docs/Character_Identity_Protocol_Quality_Gate_Addendum.md) |
| 2026-02-28T17:13:26+09:00 | Anchor re-binding after an environment reset, followed by re-convergence under identity validation gates | Demonstrated cross-environment effectiveness; the text retained pending-validation qualifications | [B06/B07 — README](https://github.com/watadani-byte/character-identity-protocol/blob/981154c09dc2623e2e67dceec2932416a6cd2144/README.md) |
| 2026-03-21T18:50:12+09:00 | Definitions of A, C, intended B, actual B-prime, and mismatch; C described through internal constraints | Absence of A-prime elsewhere in the repository; this particular initial file omitted it from its sequence | [E02 — Model explanation](https://github.com/watadani-byte/character-identity-protocol/blob/bb099818a8524a91c3432a59b1ad9df0086c19c5/docs/model_a_c_b.md) |
| 2026-03-21T19:26:54+09:00 | A C-mediated sequence including A-prime, with the mismatch condition elsewhere in the same document | A single uninterrupted rendering of the current complete sequence | [B08 — Integrated document](https://github.com/watadani-byte/character-identity-protocol/blob/66b6e6f2c78c17e62fc4bf7eaac114fda2b57b07/docs/cip_integrated.md) |
| 2026-03-22T12:20:09+09:00 | A notation note connecting A-prime to the earlier explanation in `model_a_c_b.md` | The repository-wide first appearance of A-prime or approval of the historical equality notation as the current definition | [B09 — Notation note](https://github.com/watadani-byte/character-identity-protocol/blob/356bc48f04fb97249c404b46dfea2ccede44b7a2/docs/model_a_c_b.md) |
| 2026-03-29T13:01:14+09:00 | Persistent Anchor Layer named as an observational hypothesis for cross-session reference persistence | A February publication date or completed systematic validation | [E03 — PAL column](https://github.com/watadani-byte/character-identity-protocol/blob/6a5991b70219e5af4634f0ed533d32489b43ee6d/docs/column_pal.md) |
| 2026-03-31T06:42:40+09:00 | PAL developed as an external persistence layer for validated identity materials, distinguished from model-weight updates | PAL's first naming or completion of controlled validation | [B10 — PAL hypothesis](https://github.com/watadani-byte/character-identity-protocol/blob/0bf2b5e0b58f5538b6f9dcede8f46e29e0287e48/docs/pal_hypothesis.md) |
| 2026-03-31T12:54:48+09:00 | Structured source definitions distinguished from natural-language delivery projections through a YAML-first approach | The later general definition or name Canonical A | [B11 — Translation loss](https://github.com/watadani-byte/character-identity-protocol/blob/da48996690525e880a0e4e437a2772e1cab31540/docs/column_translation_loss.md) |
| 2026-04-17T11:58:04+09:00 | Adoption, rejection, purge, re-binding, and auditability identified as CIP governance functions, distinct from reference guidance | Complete operational definitions or implementation of all those functions | [B14 — Technical mechanism](https://github.com/watadani-byte/character-identity-protocol/blob/0c1cbc3b47b33c0ed902113142c9937c4917d453/docs/technical_mechanism.md) |
| 2026-04-20T11:57:14+09:00 | CIP explicitly presented as adoption governance between generation and adoption | Implementation completeness or independent validation of all associated claims | [B15 — README](https://github.com/watadani-byte/character-identity-protocol/blob/7bdebe860988c8ba3e42d453c86e9ecc5f0c4ed9/README.md) |
| 2026-05-12T19:28:48+09:00 | The complete sequence written continuously; C described as generative mediation and A-prime as A transformed under C | First existence of all component ideas, which have earlier records | [B16 — Model revision](https://github.com/watadani-byte/character-identity-protocol/blob/7cfe6dc7e64f257ecc05fd88359c3e1e11528df8/docs/model_a_c_b.md) |
| 2026-05-16T14:41:26+09:00 | C Taxonomy distinguishes observed output drift from diagnosis of likely mediation | Direct measurement or conclusive identification of internal mechanisms | [B17 — C Taxonomy](https://github.com/watadani-byte/character-identity-protocol/blob/03b9c2a68a251a611d3d71e2fb5d97e3c1b3f2fa/docs/c_taxonomy.md) |
| 2026-06-04T09:59:02+09:00 | Human editorial judgment and organizational approval themselves explicitly excluded from C | A claim that every surrounding workflow condition is C | [B18 — Scope boundary](https://github.com/watadani-byte/character-identity-protocol/blob/9f9bd103dcc9f1d628f024ca2084f787e5abe1cc/docs/model_a_c_b.md) |
| 2026-06-04T15:22:00+09:00 | Model-side and execution-structure mediation explicitly included when they transform A; surrounding structures are not C merely because they exist | A deployed Runtime Gate or technical enforcement of the stated boundaries | [B19 — Mediation scope](https://github.com/watadani-byte/character-identity-protocol/blob/738e26cde7852811b0f5efbbe7760db7021b2673/docs/model_a_c_b.md) |
| 2026-06-14T04:30:28+09:00 | PAL Prompt and Conformance Assessment layers proposed as experimental extensions; source, translation, candidate generation, and human/CIP adoption distinguished | A finalized PAL specification or proof that the extensions improve outcomes | [E04/B20 — Experimental architecture](https://github.com/watadani-byte/character-identity-protocol/blob/93d447ce2eea53c01ba0881c8c3849552f143c04/docs/pal_prompt_and_conformance_layers.md) |
| 2026-06-14T20:44:48+09:00 | A defined through approved PAL source conditions and the intended request, separately from the reconstructed state and generated candidate | An executed experiment or a general naming milestone for Canonical A | [B21 — Smoke-test protocol](https://github.com/watadani-byte/character-identity-protocol/blob/f5730d0c0197e1f2304e0118f95eb4aac46f50d1/docs/pal_prompt_layer_experiment_protocol.md) |
| 2026-06-24T12:01:14+09:00 | A described as human intent, constraints, or approved state, separately from the mediated state | Full equivalence to every part of the current Canonical A definition | [B26 — Multi-AI mediation](https://github.com/watadani-byte/character-identity-protocol/blob/62c07970df3ec9cb2eac6c33e595a1f4f1a3bcfe/docs/multi_ai_mediation_and_cumulative_a_drift.md) |
| 2026-06-26T13:53:12+09:00 | A explicitly described as the human-approved source state in a proposed operational pattern | First use of the name Canonical A or completion of a universal specification | [B22 — Source-of-truth pattern](https://github.com/watadani-byte/character-identity-protocol/blob/fd90e5ec5ca2ecc9050abb5647aab5f11e43cb1b/docs/yaml_prompt_source_of_truth_pattern.md) |

The evidence identifiers correspond to entries in the supporting audit. They distinguish evidence records, not protocol versions.

## 6. Current formulation used for this history

The governing sequence for this document is:

```text
A → (A + C) → A′ → B′ ≠ B
```

The historical distinction is between **earlier component descriptions**, **their combination in one document**, and **their continuous written formulation**. This does not require changing any historical quotation.

For the current task, Canonical A means Context selected, organized, and approved by the human. It remains distinct from C, A-prime, B-prime, and model-derived execution state. AI extraction or summary does not automatically become Canonical A.

The inspected repository contains related descriptions of approved source conditions and derived states. The audit did not establish the first definition of **Canonical A as a name**. The current task's definition must not be backdated on the strength of related language alone.

At the inspected baseline, PAL means **Persistent Anchor Layer**. PAL Prompt Layer and PAL Conformance Assessment Layer are documented as experimental extensions, not replacements for PAL's name or for human adoption authority. CIP governs the adoption process; PAL supports persistence and continuity. [Baseline README](https://github.com/watadani-byte/character-identity-protocol/blob/5ba8e69af03d9e5d86daee27a9bdb8491caf26cc/README.md)

The Runtime Safety Profile v0.4 remains **Proposal under the supplied handover conditions**. Its source document and approval record were not inspected in this audit. No implementation or public-date milestone for that proposal is assigned here.

## 7. Historical discrepancies and open questions

### 7.1 PAL's February label and March commit

The PAL column was added in the inspected history on 2026-03-29, while its closing status line names February 2026. The meaning of that month—observation, drafting, or another event—has not been established. Both are retained without converting the document's label into a publication date. [PAL column](https://github.com/watadani-byte/character-identity-protocol/blob/6a5991b70219e5af4634f0ed533d32489b43ee6d/docs/column_pal.md)

### 7.2 Early purge wording and case attribution

A 2026-02-19 version of `docs/case_01_failure_log.md` contains a Case 03/Avedon heading and wording about purged generations. The audit identifies a content replacement and inconsistent case/count information. This supports an early recorded use of the word, but not a verified Case 01 purge event or a complete normative purge definition. It is excluded from the main milestone table pending clarification. [Historical case file](https://github.com/watadani-byte/character-identity-protocol/blob/6b334e969ce8931f25aeaff2224a8370ee73fbf5/docs/case_01_failure_log.md)

The earliest explicit operational definition of purge—including what is removed from active use and what evidence is retained—remains a follow-up question. A use of the word and a listing of governance functions should not be presented as that complete definition.

### 7.3 A document replacement within PAL history

On 2026-04-05, `docs/pal_hypothesis.md` contained an Anomaly Response Protocol separating access from authority. Its presence at that path is evidence of a recorded document, not proof of an uninterrupted conceptual expansion of the PAL hypothesis. The intent of the replacement remains unresolved. [Historical replacement](https://github.com/watadani-byte/character-identity-protocol/blob/684dd59b32055c5bbe5512878d83eb94a9e549c4/docs/pal_hypothesis.md)

### 7.4 PAL-governed and PAL-supported wording

The initial 2026-06-14 experimental architecture used PAL-governed wording while assigning adoption authority to humans and CIP. A same-day revision at 04:43:49 changed the subtitle to PAL-Supported, while other wording remained. Historical quotations must retain those differences; that revision alone does not establish completion of all terminology corrections. [Subtitle revision](https://github.com/watadani-byte/character-identity-protocol/blob/1817b82e9760238da7dc72ee010dce5c70edb19f/docs/pal_prompt_and_conformance_layers.md)

### 7.5 Handover terminology

The original handover's section 2.2 labels PAL as Conformance Assessment Layer. This differs from the repository's PAL name and its distinction between persistence support and diagnostic extensions. The handover wording has been inspected during drafting; its intended referent still requires human determination. This discrepancy is not authorization to redefine PAL in the repository.

### 7.6 Statements about C and present instructions

Some historical text states that eliminating C is not the purpose of the described protocol or pattern. The current human instruction nevertheless requires continued effort to eliminate C, and prohibits using an explanation of C as an excuse.

This history preserves historical statements as evidence and retains the present instruction without narrowing it to this audit or declaring the difference resolved. Any substantive reconciliation belongs in a separately reviewed change, not a silent alteration of history. [Historical pattern statement](https://github.com/watadani-byte/character-identity-protocol/blob/fd90e5ec5ca2ecc9050abb5647aab5f11e43cb1b/docs/yaml_prompt_source_of_truth_pattern.md)

### 7.7 Remaining evidence gaps

- The Genesis Statement's original message and message-level timestamp.
- Contemporaneous evidence of first public availability.
- The original provenance of the PAL document's February label.
- The first named definition of Canonical A within or outside the inspected history.
- The complete operational purge-definition milestone.
- Source documents for Runtime Gate, an external watchdog, authoritative external-state Outcome Verification, and Runtime Safety Profile v0.4.
- Independent reproduction using the audit's accompanying evidence and search files.

Unlocated material is not declared nonexistent. No guessed dates or commit identifiers are assigned to these gaps.

## 8. External developments and comparison boundary

External frameworks and standards were not examined in this audit. No external chronology or precedence comparison is asserted in this document.

A later comparison, if adopted, should occupy a separate section with independently verified source dates and narrowly described similarities. It must not be inserted into CIP/PAL's internal origin record. Similar terminology, a later external publication, or an unsuccessful search does not establish priority or independent invention.

## 9. Review and publication boundary

The content of this document has been reviewed and approved by the human author for repository inclusion. Unresolved evidence questions remain explicitly marked; approval does not convert them into verified findings.

Future substantive changes remain subject to human review. Approval of this document does not by itself authorize automated repository operations, commits, pushes, tags, or releases.

Before publication, review the selected evidence and decide how to retain the supporting audit, resolve or explicitly preserve the open questions, and confirm the final filename and location. Unresolved origin and publication dates can remain openly marked as pending; they need not be filled with estimates to produce a useful history.
