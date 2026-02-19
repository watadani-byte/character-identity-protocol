# Case 02: Wedding Series --- "Hana"

> All case studies are observational logs from real production
> workflows. Results may vary by model version and configuration.

**Scenario**: Emotional progression across 4-shot series with identity
preservation\
**Platform**: ChatGPT (GPT Image 1.5)\
**Protocol**: Basic anchor + match rate monitoring\
**Result**: Identity consistency preserved across 15 turns and 4
distinct compositions

------------------------------------------------------------------------

## What This Demonstrates

Model "Hana" is called with an anchor and held across a 4-shot wedding
series.\
Each shot requires a different pose and emotional expression.\
Emotional variation is the primary risk --- expression changes tend to
drift identity.

This case suggests the protocol can manage emotional state transitions
without significant identity drift.

------------------------------------------------------------------------

## Reproducibility Note

Runs were performed under single-session conditions.\
Cross-session behavior may vary by model version and system state.\
Prompt phrasing and anchor timing were held constant within this
session.

------------------------------------------------------------------------

## Session Structure

  ------------------------------------------------------------------------
  Phase              Turns              What Changed
  ------------------ ------------------ ----------------------------------
  Anchor             1--4               Identity lock, full body
  establishment                         

  Shot 1 --- Shy     5--6               Waist-up, looking down, subject
  glance                                right

  Shot 2 ---         7--10              Left hand extended, ring visible
  Offering hand                         

  Shot 3 --- Ring    11--14             Looking at ring on hand, emotion:
  joy                                   delight

  Shot 4 --- Hands   15                 Eyes closed, satisfied smile
  to chest                              
  ------------------------------------------------------------------------

------------------------------------------------------------------------

## Analysis

  -----------------------------------------------------------------------
  Metric                              Result
  ----------------------------------- -----------------------------------
  Total turns                         21

  Identity preserved                  Yes --- same model across all 4
                                      shots

  Emotional transitions               4 (shy → offering → delight →
                                      satisfied)

  Color drift detected                Yes --- Turn 13, managed with
                                      anchor

  Known limitation                    Left/right consistency appeared
                                      unreliable in this run

  Session outcome                     Prompt fixed, library organized,
                                      chat discarded
  -----------------------------------------------------------------------

**Key finding**: Emotional expression changes appear to be a high-risk
condition for identity drift.\
The protocol contained the drift through match rate monitoring and
mid-session re-anchoring.\
The ring placement issue was treated as a current model limitation
rather than a protocol failure.

------------------------------------------------------------------------

## Source

-   Original session log with images (PDF) --- Japanese, full resolution
    *(coming in next release)*

------------------------------------------------------------------------

## Related

-   Case 01: Baseline Failure --- same workflow without protocol\
-   Case 03: Avedon Project --- advanced skeletal control\
-   Technical Mechanism --- how anchor control works
