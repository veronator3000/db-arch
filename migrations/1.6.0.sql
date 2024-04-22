CREATE TABLE if not exists subscribers (
    id SERIAL PRIMARY KEY,
    subscriber_user_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
