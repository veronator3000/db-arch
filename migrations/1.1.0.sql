CREATE TABLE if not exists users (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL,
    role_id INTEGER REFERENCES roles(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

