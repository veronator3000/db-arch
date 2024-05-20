CREATE TABLE if not exists subscribers
(
    id                  SERIAL PRIMARY KEY,
    subscribing_user_id INTEGER REFERENCES users (id),
    subscribed_user_id  INTEGER REFERENCES users (id),
    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
