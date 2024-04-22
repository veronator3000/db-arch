CREATE TABLE if not exists chat_messages (
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id),
    stream_id INTEGER REFERENCES streams(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id), 
    FOREIGN KEY (stream_id) REFERENCES streams(id)
);

