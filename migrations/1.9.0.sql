CREATE TABLE if not exists  recommendations (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    recommended_stream_id INTEGER REFERENCES streams(id),
    recommended_category VARCHAR,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
