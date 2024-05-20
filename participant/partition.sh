#!/bin/bash

user="${USER}"
password="${PASSWORD}"

export PGPASSWORD="${password}"

psql -h db -U "${user}" -d twich -W << EOF

CREATE TABLE IF NOT EXISTS transactions_money_before_2020 (
    CHECK (created_at < DATE '2020-01-01')
) INHERITS (transactions_money);

CREATE TABLE IF NOT EXISTS transactions_money_after_2020 (
    CHECK (created_at >= DATE '2020-01-01')
) INHERITS (transactions_money);

CREATE INDEX idx_transactions_money_before_2020_created_at ON transactions_money_before_2020 (created_at);

CREATE INDEX idx_transactions_money_after_2020_created_at ON transactions_money_after_2020 (created_at);


-- transactions_money_before_2020
INSERT INTO transactions_money_before_2020 (id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at)
SELECT id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at
FROM transactions_money
WHERE created_at < '2020-01-01';

-- transactions_money_after_2020
INSERT INTO transactions_money_after_2020 (id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at)
SELECT id, amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at
FROM transactions_money
WHERE created_at >= '2020-01-01';


EOF

unset PGPASSWORD
