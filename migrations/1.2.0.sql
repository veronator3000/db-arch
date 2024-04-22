CREATE TABLE if not exists roles_functionalities (
    role_id INTEGER REFERENCES roles(id),
    functionality_id INTEGER NOT NULL,
    min_weight_required INTEGER NOT NULL
);
