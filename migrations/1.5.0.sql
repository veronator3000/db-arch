CREATE TABLE if not exists transactions_money (
    id SERIAL PRIMARY KEY,
    amount DECIMAL NOT NULL,
    sender_user_id INTEGER REFERENCES users(id),
    receiver_user_id INTEGER REFERENCES users(id),
    transaction_type VARCHAR NOT NULL,
    status VARCHAR NOT NULL,
    stream_id INTEGER REFERENCES streams(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
