# Agentic Document Extraction Architecture

## System Overview

Multi-agent pipeline for automating document extraction and ground truth generation.
Replaces human-in-the-loop steps progressively using confidence-gated routing.

## Maturity Ladder

```
Level 0: Human does everything
Level 1: Agent extracts, human verifies every result          ← start here
Level 2: Agent extracts, human verifies low-confidence only   ← target
Level 3: Agent extracts + self-verifies, human audits samples ← banking-grade goal
Level 4: Fully autonomous with exception routing              ← long-term
```

For a bank, Level 3 is the realistic target — full autonomy with audit sampling.

## Agent Pipeline

```
┌─────────────────────────────────────────────────────┐
│                  ORCHESTRATOR AGENT                   │
│  (routes documents, manages pipeline, tracks state)  │
└──────────┬──────────────┬──────────────┬────────────┘
           │              │              │
    ┌──────▼──────┐ ┌────▼──────┐ ┌────▼───────────┐
    │  EXTRACTION  │ │ VALIDATION│ │ GROUND TRUTH   │
    │  AGENT       │ │ AGENT     │ │ AGENT          │
    │              │ │           │ │                │
    │ Reads docs,  │ │ Compares  │ │ Produces final │
    │ extracts     │ │ against   │ │ labeled output │
    │ structured   │ │ schema +  │ │ with confidence│
    │ data         │ │ rules     │ │ scores         │
    └──────────────┘ └───────────┘ └────────────────┘
           │              │              │
           ▼              ▼              ▼
    ┌─────────────────────────────────────────────────┐
    │              HUMAN REVIEW GATEWAY                 │
    │  Routes to human when confidence < threshold     │
    │  Auto-approves when confidence >= threshold      │
    │  Logs all decisions for audit                    │
    └─────────────────────────────────────────────────┘
```

## Memory Layer

Three memory types required for banking document extraction:

```
1. SCHEMA MEMORY     → What fields exist for each document type
                        Stored as JSON schemas, versioned in repo

2. GROUND TRUTH      → Verified extraction examples
                        Stored in database, versioned and auditable

3. CORRECTION MEMORY → What the agent got wrong + human fixes
                        Feeds back into prompt engineering
                        Stored at ground_truth/corrections/{document_type}.jsonl
```

## Frontend / Backend Repo Integration

```
frontend-repo/
  └── Human review UI
      - Displays extracted fields with confidence scores
      - Allows field-level correction
      - Submits corrections back to ground truth store

backend-repo/
  └── Extraction pipeline
      - Document ingestion + OCR
      - Agent orchestration
      - Confidence scoring
      - Human review gateway (routes by threshold)
      - Ground truth storage
```
