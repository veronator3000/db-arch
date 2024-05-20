#!/bin/bash

DB_USER=${USER}
DB_NAME="twich"
DB_PASSWORD=${PASSWORD}
sleep_time=${BACKUP_SCHEDULE}

#время для частоты обновления в секундах думайте

BACKUP_DIR="/docker-entrypoint-initdb.d/backups_res"

BACKUP_COUNT=5

TIMESTAMP=$(date +'%Y%m%d%H%M%S')
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

export PGPASSWORD="$DB_PASSWORD"

mkdir -p "$BACKUP_DIR"

sleep "$sleep_time"

pg_dump -h db -p 5432 -U "$DB_USER" -d "$DB_NAME" > "$BACKUP_FILE"

BACKUP_FILES_COUNT=$(ls -1 "$BACKUP_DIR"/*.sql | wc -l)
if [ "$BACKUP_FILES_COUNT" -gt "$BACKUP_COUNT" ]; then
    ls -1t "$BACKUP_DIR"/*.sql | tail -n +$(($BACKUP_COUNT + 1)) | xargs rm -f
fi

unset PGPASSWORD

echo "backup created: $BACKUP_FILE"
