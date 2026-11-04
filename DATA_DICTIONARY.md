# Data dictionary

## Existing PostgreSQL entities

| Table | Columns (current model) | Relationships |
|---|---|---|
| `users` | `id`, `full_name`, `email`, `password_hash`, `role`, `created_at` | Principal for bookings and optional chat sessions. Password hashes are not API output. |
| `hotels` | `id`, `name`, `address`, `city`, `country`, `description`, `star_rating`, `source_url`, `is_verified`, `created_at` | Parent of rooms, reviews, and bookings. Only `is_verified = true` records are eligible for official chatbot recommendations. |
| `rooms` | `id`, `hotel_id`, `room_type`, `capacity`, `price_per_night`, `currency`, `description` | `hotel_id` references `hotels.id`. Room price is nullable and not proof of availability. |
| `reviews` | `id`, `hotel_id`, nullable `user_id`, `source`, `external_id`, `rating`, `review_text`, `language`, `review_date`, `created_at` | Hotel FK and optional user FK; `user_id` is added by migration 0001. Reviews are opinion data. |
| `bookings` | `id`, `user_id`, `hotel_id`, nullable `room_id`, `check_in`, `check_out`, `number_of_guests`, nullable `estimated_price`, `status`, `created_at` | FKs to users, hotels, and rooms. Status default/NOT NULL is migration 0002. |

## Chat tables (migration 0003)

| Table | Columns | Purpose |
|---|---|---|
| `chat_sessions` | `session_id`, nullable `user_id`, `title`, JSON `slots`, `created_at`, `updated_at` | Owner-scoped conversation and extracted trip preferences. |
| `chat_messages` | `id`, `session_id`, `role`, `content`, JSON `sources`, `created_at` | Ordered user/assistant turns with citation metadata. Cascades on session delete. |

Slots currently include optional `location`, `check_in`, `check_out`,
`number_of_guests`, `budget_min`, `budget_max`, and `preferences`.
