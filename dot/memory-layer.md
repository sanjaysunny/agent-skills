# Agent Memory Layer

How agents maintain state and learn over time in the document extraction pipeline.

## Three Memory Types

### 1. Schema Memory
**What:** Canonical definition of what fields to extract per document type.
**Where:** `ground_truth/schemas/{document_type}.json`
**Who writes it:** Architect/developer initially, updated when doc formats change.
**Who reads it:** Extraction agent at the start of every extraction.

```json
{
  "document_type": "bank_statement",
  "version": "2.1",
  "fields": {
    "account_number": { "type": "string", "required": true, "min_confidence": 0.95 },
    "statement_date": { "type": "date", "required": true, "format": "YYYY-MM-DD" },
    "opening_balance": { "type": "currency", "required": true },
    "closing_balance": { "type": "currency", "required": true },
    "transactions": { "type": "array", "required": false }
  },
  "auto_approve_threshold": 0.90
}
```

### 2. Ground Truth Memory
**What:** Verified extraction examples used as few-shot context.
**Where:** Database table `ground_truth_examples`, also exported to `ground_truth/examples/`
**Who writes it:** Ground truth generator agent (from human-verified results).
**Who reads it:** Extraction agent loads 3 recent examples before each extraction.

**Why it matters:** Few-shot examples are the single biggest lever for extraction accuracy.
A new document variant with 5 verified examples outperforms prompt engineering alone.

### 3. Correction Memory
**What:** Log of every agent mistake and human fix.
**Where:** `ground_truth/corrections/{document_type}.jsonl`
**Who writes it:** Ground truth generator when human corrects an extraction.
**Who reads it:** Humans doing prompt improvement; drift detection process.

## Memory Lifecycle

```
New document type introduced
        │
        ▼
Schema defined manually
        │
        ▼
First 20-50 documents: human reviews ALL extractions
        │
        ▼
Ground truth store populated (few-shot examples available)
        │
        ▼
Confidence threshold gates applied (agent auto-approves high-confidence)
        │
        ▼
Correction log accumulates
        │
        ▼
Quality metrics monitored for drift
        │
        ▼
Schema or prompt updated if drift detected
        │
        └──→ Cycle repeats
```

## Session Memory (Per Extraction Run)

For a single agent session, keep context focused:

```
Load at session start:
  - Schema for this document_type
  - 3 most recent verified examples
  - Any known issues flagged for this doc_type (from drift report)

Do NOT load:
  - Examples from other document types
  - Full correction history (too noisy)
  - Metrics or aggregate stats
```

## Implementation Notes

- Ground truth must be **versioned** — never overwrite, always append
- Schemas must be **tagged with effective dates** — document formats change
- Corrections must be **anonymized** before use as training data
- Memory stores must be **backed up** and included in disaster recovery
