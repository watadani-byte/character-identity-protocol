# Case 03: Avedon Project

> All case studies are observational logs from real production
> workflows.\
> Results may vary by model version and configuration.

**Scenario**: Skeletal-level identity control for fashion industry
standards\
**Platform**: ChatGPT (GPT Image 1.5)\
**Protocol**: Advanced anchor + formal validation gates\
**Result**: Audit-ready consistency observed across 38 turns ---
identity preserved through lighting, material, and monochrome
transitions

------------------------------------------------------------------------

## What This Demonstrates

This is the most technically demanding case study.

A ballerina character (Model "A") is held at a fixed pose across 38
generation turns.\
The operator changes only one condition per turn: lighting angle,
material density, exposure, framing, and monochrome conversion.\
Identity, skeletal alignment, and pose are required to remain constant
throughout.

This case suggests the protocol can meet fashion/editorial production
requirements --- where repeatability is often contractually required.

------------------------------------------------------------------------

## Reproducibility Note

Runs were performed under single-session conditions.\
Cross-session behavior may vary by model version and system state.

------------------------------------------------------------------------

## Session Structure

  ------------------------------------------------------------------------
  Phase              Turns              What Changed
  ------------------ ------------------ ----------------------------------
  Anchor             1--10              Identity lock, pose anchor set
  establishment                         

  Skeletal control   11--30             Pose definition tightened
                                        instruction by instruction

  Lighting variation 31--54             Side light, backlight, exposure,
                                        framing

  Material variation 55--66             Skirt material, sheen, specular

  Monochrome +       67--77             Grayscale conversion, background
  background                            variation
  ------------------------------------------------------------------------

------------------------------------------------------------------------

## Analysis

  -----------------------------------------------------------------------
  Metric                              Result
  ----------------------------------- -----------------------------------
  Total turns                         38

  Pose changes                        0 (frozen throughout)

  Conditions varied                   Lighting × 6, Material × 3,
                                      Monochrome × 2, Background × 1

  Match rate threshold                90% (session abandoned if breached)

  Re-anchoring events                 1 (Turn 29)

  Session outcome                     Prompt fixed, contaminated
                                      generations purged
  -----------------------------------------------------------------------

**Key finding**: Identity consistency was preserved across tested
condition variations through skeletal-level prompt control. When
deviation was detected (Turn 77), the session was formally terminated
rather than continued with degraded output.

------------------------------------------------------------------------

## Source

-   Original session log with images (PDF) --- Japanese, full resolution

------------------------------------------------------------------------

## Related

-   Case 01: Baseline Failure --- same workflow without protocol\
-   Technical Mechanism --- how anchor control works
