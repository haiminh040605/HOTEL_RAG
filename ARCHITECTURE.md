# Architecture and actual runtime boundaries

## Existing application

- `backend/app/api/`: authentication, hotel, room, review, booking, and chat
  FastAPI routers.
- `backend/app/models/`: SQLAlchemy models.
- `backend/app/core/database.py`: reads the database URL from the root
  environment and creates the SQLAlchemy engine.
- `frontend/`: React/Vite single-page chat client; Vite proxies API routes to
  the FastAPI development server.
- `ml/preprocessing/`: file ingestion and normalization utilities.
- `ml/absa/`: source-label-only TF-IDF/logistic-regression baseline interface.
- `ml/rag/`: lexical BM25 retrieval plus optional E5/Qdrant adapters.

## Chat request path

```text
React chat UI
  -> POST /chat/message
  -> optional JWT identity / guest session UUID
  -> PostgreSQL chat_sessions and chat_messages
  -> merge Vietnamese location/date/guest/budget slots
  -> verified hotel query
  -> BM25 rank
  -> answer and source citations, or explicit no-verified-data response
```

Guest session IDs are UUIDs and act as capabilities. Authenticated chat
sessions are scoped to their owner. Users cannot read another user's sessions.
Messages and slots are stored as application data; do not send secrets or
payment details to the chat.

## Grounding boundaries

- Only hotels with `is_verified = true` can be returned as hotel candidates.
- Reviews are not used to establish official facts, price, or availability.
- The current database has no verified hotels or reviews, so current answers
  must not name a real hotel recommendation.
- The current response mode is `grounded_fallback`, not an LLM.
- E5, Qdrant, reranking, and an LLM provider are not active. The code does not
  report those services as ready.

## Database migrations

Chat memory uses `chat_sessions` and `chat_messages`, created by
`backend/migrations/0003_chat_memory.sql`. Database migrations are manual and
not run at application startup. See README for the ordered migration list.
