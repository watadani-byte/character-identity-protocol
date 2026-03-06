# Architecture Diagram — Character Identity Protocol

This document provides visual representations of CIP’s three core mechanisms:
Anchor Attractor, Cycle Stabilization, and Identity Gates.

> All diagrams are operational abstractions. They do not represent proprietary model internals.

-----

## 1. Anchor Attractor Model

*How the anchor guides the model toward a stable identity state.*

```mermaid
flowchart TD
    A[Training Distribution] --> B[Model Exploration]
    B --> C["Anchor Attraction
(reference image dominates)"]
    C --> D[Identity Convergence]
    D --> E{Identity Gates}
    E -->|PASS| F[Accepted Output]
    E -->|FAIL| G[Hard Abort → Re-binding]
    G --> B
```

**Key insight:**  
The anchor does not bypass model optimization.  
It introduces a previously validated solution state that attracts reconstruction toward a known stable region.  
The model optimizes toward that prior rather than reconstructing freely.

-----

## 2. Cycle Stabilization Model

*How identity stability is maintained across multiple generation cycles.*

```mermaid
flowchart LR
    A["Cycle A
Convergence Window"] --> B["Drift Accumulation
(stochastic sampling)"]
    B --> C["Context Stability
Threshold"]
    C --> D["Re-binding
(anchor re-injection)"]
    D --> E["Cycle B
Re-Converged Window"]
    E --> F["Drift Accumulation"]
    F --> G["Re-binding"]
    G --> H["Cycle C
Re-Converged Window"]
```

**Key insight:**  
Stability is not permanent.  
It is chained through disciplined re-convergence cycles.

```
[ Stable State A ]
        ↓
  Drift Accumulation
        ↓
  [ Re-Convergence ]
        ↓
[ Stable State B ]
        ↓
  Drift Accumulation
        ↓
  [ Re-Convergence ]
        ↓
[ Stable State C ]
```

-----

## 3. Identity Gates — Operational Control Flow

*How generation outputs are accepted or rejected.*

```mermaid
flowchart TD
    A["Anchor Image + Minimal Prompt"] --> B[Generation Engine]
    B --> C[Output]
    C --> D{Face Gate}
    D -->|PASS| E{Skeleton Gate}
    D -->|FAIL| Z[Hard Abort]
    E -->|PASS| F{Proportion Gate}
    E -->|FAIL| Z
    F -->|PASS| G[Accepted Output]
    F -->|FAIL| Z
    Z --> H[Re-binding]
    H --> A
```

**Gate policy:**

```
PASS ⇔ Face Gate ∧ Skeleton Gate ∧ Proportion Gate
```

All gates must pass. Any single failure triggers Hard Abort.

> The ≈90% threshold refers to human-judged identity similarity relative to the anchor — not an automated metric.

-----

## 4. Full CIP Operational Architecture

*The complete control loop.*

```mermaid
flowchart LR
    A["Anchor Image + Minimal Prompt"] --> B[Generation Engine]
    B --> C["Identity Gates
Face Gate
Skeleton Gate
Proportion Gate"]
    C -->|PASS| D[Accepted Output]
    C -->|FAIL| E[Hard Abort]
    E --> F[Re-binding]
    F --> G[Re-convergence]
    G --> B
```

-----

## 5. Generation Pipeline — Without vs. With CIP

**Without CIP:**

```
User Prompt
      ↓
┌─────────────────────┐
│  Language Layer      │  Language interpretation
└─────────┬───────────┘
          ↓
┌─────────────────────┐
│  Reconstruction      │  ← Unconstrained
│  A → A'              │  Identity drift emerges here
└─────────┬───────────┘
          ↓
     Output (A')
     (Identity: uncontrolled)
```

**With CIP:**

```
Minimal Prompt  +  Anchor Image ──────────────┐
      ↓                                        │
┌─────────────────────┐                        │
│  Language Layer      │  Reduced load          │
│  (minimal prompt)    │  (fewer constraints)   │
└─────────┬───────────┘                        │
          ↓                                    ↓
┌─────────────────────────────────────────────┐
│  Reconstruction A → A'                       │
│  Anchor guides reconstruction                │  ← Operationally constrained
│  toward a previously converged solution state│
└─────────┬───────────────────────────────────┘
          ↓
     Output converges toward Anchor
          ↓
     Identity Gates (PASS / FAIL)
          ↓
   PASS → Production
   FAIL → Hard Abort → Re-binding
```

**Clarification:**  
Language Layer / Reconstruction / Execution are conceptual abstractions for explanatory purposes. They do not imply knowledge of proprietary model internals.

-----

## 6. Identity Drift Timeline

*How identity similarity degrades over turns and how CIP intervenes.*

```mermaid
flowchart TD
    T1["Turn 1
Identity: PASS ✓"] --> T2["Turn 2
Identity: PASS ✓"]
    T2 --> T3["Turn 3
Identity: PASS ✓"]
    T3 --> T4["Turn 4
Identity: Degrading"]
    T4 --> T5["Turn 5
Identity: FAIL ✗"]
    T5 --> HA[Hard Abort]
    HA --> RB[Re-binding
Anchor re-injected]
    RB --> C1["Cycle B — Turn 1
Identity: PASS ✓"]
    C1 --> C2["Cycle B — Turn 2
Identity: PASS ✓"]
    C2 --> C3["Cycle B — Turn 3
Identity: PASS ✓"]
```

**Key insight:**  
Identity similarity is not maintained indefinitely.  
It degrades gradually through stochastic drift.  
CIP detects failure at the gate level and immediately re-binds the anchor.

```
High  ┤  ████ ████ ████ ░░░░
      │
      │                      FAIL
Low   ┤                        │
      │                        ↓
      │                  Hard Abort
      │                        ↓
High  ┤                  Re-binding
      │                        │
      │              ████ ████ ████ ░░░░
      └─────────────────────────────────→ Turns
           Cycle A             Cycle B
```

-----

## Operational Summary

|Element       |Role                                                 |
|--------------|-----------------------------------------------------|
|Anchor Image  |Primary convergence attractor                        |
|Minimal Prompt|Auxiliary identity constraint                        |
|Identity Gates|Operational validation (Face ∧ Skeleton ∧ Proportion)|
|Hard Abort    |Drift containment — immediate termination            |
|Re-binding    |Anchor re-injection to restart convergence           |
|Cycle         |Bounded convergence window                           |


> CIP does not control the model.  
> It controls the conditions under which the model converges.

-----

*See: [Technical Mechanism](technical_mechanism.md) for theoretical framing.*  
*See: [Quality Gate Addendum](quality_gate_addendum.md) for gate definitions.*