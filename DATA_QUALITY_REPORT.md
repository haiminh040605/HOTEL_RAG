# Data quality report

Checked 2026-11-04. This report describes only locally observable data; it
does not claim that external datasets have been downloaded.

## Workspace

- `data/raw/`, `data/processed/`, and `data/knowledge_base/` contain no
  project data files.
- The specifically requested
  `bo_du_lieu_danh_gia_va_hoi_thoai.xlsx` was not found in the workspace.
- No external review or ABSA labels were used to train a model.

## PostgreSQL (read-only)

- Connection and `SELECT 1`: passed.
- `users`: 2 rows.
- `hotels`: 2 rows; verified hotels: 0.
- `rooms`: 1 row.
- `reviews`: 0 rows.
- `bookings`: 0 rows.
- All inspected hotel/room/booking user-facing FK columns were present.
- `bookings.status` was nullable with no database-level default before migration
  0002. There were no existing booking rows or null statuses at inspection.
- No review labels were invented and no production rows were changed.

## Pipeline behavior

`ml/preprocessing/pipeline.py` produces source SHA-256 checksums, row counts,
blank/duplicate/language-filter counts, and missing hotel/rating/language
counts. Source files are read-only. Group splitting keeps each `hotel_id` in a
single split. Small or absent datasets must not be interpreted as model
evaluation results.
