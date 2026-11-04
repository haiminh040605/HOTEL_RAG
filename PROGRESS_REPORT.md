# Progress report — 2026-11-04

## Implemented

- Booking access control, validation, safe pending status, and SQLite pytest
  coverage.
- Review creation/read APIs with JWT owner attribution and a nullable-user
  migration.
- Persistent chat session/message models and migration; Vietnamese slot
  extraction; optional JWT ownership; guest UUID sessions; session isolation.
- Chat retrieval only from verified hotel records using BM25 with citations;
  explicit no-verified-data behavior; no LLM/availability/price claims.
- React/Vite responsive chat interface connected to `/chat` endpoints.
- CSV/JSON/JSONL/XLSX/XLSM normalization, duplicate and blank removal,
  checksums, quality metrics, and hotel-group splitting.
- ABSA source-label validation and TF-IDF/logistic-regression training
  interface. No model was trained because no labeled data is present and
  scikit-learn is not installed.
- Optional multilingual-E5 and Qdrant adapters. Neither service is active.
- API, architecture, data, and morning-readiness documentation.

## Validation evidence

- Python pytest: 42 passed at the last recorded run before the RAG/ABSA tests
  were added; rerun the full suite before handoff.
- Vite production build: passed.
- PostgreSQL connection: read-only `SELECT 1` passed. No migrations were
  automatically applied.
- PostgreSQL counts at inspection: 2 users, 2 hotels (0 verified), 1 room,
  0 reviews, 0 bookings.
- GPU: RTX 3050 Laptop, 4 GiB; available system RAM was about 1.8 GiB. Heavy
  local model download was avoided.
- Node.js LTS and openpyxl were installed for development. Optional AI
  dependencies were not installed.

## Still blocked or incomplete

- PostgreSQL chat tables and Booking status default/NOT NULL remain unapplied
  until the reviewed migrations are run.
- No verified hotel/review dataset or conversation workbook was found.
- No LLM, Qdrant process, or embedding model is active.
- No live booking inventory/price provider is integrated; bookings remain
  pending confirmation.
- Frontend currently focuses on the chatbot rather than the full account,
  booking, and admin product.
