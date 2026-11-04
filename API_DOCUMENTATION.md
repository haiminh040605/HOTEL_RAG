# API notes

Base URL in development: `http://127.0.0.1:8001`. OpenAPI/Swagger:
`/docs`.

## Chat

### `POST /chat/sessions`

Create a saved session. Authentication is optional; when a valid Bearer JWT is
provided, the session belongs to that user. Guests receive a UUID session ID.
Optional body:

```json
{"title": "Tìm khách sạn Quy Nhơn"}
```

### `GET /chat/sessions`

Lists sessions for the authenticated user. Guests receive an empty list; guest
clients retain their session IDs locally.

### `GET /chat/sessions/{session_id}`

Returns the owner's conversation and extracted slots. An unknown or
unauthorized session returns 404.

### `POST /chat/message`

Send a message. `session_id` is optional on the first turn.

```json
{
  "session_id": null,
  "message": "Tôi muốn tìm khách sạn ở Quy Nhơn"
}
```

Response fields: `session_id`, `answer`, `sources`, `suggested_questions`,
`extracted_slots`, `status`, and `mode`. Current `mode` is
`grounded_fallback`. A response with status `no_verified_data` means no verified
hotel record matched the request.

### `DELETE /chat/sessions/{session_id}`

Deletes only the caller's session. Session deletion cascades to its messages.

## Existing modules

- `/auth/register`, `/auth/login`, `/auth/me`
- `/hotels/` list/create, `/hotels/{hotel_id}` detail/update/delete
- `/rooms/`, `/rooms/hotel/{hotel_id}`, `/rooms/{room_id}` and admin write
  routes
- `/reviews/`, `/reviews/hotel/{hotel_id}`, authenticated review creation
- `/bookings/`, `/bookings/{booking_id}`, `/bookings/{booking_id}/status`

Admin-only writes require the authenticated database user to have role `admin`.
See router source and the generated `/docs` for exact schemas.

## Error behavior

- 401: missing/invalid authentication where required, or invalid optional
  Bearer token.
- 403: authenticated user lacks Admin permission.
- 404: missing entity or resource outside caller's ownership.
- 409: database integrity conflict.
- 422: request validation failure.
- 503: database health probe failed; internal connection details are logged,
  not returned to clients.
