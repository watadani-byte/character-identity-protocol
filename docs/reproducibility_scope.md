# Reproducibility Scope

This document clarifies the conditions under which the Character Identity Protocol has been validated, and the boundaries of current claims.

---

## Validation Scope Summary

| Condition | Status | Notes |
|-----------|--------|-------|
| Single-session, same platform | ✅ Validated | Core use case. Cases 02, 03, 05, 06 |
| Multi-session, same platform | ✅ Validated | Case 05 (Mira, 3 sessions) |
| Cross-platform migration | ✅ Validated | Case 04 (SD → ChatGPT), Case 07 (ChatGPT → Gemini) |
| Cross-model version (same platform) | ⚠️ Observed | Behavior shifts noted; not systematically tested |
| Automated / API-based workflows | ❌ Not tested | Protocol designed for chatbot interaction |
| Video / animation sequences | ❌ Not tested | Out of current scope |

---

## Platform Coverage

| Platform | Role in Validation |
|----------|-------------------|
| ChatGPT (GPT Image 1.5) | Primary development platform — all core cases |
| Stable Diffusion | Source platform for Case 04 migration |
| Gemini (Imagen 3) | Cross-platform replication target — Case 07 |
| DALL-E 3 | Case 06 (serendipitous creation) |

---

## What "Validated" Means Here

Validation in this protocol is:

- **Human-judged** — match rate assessed by trained operator, not automated metric
- **Production-condition** — run in real workflows, not controlled laboratory settings
- **Single-operator** — all cases performed by the same operator
- **Not peer-reviewed** — independent replication has not been formally reported

These are observational records, not controlled experiments.

---

## Session Type Definitions

| Term | Definition |
|------|-----------|
| Single-session | All generation within one continuous chat context |
| Multi-session | Character recalled across separate chat sessions using anchor + UID |
| Cross-platform | Character migrated to a different generative system |

---

## Known Degradation Conditions

The protocol may perform below threshold under:

| Condition | Risk Level | Notes |
|-----------|-----------|-------|
| Large semantic transitions (e.g., outfit → hairstyle change) | Medium | Re-anchor recommended |
| Style domain shift (illustration → photorealistic) | High | Quality loss observed in Case 04 |
| Extended sessions without re-anchoring | Medium | Re-anchor every 10–15 turns recommended |
| Model version update | Unknown | Behavior shift detected in Case 05 Update |
| High-emotional expression change | Medium | Case 02 — managed with mid-session re-anchor |

---

## Open Research Directions

The following have not been tested and represent open questions:

- Cross-operator reproducibility (different human operators)
- Systematic cross-platform benchmark (standardized test set)
- Long-term stability across model updates
- Automated match rate measurement
- Minimum anchor image quality threshold

---

*Status: Observational records as of February 2026.*  
*Independent replication reports welcome via [GitHub Issues](https://github.com/watadani-byte/character-identity-protocol/issues).*
