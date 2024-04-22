CREATE TABLE if not exists subscribed_users (
    id SERIAL PRIMARY KEY,
    subscribed_user_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
