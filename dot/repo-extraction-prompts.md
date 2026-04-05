# Repo Extraction Prompts

Use these prompts in Claude Code pointed at each repository to extract
architectural understanding before building agents.

---

## Prompt 1: Architecture Extraction

Run against each repo independently.

```
Read the entire codebase and produce an architecture document covering:

1. SYSTEM PURPOSE: What does this application do? What is the core workflow?
2. TECH STACK: Languages, frameworks, databases, queues, external services
3. ENTRY POINTS: Where do requests come in? (API routes, event handlers, cron jobs, UI entry points)
4. DATA MODEL: What are the core entities? How do they relate? What's the schema?
5. HUMAN-IN-THE-LOOP STEPS: Identify every point where the system waits for human input,
   review, approval, or decision. For each, document:
   - What triggers the human step
   - What the human sees/decides
   - What happens after human action
   - Could this be automated? What would be needed?
6. DOCUMENT PROCESSING PIPELINE: How do documents flow through the system?
   - Ingestion → parsing → extraction → validation → storage
   - What formats are supported?
   - What extraction logic exists today?
7. INTEGRATION POINTS: How do frontend and backend communicate?
   - API contracts (REST/GraphQL/WebSocket)
   - Shared types or schemas
   - Authentication flow
8. COMMANDS: How to build, test, run, deploy

Output as a structured markdown document.
```

---

## Prompt 2: Extraction Logic Deep Dive

Run against the backend repo after Prompt 1.

```
Focus specifically on the document extraction and ground truth pipeline:

1. Find all code related to document reading, parsing, or text extraction
2. Find all code related to data extraction, field mapping, or entity recognition
3. Find all code related to ground truth generation, labeling, or annotation
4. For each extraction step, document:
   - INPUT: What goes in (document type, format, fields)
   - PROCESS: What logic is applied (regex, ML model, rules, LLM calls)
   - OUTPUT: What comes out (structured data, confidence scores, extracted fields)
   - VALIDATION: How is correctness checked today?
   - HUMAN STEP: Where does a human intervene and why?
5. Map the full pipeline as a DAG (directed acyclic graph) showing dependencies

Output the pipeline map and identify which steps are deterministic (rule-based)
vs. probabilistic (ML/heuristic) — this determines automation strategy.
```

---

## Prompt 3: Agentic Opportunity Analysis

Run after both previous prompts. Synthesizes findings into an automation roadmap.

```
Based on the codebase, identify the agentic automation opportunities:

For each human-in-the-loop step found, classify it:

AUTOMATABLE NOW (high confidence, deterministic):
- [step] — why it can be automated, what agent would do

AUTOMATABLE WITH VERIFICATION (medium confidence, needs quality gate):
- [step] — what agent does, what verification is needed

KEEP HUMAN (low confidence, regulatory, or judgment-heavy):
- [step] — why it must stay human

For each automatable step, draft:
- The agent's role description (what it does, what tools it needs)
- The input it receives
- The output it produces
- The confidence threshold for auto-approval vs. human review
- The error/fallback behavior
```
