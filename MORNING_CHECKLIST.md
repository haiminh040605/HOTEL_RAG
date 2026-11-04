# Morning readiness checklist

## Before the demo

- [ ] Apply reviewed PostgreSQL migrations `0001_reviews_user_id.sql`,
  `0002_booking_status_default.sql`, and `0003_chat_memory.sql` in order.
- [ ] Restart VS Code terminals after Node.js installation if `node` or `npm`
  is not on PATH.
- [ ] Start FastAPI with `.\start_backend.ps1`.
- [ ] Start Vite with `.\start_frontend.ps1`.
- [ ] Open `http://127.0.0.1:5173` and send a Vietnamese message.
- [ ] Confirm a follow-up message retains city/date/guest slots.
- [ ] Confirm no unverified hotel, invented price, availability, or booking
  confirmation is shown.
- [ ] Review the current DB: no verified hotel/review dataset exists yet.
- [ ] Run `.\.venv\Scripts\python.exe -m pytest -q`.
- [ ] Run `npm.cmd run build` in `frontend/`.

## Known limitations

- Current PostgreSQL hotel data has no verified hotel; grounded recommendations
  therefore return no results until validated official records are loaded.
- No review data or conversation workbook is locally available.
- The chatbot currently uses a deterministic grounded fallback, not an LLM.
- E5 embeddings, Qdrant, hybrid vector retrieval, ABSA training, user/admin UI,
  and live inventory integration are not active.
